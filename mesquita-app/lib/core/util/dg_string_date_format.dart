import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_logger.service.dart';

//UST: 06/09 - DgStringDateFormat - id:11 - 2pts - Criação
class DgStringDateFormat {
  static String dateToString(
      {@required final String padrao, @required final DateTime data}) {
    final DateFormat format = DateFormat(padrao);
    String stringfyedDate;
    if (data != null) {
      try {
        stringfyedDate = format.format(data);
      } catch (e) {
        sl<DgLoggerService>().loggIt(
            msg: 'Falha ao formatar data : $e',
            caller: 'DgStringDateFormat.dateToString()');
      }
    }
    return stringfyedDate;
  }

//UST: 06/09 - DgStringDateFormat - id:11 - 2pts - Criação
  static DateTime stringToDate(final String data) {
    DateTime date;
    try {
      date = data == null ? null : DateTime.parse(data);
    } catch (e) {
      sl<DgLoggerService>().loggIt(
          msg: 'Falha ao formatar data : $e',
          caller: 'DgStringDateFormat.stringToDate()');
    }
    return date;
  }
}
