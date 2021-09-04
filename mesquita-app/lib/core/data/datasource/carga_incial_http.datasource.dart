import 'dart:convert';

import 'package:http/http.dart' as http_service;
import 'package:sagae/core/constants/shared_prefs_constants.dart';
import 'package:sagae/core/generics/genericHttp.datasource.dart';
import 'package:sagae/core/locators/routes.locator.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/categoria_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/grupo_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/tipo_vacina_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/categoria.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/grupo.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/tipo_vacina.entity.dart';
import 'package:sagae/features/login/data/datasource/municipio_sembast.datasource.dart';
import 'package:sagae/features/login/data/datasource/unidade_sembast.datasource.dart';
import 'package:sagae/features/login/data/model/municipio.entity.dart';
import 'package:sagae/features/login/data/model/unidade.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

//UST: 10/08 - CargaInicialHttpDatasource - id:1 - 0,5pts - Criação
class CargaInicialHttpDatasource extends GenericHttpDatasource {
  Future<Map<String, dynamic>> fetchCargaInicial(int idUsuario) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.get(AUTH_TOKEN) as String;
    final response = await http_service.get(
        '${RoutesLocator.getApiUri()}/carga_inicial/$idUsuario',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  }

  Future<void> updateCargaInicial() async {
    final response = await http_service.get(
      'http://www.contrate1bot.com.br/app_botcovid/update/',
    );
    final Map<String, dynamic> result =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    List<MunicipioEntity> municipios =
        (result['municipios']['municipios'] as List)
            .map((e) => MunicipioEntity(nome: e.toString()))
            .toList();
    await sl<MunicipioSembastDatasource>().deleteAll();
    await sl<MunicipioSembastDatasource>().insertMany(municipios);

    List<TipoVacinaEntity> tipoVacina =
        (result['laboratorio']['laboratorios'] as List)
            .map((e) => TipoVacinaEntity(nome: e.toString()))
            .toList();
    await sl<TipoVacinaSembastDatasource>().deleteAll();
    await sl<TipoVacinaSembastDatasource>().insertMany(tipoVacina);

    List<UnidadeEntity> unidades = getUnidades(result);
    await sl<UnidadeSembastDatasource>().deleteAll();
    await sl<UnidadeSembastDatasource>().insertMany(unidades);

    List<CategoriaPacienteEntity> categorias =
        (result['categorias']['categorias'] as List)
            .map((e) => CategoriaPacienteEntity(nome: e.toString()))
            .toList();
    await sl<CategoriaSembastDatasource>().deleteAll();
    await sl<CategoriaSembastDatasource>().insertMany(categorias);

    List<GrupoEntity> grupos = getGrupos(result);
    await sl<GrupoSembastDatasource>().deleteAll();
    await sl<GrupoSembastDatasource>().insertMany(grupos);
  }

  List<GrupoEntity> getGrupos(Map<String, dynamic> result) {
    Map<String, dynamic> grupos =
        (result['grupos']['grupos'] as Map<String, dynamic>);
    List<GrupoEntity> grupoList = [];
    grupos.forEach((key, value) {
      List list = value as List;
      list.forEach((element) {
        grupoList.add(GrupoEntity(nome: element.toString(), categoria: key));
      });
    });
    return grupoList;
  }

  List<UnidadeEntity> getUnidades(Map<String, dynamic> result) {
    Map<String, dynamic> unidades =
        (result['unidades']['unidades'] as Map<String, dynamic>);
    List<UnidadeEntity> unidadeList = [];
    unidades.forEach((key, value) {
      List list = value as List;
      list.forEach((element) {
        unidadeList
            .add(UnidadeEntity(nome: element.toString(), municipio: key));
      });
    });
    return unidadeList;
  }
}
