import 'dart:convert';

import 'package:http/http.dart' as http_service;
import 'package:sagae/core/application_container/user_session.dart';
import 'package:sagae/core/constants/shared_prefs_constants.dart';
import 'package:sagae/core/data/model/vo/usuario_autenticado.vo.dart';
import 'package:sagae/core/generics/genericHttp.datasource.dart';
import 'package:sagae/core/locators/routes.locator.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/produtor_rural.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

//UST: 10/08 - ProdutorRuralHttpDatasource - id:1 - 0,5pts - Criação
class ProdutorRuralHttpDatasource extends GenericHttpDatasource {
  final bool _debugMe = false;

  Future<bool> enviarCadastros() async {
    // await sl<ProdutorRuralSembastDatasource>().deleteAll();
    UsuarioAutenticadoVo usuarioAutenticado =
        sl<UserSession>().usuarioAutenticado;
    usuarioAutenticado.device.wifiName = await WifiInfo().getWifiName();
    usuarioAutenticado.device.bssid = await WifiInfo().getWifiBSSID();
    usuarioAutenticado.device.ip = await WifiInfo().getWifiIP();
    usuarioAutenticado.device.wifiName = await WifiInfo().getWifiName();

    List<ProdutorRuralEntity> result =
        await sl<ProdutorRuralSembastDatasource>().fetchAll();
    if (result == null || result != null && result.isEmpty) {
      return false;
    }
    RegistroVacinas requestDto = RegistroVacinas(usuarioAutenticado, result);
    // print(jsonEncode(requestDto.toJson()));
    final response = await http_service.post(
        'http://contrate1bot.com.br/app_botcovid/',
        body: jsonEncode(requestDto.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      await sl<ProdutorRuralSembastDatasource>().deleteAll();
      return true;
    }
    sl<DgLoggerService>().loggIt(
        msg: response.statusCode,
        caller: 'CadastroProdutorHttpDatasource',
        active: _debugMe);
    return false;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String token = prefs.get(AUTH_TOKEN) as String;
    // final response = await http_service.post(
    //     '${RoutesLocator.getApiUri()}/produtor/agricola',
    //     body: jsonEncode(produtor.toJsonMap()),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //       'Authorization': 'Bearer $token',
    //     });
    //
    // if (response.statusCode == 201) {
    //   return true;
    // }
    // sl<DgLoggerService>().loggIt(
    //     msg: response.statusCode,
    //     caller: 'CadastroProdutorHttpDatasource',
    //     active: _debugMe);
    return false;
  }

  Future<bool> inserirNovoProdutor(ProdutorRuralEntity produtor) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.get(AUTH_TOKEN) as String;
    final response = await http_service.post(
        '${RoutesLocator.getApiUri()}/produtor/agricola',
        body: jsonEncode(produtor.toJsonMap()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 201) {
      return true;
    }
    sl<DgLoggerService>().loggIt(
        msg: response.statusCode,
        caller: 'CadastroProdutorHttpDatasource',
        active: _debugMe);
    return false;
  }

//UST: 10/09 - ProdutorRuralHttpDatasource - id:1 - 0,5pts - Criação
  Future<bool> inserirBatchProdutor(List<ProdutorRuralEntity> batch) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.get(AUTH_TOKEN) as String;
    final response = await http_service.post(
        '${RoutesLocator.getApiUri()}/produtor/agricola/cadastrar_lista',
        body: jsonEncode(batch.map((e) => e.toJsonMap()).toList()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 201) {
      return true;
    }
    sl<DgLoggerService>().loggIt(
        msg: response.statusCode,
        caller: 'CadastroProdutorHttpDatasource',
        active: _debugMe);
    return false;
  }

  //UST: 10/09 - ProdutorRuralHttpDatasource - id:1 - 0,5pts - Criação
  Future<List<ProdutorRuralEntity>> fetchAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.get(AUTH_TOKEN) as String;
    final response = await http_service.get(
        '${RoutesLocator.getApiUri()}/produtor/agricola',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    final List<ProdutorRuralEntity> result = json
        .map((e) => ProdutorRuralEntity.fromJsonMap(e as Map<String, dynamic>))
        .toList();
    sl<DgLoggerService>().loggIt(
        msg: result,
        caller: 'CadastroProdutorHttpDatasource',
        active: _debugMe);
    return result;
  }
}
