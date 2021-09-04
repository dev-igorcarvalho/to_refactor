import 'package:flutter/material.dart';
import 'package:sagae/features/cadastro_produtor/presentation/screens/cadastro_produtor.screen.dart';
import 'package:sagae/features/login/presentation/screens/tecnico_home.screen.dart';
import 'package:simple_logger/simple_logger.dart';

//UST: 10/08 - DgAlertService - id:15 - 4pts - Criação
class DgAlertService {
  final _logger = SimpleLogger()..setLevel(Level.INFO, includeCallerInfo: true);

  void alert(BuildContext context,
      {@required String msg, String type, bool loggIt = false}) {
    if (loggIt) _logger.info(msg);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed(TecnicoHome.ROUTE_NAME);
                },
                child: const Text('Voltar'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .popAndPushNamed(CadastroProdutor.ROUTE_NAME);
                },
                child: Text('Continuar'),
              )
            ],
            content: Text(
              msg,
              textAlign: TextAlign.center,
            ), //TODO: poder exibir outros widgets
          );
        });
  }
}
