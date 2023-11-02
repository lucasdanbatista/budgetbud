import 'package:flutter/material.dart';

import '../utils/formatters/currency_formatter.dart';

class BudgetLimitProgressBar extends StatelessWidget {
  final double utilized;
  final double limit;
  final Color? color;

  const BudgetLimitProgressBar({
    super.key,
    required this.utilized,
    required this.limit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = CurrencyFormatter();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 4)),
        LinearProgressIndicator(
          value: limit > 0 ? utilized / limit : 0,
          color: color,
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Text(
          '${currencyFormatter.format(utilized)} de '
          '${currencyFormatter.format(limit)}',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
