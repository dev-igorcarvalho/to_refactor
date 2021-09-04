import 'package:flutter/material.dart';
import 'package:sagae/core/widgets/sagae_widgets/layout_padrao.dart';
import 'package:sagae/core/widgets/sagae_widgets/sidebar.dart';
import 'package:sagae/features/cadastro_produtor/presentation/widgets/cadastro_produtor_form.dart';

//UST: 29/07 - CadastroProdutor - id:21 - 9pts - Criação
//UST: 14/09 - CadastroProdutor - id:21 - 9pts - Edição
class CadastroProdutor extends StatelessWidget {
  static const ROUTE_NAME = "/cadastro/produtor";

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
        homeButton: true,
        menu: SideBar(),
        pageTitle: 'Cadastro de Pacientes',
        body: CadastroProdutorForm());
  }
}
