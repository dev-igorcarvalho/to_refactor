import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_sync_alert.dart';
import 'package:sagae/core/widgets/store/sync.store.dart';

import '../debug.dart';

//UST: 19/02/2021 - SagaeHeaderTitle - id:15 - 4pts - Criação
class SagaeHeaderTitle extends StatelessWidget {
  final String title;

  const SagaeHeaderTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _debugAcess = 0;
    return Observer(
        builder: (_) => sl<SyncStore>().isSync
            ? const DgSyncAlert()
            : Center(
                child: GestureDetector(
                onTap: () {
                  _debugAcess++;
                  if (_debugAcess == 27) {
                    _debugAcess = 0;
                    Navigator.pushNamed(context, DebugRoom.ROUTE_NAME);
                  }
                },
                child: Text(title),
              )));
  }
}
