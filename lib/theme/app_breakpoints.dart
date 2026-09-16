/// Points de rupture responsive — un seul point de décision par écran,
/// via `MediaQuery.sizeOf(context).width` ou `LayoutBuilder`, jamais au
/// niveau de `main.dart`/`app.dart` (voir CLAUDE.md section 2.1 : chaque
/// écran reste testable indépendamment).
///
/// - `< kTabletBreakpoint` : layout téléphone (colonne unique, navigation
///   par onglets bas d'écran, écrans plein écran).
/// - `>= kTabletBreakpoint` : layout tablette (grilles, `NavigationRail`,
///   panneaux maître-détail).
/// - `>= kDesktopBreakpoint` : variante tablette large (paysage/iPad Pro) —
///   grilles à 3 colonnes, contenus côte à côte plutôt qu'empilés.
const double kTabletBreakpoint = 600;
const double kDesktopBreakpoint = 900;

/// `true` si la largeur disponible appelle le layout tablette.
bool isTabletWidth(double width) => width >= kTabletBreakpoint;

/// `true` si la largeur disponible appelle la variante large (second seuil).
bool isDesktopWidth(double width) => width >= kDesktopBreakpoint;
