import 'dart:convert';

import 'package:sagae/core/constants/shared_prefs_constants.dart';
import 'package:sagae/core/data/synchronizer/constants/datasource_constants.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/categoria_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/dose_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/grupo_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/lote_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/tipo_vacina_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/categoria.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/dose.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/grupo.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/lote.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/tipo_vacina.entity.dart';
import 'package:sagae/features/login/data/datasource/municipio_sembast.datasource.dart';
import 'package:sagae/features/login/data/datasource/unidade_sembast.datasource.dart';
import 'package:sagae/features/login/data/model/municipio.entity.dart';
import 'package:sagae/features/login/data/model/unidade.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

//UST: 10/08 - initContextScripts -  id:11 - 2pts - Criação
//UST: 01/03/2021 - initContextScripts -  id:11 - 2pts - Edição
Future initUserSession() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('loginToken')) {
    final String tecnicoJson = prefs.get(USUARIO_LOGADO) as String;
    final Map<String, dynamic> tecnicoMap =
        jsonDecode(tecnicoJson) as Map<String, dynamic>;
    // sl<UserSession>().usuarioAutenticado.tecnico =
    //     TecnicoEntity.fromJsonMap(tecnicoMap);
  }
}

//UST: 10/08 - initContextScripts - id:11 - 2pts - Criação
Future initDatasourceSyncList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(DATASORUCE_SYNC)) {
    await prefs.setStringList(DATASORUCE_SYNC, []);
  }
}

Future testSyncList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(DATASORUCE_SYNC)) {
    await prefs.setStringList(DATASORUCE_SYNC, []);
    final List<String> syncList = prefs.getStringList(DATASORUCE_SYNC);
    syncList.add(PRODUTOR);
    await prefs.setStringList(DATASORUCE_SYNC, syncList);
    sl<DgLoggerService>().loggIt(msg: prefs.getStringList(DATASORUCE_SYNC));
  }
}

Future clearSyncList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(DATASORUCE_SYNC)) {
    await prefs.setStringList(DATASORUCE_SYNC, []);
    sl<DgLoggerService>().loggIt(msg: prefs.getStringList(DATASORUCE_SYNC));
  }
}

Future manageTestSyncList({bool test, bool clear}) async {
  if (test) await testSyncList();
  if (clear) await clearSyncList();
}

Future initCargaBot() async {
  await insertMunicipio();
  await insertUnidades();
  await insertTipoVacina();
  await insertCategoria();
  await insertDose();
  await insertLotes();
  await insertGrupos();
}

Future insertTipoVacina() async {
  var datasource = await sl<TipoVacinaSembastDatasource>().fetchAll();
  if (datasource != null && datasource.isNotEmpty) {
    return;
  }
  List<TipoVacinaEntity> tiposVacinaList = [
    "Coronavac-Sinovac/Butantan",
    "Covishield-Oxford/Fiocruz",
    "Pfizer (Comirnaty)",
    "Janssen (Recombinante)"
  ].map((e) => TipoVacinaEntity(nome: e)).toList();
  await sl<TipoVacinaSembastDatasource>().insertMany(tiposVacinaList);
}

Future insertLotes() async {
  var datasource = await sl<LoteSembastDatasource>().fetchAll();
  if (datasource != null && datasource.isNotEmpty) {
    return;
  }
  List<LoteEntity> listaCompleta = [];
  List<LoteEntity> sinovac = [
    "210014",
    "210017",
    "200280",
    "210040",
    "210049",
    "210054",
    "210070",
    "210097",
    "210128",
    "210129",
    "210139",
    "210145",
    "210149",
    "210150",
    "210216",
    "210219",
    "210222",
    "210273",
    "210275",
    "210324",
    "210339",
    "210351",
    "210363",
    "210367",
    "210377",
    "210348",
    "210397",
    "210389",
    "210411",
    "202009013",
    "202009015",
    "202106107",
    "210444",
    "210222",
    "210458",
    "210468"
  ]
      .map((e) =>
          LoteEntity(numero: e, laboratorio: 'Coronavac-Sinovac/Butantan'))
      .toList();
  listaCompleta.addAll(sinovac);
  List<LoteEntity> covishield = [
    "4120Z005",
    "CTMAV506",
    "4120Z026",
    "ABX0529",
    "213VCD004ZVA",
    "213VCD005ZVA",
    "213VCD016W",
    "213VCD017W",
    "213VCD025W",
    "214VCD043W",
    "214VCD050W",
    "214VCD066W",
    "214VCD083W",
    "214VCD078W",
    "214VCD096Z",
    "214VCD094W",
    "214VCD104Z",
    "215VCD118Z",
    "215VCD117W",
    "210183",
    "215VCD149W",
    "215VCD155W",
    "215VCD012VA",
    "210197",
    "216VCD084W",
    "216VCD184W",
    "216VCD193Z",
    "216VCD195Z",
    "216VCD210W",
    "217VCD223Z",
    "216VCD216Z",
    "216VCD217W",
    "217VCD226Z",
    "217VCD232Z",
    "210185",
    "217VCD230Z",
    "217VCD233W",
    "217VCD235Z",
    "217VCD239Z",
    "217VCD240W",
    "218VCD250W",
    "218VCD247Z",
    "218VCD252W",
    "218VCD257Z",
    "218VCD253Z",
    "218VCD259Z",
    "218VCD264W",
    "218VCD254W",
    "219VCD268W",
    "219VCD276W"
  ]
      .map((e) =>
          LoteEntity(numero: e, laboratorio: 'Covishield-Oxford/Fiocruz'))
      .toList();
  listaCompleta.addAll(covishield);
  List<LoteEntity> jansen = ["210A21A", "1821288"]
      .map((e) => LoteEntity(numero: e, laboratorio: 'Janssen (Recombinante)'))
      .toList();
  listaCompleta.addAll(jansen);
  List<LoteEntity> pfizer = [
    "EW0199",
    "FA7478",
    "EY0574",
    "EY0575",
    "EY0586",
    "FA9095",
    "FA9094",
    "FA9090",
    "FA9096",
    "FD7221",
    "FD7208",
    "FD7209",
    "FE3591",
    "FD7210",
    "FD7222",
    "28231BD",
    "28235BD",
    "FF5107",
    "FF5110",
    "FF8840",
    "FF8842",
    "FF8844",
    "31025BD",
    "31045BD",
    "FF8848",
    "FG3524",
    "FG3530",
    "FG3533",
    "32010BD",
    "FG3535",
    "32016BD"
  ]
      .map((e) => LoteEntity(numero: e, laboratorio: 'Pfizer (Comirnaty)'))
      .toList();
  listaCompleta.addAll(pfizer);
  await sl<LoteSembastDatasource>().insertMany(listaCompleta);
}

Future insertDose() async {
  var datasource = await sl<DoseSembastDatasource>().fetchAll();
  if (datasource != null && datasource.isNotEmpty) {
    return;
  }
  List<DoseEntity> doseList =
      ["D1", "D2", "DEF"].map((e) => DoseEntity(nome: e)).toList();
  await sl<DoseSembastDatasource>().insertMany(doseList);
}

Future insertCategoria() async {
  var datasource = await sl<CategoriaSembastDatasource>().fetchAll();
  if (datasource != null && datasource.isNotEmpty) {
    return;
  }
  List<CategoriaPacienteEntity> list = [
    "Comorbidades",
    "Faixa Etária",
    "Pessoas de 60 anos ou mais institucionalizadas",
    "Pessoas com Deficiência",
    "Forças Armadas (membros ativos)",
    "Forças de Segurança e Salvamento",
    "Povos e Comunidades Tradicionais",
    "Povos Indígenas",
    "Trabalhadores da Educação",
    "Trabalhadores de Saúde",
    "Pessoas em Situação de Rua",
    "Trabalhadores Portuários",
    "Funcionário do Sistema de Privação de Liberdade",
    "População Privada de Liberdade",
    "Trabalhadores Industriais",
    "Trabalhadores de Transporte"
  ].map((e) => CategoriaPacienteEntity(nome: e)).toList();
  await sl<CategoriaSembastDatasource>().insertMany(list);
}

Future insertGrupos() async {
  var datasource = await sl<GrupoSembastDatasource>().fetchAll();
  if (datasource != null && datasource.isNotEmpty) {
    return;
  }
  await insertComorbidades();
  await insertFaixaEtaria();
  await insertInstitucionalizadas();
  await insertDeficiencia();
  await insertForcasArmadas();
  await insertForcasSegurancaSalvamento();
  await insertMinorias();
  await insertIndigenas();
  await insertEducacao();
  await insertSaude();
  await insertMoradoresDeRua();
  await insertPortuarios();
  await insertPrivacaoLiberdade();
  await insertTrabalhadorIndustrial();
  await insertTrabalhadorTransporte();
}

Future insertComorbidades() async {
  List<GrupoEntity> list = [
    "Indivíduos Transplantados de Órgão Sólido",
    "Anemia Falciforme",
    "Câncer",
    "Diabetes Mellitus",
    "Doença Pulmonar Obstrutiva Crônica",
    "Doença Renal",
    "Doenças Cardiovasculares e Cerebrovasculares",
    "Hipertensão de difícil controle ou com complicações/lesão de órgão alvo",
    "Obesidade Grave (Imc>=40)",
    "Síndrome de Down",
    "Outros Imunossuprimidos"
  ].map((e) => GrupoEntity(nome: e, categoria: 'Comorbidades')).toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertFaixaEtaria() async {
  List<GrupoEntity> list = [
    "Pessoas de 60 a 64 anos",
    "Pessoas de 65 a 69 anos",
    "Pessoas de 70 a 74 anos",
    "Pessoas de 75 a 79 anos",
    "Pessoas de 80 anos ou mais"
  ].map((e) => GrupoEntity(nome: e, categoria: 'Faixa Etária')).toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertInstitucionalizadas() async {
  List<GrupoEntity> list = ['Pessoas de 60 anos ou mais institucionalizadas']
      .map((e) => GrupoEntity(
          nome: e, categoria: 'Pessoas de 60 anos ou mais institucionalizadas'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertDeficiencia() async {
  List<GrupoEntity> list = [
    "Pessoas com Deficiências Permanente Grave",
    "Pessoas com Deficiência Institucionalizadas"
  ]
      .map((e) => GrupoEntity(nome: e, categoria: 'Pessoas com Deficiência'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertForcasArmadas() async {
  List<GrupoEntity> list = [
    "Marinha do Brasil - MB",
    "Exército Brasileiro - EB",
    "Força Aérea Brasileira - FAB"
  ]
      .map((e) =>
          GrupoEntity(nome: e, categoria: 'Forças Armadas (membros ativos)'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertForcasSegurancaSalvamento() async {
  List<GrupoEntity> list = [
    "Bombeiro Civil",
    "Bombeiro Militar",
    "Guarda Municipal",
    "Policial Rodoviário Federal",
    "Policial Civil",
    "Policial Federal",
    "Policial Militar"
  ]
      .map((e) =>
          GrupoEntity(nome: e, categoria: 'Forças de Segurança e Salvamento'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertMinorias() async {
  List<GrupoEntity> list = ["Quilombola", "Ribeirinha"]
      .map((e) =>
          GrupoEntity(nome: e, categoria: 'Povos e Comunidades Tradicionais'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertIndigenas() async {
  List<GrupoEntity> list = ["Povos indígenas em terras indígenas"]
      .map((e) => GrupoEntity(nome: e, categoria: 'Povos Indígenas'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertEducacao() async {
  List<GrupoEntity> list = ["Ensino Básico", "Ensino Superior"]
      .map((e) => GrupoEntity(nome: e, categoria: 'Trabalhadores da Educação'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertSaude() async {
  List<GrupoEntity> list = [
    "Auxiliar de Veterinário",
    "Biólogo",
    "Biomédico",
    "Cozinheiro e Auxiliares",
    "Cuidador de Idosos",
    "Doula/Parteira",
    "Enfermeiro(a)",
    "Farmacêutico",
    "Fisioterapeutas",
    "Fonoaudiólogo",
    "Funcionário do Sistema Funerário c/ cadáveres potencialmente contaminados",
    "Médico",
    "Médico Veterinário",
    "Motorista de Ambulância",
    "Nutricionista",
    "Odontologista",
    "Pessoal da Limpeza",
    "Profissionais de Educação Física",
    "Psicólogo",
    "Recepcionista",
    "Segurança",
    "Assistente Social",
    "Técnico de Enfermagem",
    "Técnico de Veterinário",
    "Terapeuta Ocupacional",
    "Outros",
    "Auxiliar de Enfermagem",
    "Técnico de Odontologia",
    "Estudante"
  ]
      .map((e) => GrupoEntity(nome: e, categoria: 'Trabalhadores de Saúde'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertMoradoresDeRua() async {
  List<GrupoEntity> list = ["Pessoas em Situação de Rua"]
      .map((e) => GrupoEntity(nome: e, categoria: 'Pessoas em Situação de Rua'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertPortuarios() async {
  List<GrupoEntity> list = ["Trabalhadores Portuários"]
      .map((e) => GrupoEntity(nome: e, categoria: 'Trabalhadores Portuários'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertPrivacaoLiberdade() async {
  List<GrupoEntity> list = ["Funcionário do Sistema de Privação de Liberdade"]
      .map((e) => GrupoEntity(
          nome: e,
          categoria: 'Funcionário do Sistema de Privação de Liberdade'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertTrabalhadorIndustrial() async {
  List<GrupoEntity> list = ["Trabalhadores Industriais"]
      .map((e) => GrupoEntity(nome: e, categoria: 'Trabalhadores Industriais'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertTrabalhadorTransporte() async {
  List<GrupoEntity> list = [
    "Aéreo",
    "Caminhoneiro",
    "Coletivo Rodoviário Passageiros Urbano e de Longo Curso ",
    "Ferroviário",
    "Metroviário",
    "Aquaviário"
  ]
      .map(
          (e) => GrupoEntity(nome: e, categoria: 'Trabalhadores de Transporte'))
      .toList();
  await sl<GrupoSembastDatasource>().insertMany(list);
}

Future insertMunicipio() async {
  var datasource = await sl<MunicipioSembastDatasource>().fetchAll();
  if (datasource != null && datasource.isNotEmpty) {
    return;
  }
  List<MunicipioEntity> list = [
    'São João De Meriti',
    'Japeri',
    'Nova Iguaçu',
    'São Gonçalo',
    'Belford Roxo',
    'Duque De Caxias',
    'Nilópolis',
    'Itaboraí',
    'Queimados',
    'Seropédica',
    'Mesquita'
  ].map((e) => MunicipioEntity(nome: e)).toList();
  await sl<MunicipioSembastDatasource>().insertMany(list);
}

Future insertUnidades() async {
  var datasource = await sl<UnidadeSembastDatasource>().fetchAll();
  if (datasource != null && datasource.isNotEmpty) {
    return;
  }
  await insertUnidadesCaxias();
  await insertUnidadesMesquita();
}

Future insertUnidadesCaxias() async {
  List<UnidadeEntity> list = [
    'CMSDC',
    'UBS JOSÉ DE FREITAS',
    'UBS JOSÉ DE FREITAS',
    'UBS ANTONIO GRANJA',
    'UPH IMBARIE',
    'UBS BARÃO DO AMAPÁ',
    'CRAESM',
  ].map((e) => UnidadeEntity(nome: e, municipio: 'Duque De Caxias')).toList();
  await sl<UnidadeSembastDatasource>().insertMany(list);
}

Future insertUnidadesMesquita() async {
  List<UnidadeEntity> list = [
    'DRIVE',
    'JACUTINGA',
    'SÃO JOSÉ',
  ].map((e) => UnidadeEntity(nome: e, municipio: 'Mesquita')).toList();
  await sl<UnidadeSembastDatasource>().insertMany(list);
}
