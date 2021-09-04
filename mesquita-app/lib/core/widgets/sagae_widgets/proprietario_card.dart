import 'package:flutter/material.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_header_divider.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_labeled_output_text.dart';
import 'package:sagae/core/widgets/style/style_constants.dart';

//UST: 04/2021 - AgrupamentoEntity - id:7 - 0,5pts - Criação
class ProprietarioVO {
  final String nome;
  final String cpf;

  ProprietarioVO(this.nome, this.cpf);
}

//UST: 04/2021 - ProprietarioCard - id:15 - 4pts - Criação
class ProprietarioCard extends StatelessWidget {
  final ProprietarioVO proprietario;

  const ProprietarioCard({Key key, @required this.proprietario})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: PADDING_PADRAO),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: PADDING_PADRAO),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: const DgHeaderDivider(
                  paddingTop: 0,
                  paddingBottom: 0,
                  title: 'Proprietário',
                  divider: false,
                ),
              ),
              DgLabeledOutputText(
                label: 'Nome',
                text: proprietario.nome ?? 'Não encontrado',
                divider: true,
              ),
              DgLabeledOutputText(
                label: 'Cpf',
                text: proprietario.cpf ?? 'Não encontrado',
                divider: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
