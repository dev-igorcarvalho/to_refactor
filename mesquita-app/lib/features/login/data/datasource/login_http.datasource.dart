import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http_service;
import 'package:sagae/core/generics/genericHttp.datasource.dart';
import 'package:sagae/core/locators/routes.locator.dart';
import 'package:sagae/features/login/data/model/login.dto.dart';

class LoginHttpDatasource extends GenericHttpDatasource {
  //final bool _debugMe = false;

//UST: 10/08 - LoginHttpDatasource -id:1 - 0,5pts - Criação
//UST: 29/09 - LoginHttpDatasource -id:1 - 0,5pts - Edição
  Future<http_service.Response> login({@required LoginDto entity}) async {
    final response = await http_service.post(
        '${RoutesLocator.getApiUri()}/autenticacao',
        body: json.encode(entity.toJsonMap()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    return response;
  }
}
