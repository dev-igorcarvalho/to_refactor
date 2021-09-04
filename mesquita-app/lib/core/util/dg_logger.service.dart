import 'package:flutter/material.dart';
import 'package:simple_logger/simple_logger.dart';

class DgLoggerService {
  final _logger = SimpleLogger();

  void loggIt({@required dynamic msg, String caller = '', bool active = true}) {
    if (active) {
      _logger.info('Caller[$caller] -> $msg');
    }
  }
}
