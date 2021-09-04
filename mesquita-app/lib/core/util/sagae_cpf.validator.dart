import 'package:sagae/core/util/dg_cpf.validator.dart';

class SagaeCpfValidator {
  //UST:15/09 - SagaeCpfValidator - id:11 - 2pts - Criação
  static String validarCpf(String cpf) {
    String resultadoValidacao;
    if (cpf == null || cpf.isEmpty) {
      return 'Cpf nao pode ser vazio';
    }
    resultadoValidacao = DgCpfValidator.validarCpf(cpf);
    if (resultadoValidacao != null) {
      return resultadoValidacao;
    }
    return null;
  }
}
