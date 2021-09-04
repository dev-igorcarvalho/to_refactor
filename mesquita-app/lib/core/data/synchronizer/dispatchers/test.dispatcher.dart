import 'package:sagae/core/data/synchronizer/interfaces/dispatcher.interface.dart';
import 'package:sagae/core/data/synchronizer/mixin/syncAndNotifyMixin.mixin.dart';

class TestDispatcher with SyncAndNotifyMixin implements Dispatcher {
  @override
  void dispatch() {
    synAndNotify(
        msg: 'Async_Thread : executou o TEST synchronizer', action: _syncTest);
  }

  Future _syncTest() async {
    await Future.delayed(
      const Duration(seconds: 8),
    );
  }
}
