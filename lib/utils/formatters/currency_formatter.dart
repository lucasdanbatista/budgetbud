import 'package:intl/intl.dart';

import 'formatter.dart';

class CurrencyFormatter implements Formatter<num, String> {
  @override
  String format(num it) => NumberFormat.currency(symbol: 'R\$').format(it);
}
