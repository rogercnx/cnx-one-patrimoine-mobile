// Test de fumée : sans session stockée, l'app démarre sur l'écran de connexion.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cnx_one_patrimoine/app.dart';

void main() {
  testWidgets('Sans session, le guard redirige vers l\'écran de connexion', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: CnxOnePatrimoineApp()));
    await tester.pumpAndSettle();

    expect(find.text('CNX-ONE Patrimoine'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });
}
