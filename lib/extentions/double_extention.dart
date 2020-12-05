import 'package:intl/intl.dart';
extension DoubleExtension on double {
  String toCurrency({
    final String symbol = '\u20B9',
  }) {
    return NumberFormat.currency(
      locale: 'en-US',
      symbol: symbol,
      decimalDigits: 0,
    ).format(this);
  }

  String toDecimal() {
    return this.toStringAsFixed(this % 1 == 0 ? 0 : 2);
  }
}
