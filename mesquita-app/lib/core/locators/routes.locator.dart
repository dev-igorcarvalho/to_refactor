import 'package:flutter/widgets.dart';
import 'package:sagae/core/widgets/debug.dart';
import 'package:sagae/features/cadastro_produtor/presentation/screens/cadastro_produtor.screen.dart';
import 'package:sagae/features/login/presentation/screens/login_produtor.screen.dart';
import 'package:sagae/features/login/presentation/screens/login_tecnico.screen.dart';
import 'package:sagae/features/login/presentation/screens/tecnico_home.screen.dart';

enum ApiEnvironment { DEV_ANDROID, DEV_IOS, TEST, PROD }

class RoutesLocator {
  static const ApiEnvironment _apiEnvironment = ApiEnvironment.DEV_ANDROID;

  static Map<String, WidgetBuilder> get routes => {
        //initial route tem q ser somente /
        //HomeScreen.ROUTE_NAME: (BuildContext context) => const HomeScreen(),
        LoginTecnico.ROUTE_NAME: (BuildContext context) => const LoginTecnico(),
        LoginProdutor.ROUTE_NAME: (BuildContext context) =>
            const LoginProdutor(),
        TecnicoHome.ROUTE_NAME: (BuildContext context) => const TecnicoHome(),
        CadastroProdutor.ROUTE_NAME: (BuildContext context) =>
            CadastroProdutor(),
        DebugRoom.ROUTE_NAME: (BuildContext context) => const DebugRoom(),

        //rotas com o nome relacionado ao widget que elas chamam
//        '/myApp': (BuildContext context) => SimpleTodo(),

        // a linha abaixo eh um exemplo de como evitar erros no nome das rotas
        // usando um atributo de classe com nome da rota na sua propria classe
        //ExampleScreen.route :  (BuildContext context) => ExampleScreen()
      };

//UST: 04/2021 - RoutesLocator - id:11 - 2pts - Edição
  static String getApiUriWithCustomPort(int port) {
    String uri = getApiUri();
    uri = uri.substring(0, uri.length - 4);
    return uri + port.toString();
  }

  static String getApiUri() {
    switch (_apiEnvironment) {
      case ApiEnvironment.DEV_ANDROID:
        // return 'http://192.168.0.14:8090'; //ip Rj Casa
        return 'http://192.168.122.1:8090'; //ip Rj Escritorio
        // return 'http://192.168.0.6:8090'; //ip Mt Casa
        //  return 'http://192.168.1.38:8090'; //ip Mt Empaer
        break;
      case ApiEnvironment.DEV_IOS:
        return 'http://localhost:8090';
        break;
      case ApiEnvironment.PROD:
        // return 'http://sagaeservice.empaer.mt.gov.br:8090';
        return 'http://201.49.175.254:8090';
        break;
      case ApiEnvironment.TEST:
        return 'http://187.123.24.12:8090';
        break;
      default:
        return '';
        break;
    }
  }
}
