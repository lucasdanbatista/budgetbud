import 'package:easy_mask/easy_mask.dart';

class CurrencyMask extends TextInputMask {
  CurrencyMask()
      : super(
          mask: 'R!\$! !9+.999,99',
          placeholder: '0',
          reverse: true,
        );

  double unmask(String text) => double.parse(
        text.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.'),
      );
}
