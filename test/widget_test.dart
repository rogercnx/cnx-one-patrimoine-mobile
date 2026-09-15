// Test de fumée : l'app démarre et affiche l'écran Accueil du module Patrimoine.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cnx_one_patrimoine/app.dart';

void main() {
  testWidgets('Accueil se charge et affiche la campagne en cours', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: CnxOnePatrimoineApp()));
    await tester.pumpAndSettle();

    expect(find.text('Inventaire'), findsOneWidget);
    expect(find.text('Scanner un bien'), findsOneWidget);
  });
}
