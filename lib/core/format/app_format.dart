import 'package:intl/intl.dart';

/// Formatage des nombres/dates affichés à l'écran — cohérent avec le
/// prototype de référence (séparateur de milliers façon `fr-FR`, dates `jj/mm/aaaa`).
abstract final class AppFormat {
  static final _fcfa = NumberFormat.decimalPattern('fr_FR');

  static String fcfa(num value) => '${_fcfa.format(value)} F';

  static String date(DateTime? value) {
    if (value == null) return '—';
    return '${_pad2(value.day)}/${_pad2(value.month)}/${value.year}';
  }

  static String time(DateTime value) => '${_pad2(value.hour)}:${_pad2(value.minute)}';

  static String _pad2(int n) => n.toString().padLeft(2, '0');
}
