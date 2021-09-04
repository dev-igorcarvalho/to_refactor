import 'package:flutter/material.dart';
import 'package:sagae/core/initializers/debuging_testing_scripts.dart';
import 'package:sagae/core/widgets/sagae_widgets/layout_padrao.dart';
import 'package:sagae/core/widgets/sagae_widgets/sidebar.dart';

class DebugRoom extends StatelessWidget {
  static const ROUTE_NAME = "/debug";

  const DebugRoom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
        homeButton: true,
        menu: SideBar(),
        pageTitle: 'TEST & DEBUG',
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: ListView(children: [
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                testSyncAlert();
              },
              child: const Text('testSyncAlert()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                verificarProdutoresNaoSincronizados();
              },
              child: const Text('verificarProdutoresNaoSincronizados()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                verificarProdutoresSincronizados();
              },
              child: const Text('verificarProdutoresSincronizados()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                showSyncList();
              },
              child: const Text('showSyncList()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                colocarProdutorNaListaDeSync();
              },
              child: const Text('colocarProdutorNaListaDeSync()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                colocarTestNaListaDeSync();
              },
              child: const Text('colocarTestNaListaDeSync()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                removerProdutoresLocais();
              },
              child: const Text('removerProdutorById()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                removerProdutorDaListaDeSync();
              },
              child: const Text('removerProdutorDaListaDeSync()()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                isCargaNecessaria();
              },
              child: const Text('isCargaNecessaria()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                grupoEntradaLenght(grupoId: 1);
              },
              child: const Text('grupoEntradaLenght()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                checkProdutos(dadoId: 313);
              },
              child: const Text('checkProdutos()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                checkDadoEntrada();
              },
              child: const Text('checkDadoEntrada()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                checkOrientacaoList();
              },
              child: const Text('checkOrientacaoList()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                checkProdutoresListaOnline();
              },
              child: const Text('checkProdutoresListaOnline()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                checkMedidasSembast();
              },
              child: const Text('checkMedidasSembast()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                checkEntidadeSembast(4552);
              },
              child: const Text('checkEntidadeSembast()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                exibirUnidadeProducao();
              },
              child: const Text('  exibirUnidadeProducao()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                testeStressUnidadeProducao();
              },
              child: const Text('  testeStressUnidadeProducao()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {
                checkIndicadorCadeiaLeiteList();
              },
              child: const Text('checkIndicadorCadeiaLeiteList()'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[700],
              textColor: Colors.white,
              onPressed: () {},
              child: const Text('exibirEscritorioUsuario()'),
            ),
          ]),
        ));
  }
}
