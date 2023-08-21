import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final kMySqlDateFormat = DateFormat('yyyy-MM-dd', 'id_ID');
final kShortDateFormat = DateFormat('dd/MM/yy', 'id_ID');
final kFullDateFormat = DateFormat('dd/MM/yyyy', 'id_ID');
final kDateShortMonthFormat = DateFormat('dd MMM yyyy', 'id_ID');
final kDayFullDateFormat = DateFormat('EEEE, dd MMM yyyy', 'id_ID');
final kDayFullDate2Format = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
final kDateFullMonthFormat = DateFormat('dd MMMM yyyy', 'id_ID');

final kDateTimeFullMonthFormat = DateFormat('dd MMMM yyyy HH:mm', 'id_ID');
final kDateTimeShortMonthFormat = DateFormat('dd/MM/yyyy HH:mm', 'id_ID');
final kTimeFormat = DateFormat('HH:mm', 'id_ID');
final kMinuteFormat = DateFormat('mm', 'id_ID');
final kBalanceFormat = NumberFormat.currency(
  locale: 'id_ID',
  decimalDigits: 0,
  symbol: '',
);
final kRupiahFormat = NumberFormat.currency(
  locale: 'id_ID',
  decimalDigits: 0,
  symbol: 'Rp',
);

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final number = int.parse(
        newValue.text.replaceAll(kBalanceFormat.symbols.GROUP_SEP, ''),
      );
      final newString = kBalanceFormat.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    }

    return newValue;
  }
}

extension TextInputFormatterData on TextInputFormatter {
  String format(String oldText, String text) {
    return formatEditUpdate(
      TextEditingValue(
        text: oldText,
        selection: TextSelection(
          baseOffset: oldText.length,
          extentOffset: oldText.length,
        ),
      ),
      TextEditingValue(
        text: text,
        selection: TextSelection(
          baseOffset: text.length,
          extentOffset: text.length,
        ),
      ),
    ).text;
  }
}
