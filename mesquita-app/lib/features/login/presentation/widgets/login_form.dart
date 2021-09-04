import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sagae/core/application_container/user_session.dart';
import 'package:sagae/core/constants/style_constants.dart';
import 'package:sagae/core/data/model/vo/usuario_autenticado.vo.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_input.validator.dart';
import 'package:sagae/core/util/sagae_cpf.validator.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_select_menu.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_separator.dart';
import 'package:sagae/core/widgets/store/loading.store.dart';
import 'package:sagae/features/login/data/model/municipio.entity.dart';
import 'package:sagae/features/login/data/model/unidade.entity.dart';
import 'package:sagae/features/login/presentation/providers/login.store.dart';
import 'package:sagae/features/login/presentation/screens/tecnico_home.screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _fLogin = GlobalKey<FormState>();

  final UsuarioAutenticadoVo loginDto = UsuarioAutenticadoVo();

  final MaskTextInputFormatter cpfMask =
      MaskTextInputFormatter(mask: '###.###.###-##',
          // ignore: unnecessary_raw_strings
          filter: {"#": RegExp(r'[0-9]')});

  Future _logar(BuildContext context) async {
    _fLogin.currentState.save();

    if (_fLogin.currentState.validate()) {
      sl<LoadingStore>().isLoading = true;
      sl<UserSession>().usuarioAutenticado = loginDto;
      String imei = await ImeiPlugin.getImei();
      sl<UserSession>().usuarioAutenticado.device = DeviceVo(imei);
      sl<LoadingStore>().isLoading = false;
      Navigator.of(context).popAndPushNamed(TecnicoHome.ROUTE_NAME);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    sl<LoginStore>().loadDropDownLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fLogin,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              //UST: 10/08 - LoginForm - id:2 - 0,5pts - Criação
              validator: (val) =>
                  DgInputValidator.validarInput(val, nome: 'Nome'),
              textInputAction: TextInputAction.send,
              onSaved: (val) {
                loginDto.nome = val;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'CPF',
              ),
              //UST: 10/08 - LoginForm - id:2 - 0,5pts - Criação
              validator: (val) {
                return SagaeCpfValidator.validarCpf(val);
              },
              inputFormatters: [cpfMask],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onSaved: (val) {
                loginDto.cpf = val;
              },
            ),
            Observer(
              builder: (_) => DgSelectMenu(
                onChanged: (MunicipioEntity val) {
                  sl<LoginStore>().loadUnidadeByMunicipio(nome: val.nome);
                  setState(() {
                    loginDto.municipio = val;
                  });
                },
                //UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - CriaÃ§Ã£o
                validator: (val) =>
                    DgInputValidator.validarInput(val, nome: 'Município'),
                required: true,
                titleText: 'Município',
                value: loginDto.municipio,
                dataSource: sl<LoginStore>().municipios,
              ),
            ),
            Observer(
              builder: (_) => DgSelectMenu(
                onChanged: (UnidadeEntity val) {
                  setState(() {
                    loginDto.unidade = val;
                  });
                },
                //UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - CriaÃ§Ã£o
                validator: (val) =>
                    DgInputValidator.validarInput(val, nome: 'unidade'),
                required: true,
                titleText: 'Unidade',
                value: loginDto.unidade,
                dataSource: sl<LoginStore>().unidades,
              ),
            ),
            const DgSeparator(
              spacing: 30.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: primaryColor,
              textColor: Colors.white,
              onPressed: () {
                _logar(context);
              },
              child: const Text('ENTRAR'),
            )
          ],
        ),
      ),
    );
  }
}
