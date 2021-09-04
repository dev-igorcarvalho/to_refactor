import 'package:flutter/cupertino.dart';
import 'package:sagae/core/locators/context.locator.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_alert.service.dart';
import 'package:sagae/core/widgets/store/sync.store.dart';

mixin SyncAndNotifyMixin {
  Future synAndNotify({@required String msg, @required Function action}) async {
    sl<SyncStore>().isSync = true;
    await action.call();
    sl<DgAlertService>()
        .alert(sl<ContextLocator>().currentContext, msg: msg, loggIt: true);
    sl<SyncStore>().isSync = false;
  }
}
