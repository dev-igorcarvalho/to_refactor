//UST: 26/09 - UserSession - id:7 - 0,5pts - Criação
import 'package:sagae/core/data/model/vo/usuario_autenticado.vo.dart';

class UserSession {
  UserSession({this.usuarioAutenticado});

  UsuarioAutenticadoVo usuarioAutenticado;

  void limparSessao() {
    usuarioAutenticado = UsuarioAutenticadoVo();
  }
}
