import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http_service;
import 'package:sagae/core/locators/routes.locator.dart';

import 'generic.entity.dart';

//UST: 10/08 - GenericHttpDatasource - id:13 - 2pts - Criação
class GenericHttpDatasource {
  void post({@required String endpoint, @required GenericEntity entity}) {
    http_service.post(RoutesLocator.getApiUri() + endpoint,
        body: entity.toJsonMap());
  }
}
