import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/produtor_rural.entity.dart';

import '../datasource/produtor_rural_http.datasource.dart';

class ProdutorRepository {
  final bool _debugMe = true;

  ///Verifica a coneção e gerencia o local de cadastro,
  ///se não tiver acesso a internet ou se a tentativa de gravação
  ///online falhar, o app salva o cadastro no banco local e aguarda
  ///para fazer sincronização no futuro
  //UST: 10/08 - ProdutorRepository -id:11 - 2pts - Criação
  Future<bool> inserirNovo(final ProdutorRuralEntity produtor) async {
    bool isCadastroSalvo = false;
    return isCadastroSalvo = await _localSave(produtor);
  }

  //UST: 26/09 - ProdutorRepository -id:11 - 2pts - Criação
  Future<bool> _localSave(ProdutorRuralEntity produtor) async {
    final int produtorId =
        await sl<ProdutorRuralSembastDatasource>().insertAndReturn(produtor);
    if (produtorId != null) {
      return true;
    }
    return false;
  }

  //UST: 26/09 - ProdutorRepository -id:11 - 2pts - Criação
  Future<bool> _remoteSave(ProdutorRuralEntity produtor) async {
    try {
      await sl<ProdutorRuralHttpDatasource>().inserirNovoProdutor(produtor);

      sl<DgLoggerService>()
          .loggIt(msg: 'Salvo via http com Sucesso', active: _debugMe);
    } catch (e) {
      sl<DgLoggerService>()
          .loggIt(msg: e, caller: 'CadastroProdutorRepository');
    }
    return true;
  }

  //UST: 23/09 - ProdutorRepository -id:11 - 2pts - Criação
  Future reloadCargaProdutores() async {
    final List<ProdutorRuralEntity> produtorRuralList =
        await sl<ProdutorRuralHttpDatasource>().fetchAll();
    await sl<ProdutorRuralSembastDatasource>().deletarSincronizados();
    await sl<ProdutorRuralSembastDatasource>().insertMany(produtorRuralList);
  }
}
