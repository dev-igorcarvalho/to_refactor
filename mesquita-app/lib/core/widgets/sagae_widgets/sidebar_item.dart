import 'package:flutter/widgets.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/features/login/data/datasource/user_session.datasource.dart';

//UST: 10/08 - SidebarItem - id:15 - 4pts - Criação
class SidebarItem extends StatelessWidget {
  const SidebarItem(this._img, {this.route, this.logout = false});

  final String _img;
  final String route;
  final bool logout;

  //UST: 31/08 - SidebarItem - id:11 - 2pts - Criação
  Future exit() async {
    await sl<UserSessionDatasource>().removeUsuarioSessao();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //UST: 31/08 - SidebarItem - id:11 - 2pts - Criação
        if (logout == true) {
          exit();
          Navigator.popAndPushNamed(context, '/');
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      child: SizedBox(
        height: 40,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, top: 5, bottom: 5, right: 25),
          child: Image.asset(
            _img,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
