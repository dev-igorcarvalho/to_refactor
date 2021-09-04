// UST: 29/09 - FriendlyHttpStatus - id:11 - 2pts - Criação
class FriendlyHttpStatus {
  static String getMessage(int httpStatus) {
    if (httpStatus > 199 && httpStatus < 300) {
      return 'Operação concluída com sucesso';
    }
    if (httpStatus > 299 && httpStatus < 400) {
      return 'Operação redirecionada';
    }
    if (httpStatus > 399 && httpStatus < 500) {
      return 'Credenciais incorretas';
    }
    if (httpStatus > 499) {
      return 'Servidor fora do ar';
    }
    return 'Houve algum erro, entre em contato com o suporte';
  }
}
