import 'package:sagae/core/constants/shared_prefs_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatasourceSyncListManager {
  //UST: 10/08 - DatasourceSyncListManager - id:11 - 2pts - Criação
  Future addToSyncList(String dsModule) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: avoid_function_literals_in_foreach_calls
    if (!prefs.getStringList(DATASORUCE_SYNC).contains(dsModule)) {
      final List<String> syncList = prefs.getStringList(DATASORUCE_SYNC);
      syncList.add(dsModule);
      await prefs.setStringList(DATASORUCE_SYNC, syncList);
    }
  }

  //UST: 10/08 - DatasourceSyncListManager - id:11 - 2pts - Criação
  Future removeFromSyncList(String dsModule) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList(DATASORUCE_SYNC).contains(dsModule)) {
      final List<String> syncList = prefs.getStringList(DATASORUCE_SYNC);
      if (syncList.contains(dsModule)) {
        syncList.remove(dsModule);
        await prefs.setStringList(DATASORUCE_SYNC, syncList);
      }
    }
  }
}
