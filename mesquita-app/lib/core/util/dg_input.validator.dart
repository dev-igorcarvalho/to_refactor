class DgInputValidator {
  //UST: 10/08 - DgInputValidator - id:11 - 2pts - Criação
  static String validarInput(dynamic val, {String nome = 'Campo'}) {
    if (val == null) {
      return '$nome nao pode ser vazio';
    }
    if (val != null && val is String) {
      if (val.isEmpty) {
        return '$nome nao pode ser vazio';
      }
    }
    return null;
  }
}
