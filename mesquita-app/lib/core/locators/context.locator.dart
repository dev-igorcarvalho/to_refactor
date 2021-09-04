import 'package:flutter/material.dart';

//UST: 22/02/2021 - ContextService - id:11 - 2pts - Criação
class ContextLocator {
  final GlobalKey<NavigatorState> _navigatoryKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatoryKey;

  BuildContext get currentContext => _navigatoryKey.currentContext;
}
