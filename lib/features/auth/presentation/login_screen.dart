import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/result.dart';
import '../../../theme/app_colors.dart';
import 'auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _tenantSlugController = TextEditingController();
  final _twoFactorController = TextEditingController();
  bool _requiresTwoFactor = false;
  bool _obscurePassword = true;
  bool _submitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _tenantSlugController.dispose();
    _twoFactorController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _submitting) return;
    setState(() => _submitting = true);
    await ref.read(authControllerProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          tenantSlug: _tenantSlugController.text.trim(),
          twoFactorCode: _twoFactorController.text.trim().isEmpty ? null : _twoFactorController.text.trim(),
        );
    if (mounted) setState(() => _submitting = false);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (previous, next) {
      final error = next.error;
      if (error == null) return;
      if (error is TwoFactorRequiredException) {
        setState(() => _requiresTwoFactor = true);
        return;
      }
      final message = error is AppException ? error.message : 'Une erreur inattendue est survenue.';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColors.brand, borderRadius: BorderRadius.circular(18)),
                    child: const Icon(Icons.inventory_2_outlined, color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'CNX-ONE Patrimoine',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: -0.4, color: AppColors.ink),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Connectez-vous avec votre compte CNX-one',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: AppColors.ink3, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _tenantSlugController,
                    textInputAction: TextInputAction.next,
                    decoration: _decoration('Organisation', hint: 'ex. cnx-one', icon: Icons.business_outlined),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Requis' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: _decoration('Email', hint: 'vous@organisation.com', icon: Icons.mail_outline_rounded),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Requis';
                      if (!v.contains('@')) return 'Email invalide';
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    textInputAction: _requiresTwoFactor ? TextInputAction.next : TextInputAction.done,
                    onFieldSubmitted: (_) => _requiresTwoFactor ? null : _submit(),
                    decoration: _decoration(
                      'Mot de passe',
                      icon: Icons.lock_outline_rounded,
                      suffix: IconButton(
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined, size: 20),
                      ),
                    ),
                    validator: (v) => (v == null || v.length < 8) ? '8 caractères minimum' : null,
                  ),
                  if (_requiresTwoFactor) ...[
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _twoFactorController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(),
                      decoration: _decoration('Code de vérification', hint: '6 chiffres', icon: Icons.pin_outlined),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Code requis' : null,
                    ),
                  ],
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submitting ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brand,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 0,
                      ),
                      child: _submitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Text('Se connecter', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _decoration(String label, {String? hint, IconData? icon, Widget? suffix}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: icon != null ? Icon(icon, size: 20) : null,
      suffixIcon: suffix,
      filled: true,
      fillColor: AppColors.card,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.brand, width: 1.5)),
    );
  }
}
