import 'package:easy_mask/easy_mask.dart';

class CurrencyMask extends TextInputMask {
  CurrencyMask()
      : super(
          mask: '9+.999,99',
          placeholder: '0',
          maxPlaceHolders: 3,
          reverse: true,
        );

  String maskValue(double value) {
    final regex = RegExp(r'\d(?=(\d{3})+,)');
    return value
        .toStringAsFixed(2)
        .replaceAll('.', ',')
        .replaceAllMapped(regex, (m) => '${m[0]}.');
  }

  double unmaskText(String text) => double.parse(
        text.replaceAll('.00', '00').replaceAll('.', '').replaceAll(',', '.'),
      );
}
