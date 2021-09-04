//UST: 29/09 - UsuarioAutenticadoVo - id:7 - 0,5pts - Criação

import 'dart:convert';

import 'package:sagae/features/cadastro_produtor/data/model/produtor_rural.entity.dart';
import 'package:sagae/features/login/data/model/municipio.entity.dart';
import 'package:sagae/features/login/data/model/unidade.entity.dart';

class UsuarioAutenticadoVo {
  String nome;
  String cpf;
  DeviceVo device;
  MunicipioEntity municipio;
  UnidadeEntity unidade;

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nome': this.nome,
        'cpf': this.cpf,
        'device': this.device?.toJson(),
        'municipio': this.municipio?.toJsonMap(),
        'unidade': this.unidade?.toJsonMap(),
      };
}

class DeviceVo {
  String imei;
  String ip;
  String bssid;
  String wifiName;

  DeviceVo(this.imei);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'imei': this.imei,
        'ip': this.ip,
        'bssid': this.bssid,
        'wifiName': this.wifiName,
      };
}

class RegistroVacinas {
  UsuarioAutenticadoVo responsavel;
  List<ProdutorRuralEntity> pacientes;

  RegistroVacinas(this.responsavel, this.pacientes);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'responsavel': this.responsavel?.toJson(),
        'pacientes': this.pacientes.map((e) => e?.toJsonMap()).toList(),
      };

  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}
