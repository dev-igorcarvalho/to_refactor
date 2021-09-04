import 'package:sagae/core/application_container/user_session.dart';
import 'package:sagae/core/constants/shared_prefs_constants.dart';
import 'package:sagae/core/data/model/vo/usuario_autenticado.vo.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSessionDatasource {
  // UST: 29/09 - userSessionDatasource - id:11 - 2pts - Criação
  // UST: 01/03/2021 - userSessionDatasource - id:11 - 2pts - Edição
  Future registrarUsuarioNaSessao(
      UsuarioAutenticadoVo usuarioAutenticado) async {
    sl<UserSession>().usuarioAutenticado = usuarioAutenticado;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString(AUTH_TOKEN, usuarioAutenticado.token);
    // await prefs.setInt(AUTH_USR_ID, usuarioAutenticado.tecnico.idUsuario);
    // await prefs.setString(
    //     USUARIO_LOGADO, jsonEncode(usuarioAutenticado.tecnico.toJsonMap()));
    await prefs.setBool(CARGA_INICIAL, false);
  }

// UST: 29/09 - userSessionDatasource - id:11 - 2pts - Criação
  Future removeUsuarioSessao() async {
    sl<UserSession>().usuarioAutenticado = UsuarioAutenticadoVo();
  }

  // UST: 29/09 - userSessionDatasource - id:11 - 2pts - Criação
  bool isUsuarioLogado() {
    return sl<UserSession>().usuarioAutenticado.cpf != null ? true : false;
  }
}
