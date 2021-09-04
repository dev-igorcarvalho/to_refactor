import 'package:flutter/material.dart';

import 'core/application_container/application.container.dart';
import 'core/initializers/initContextScripts.dart';
import 'core/locators/service.locator.dart';

void main() => {initServiceLocator(), runApp(ApplicationContainer()), _init()};

Future _init() async {
  await initUserSession();
  await initCargaBot();
  await initDatasourceSyncList();
  await manageTestSyncList(test: false, clear: false);
}
