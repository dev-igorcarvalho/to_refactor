//UST: 01/09 - DgCpfValidator - id:11 - 2pts - Criação
class DgCpfValidator {
  static String validarCpf(String cpfInformado) {
    String msg;
    final String strCpf = cpfInformado.replaceAll('.', '').replaceAll('-', '');

    if (strCpf.length == 11) {
      int iDigito1Aux = 0;
      int iDigito2Aux = 0;
      if (strCpf != "00000000000" &&
          strCpf != "11111111111" &&
          strCpf != "22222222222" &&
          strCpf != "33333333333" &&
          strCpf != "44444444444" &&
          strCpf != "55555555555" &&
          strCpf != "66666666666" &&
          strCpf != "77777777777" &&
          strCpf != "88888888888" &&
          strCpf != "99999999999") {
        for (int iCont = 1; iCont < strCpf.length - 1; ++iCont) {
          final int iDigitoCPF = int.parse(strCpf.substring(iCont - 1, iCont));
          iDigito1Aux += (11 - iCont) * iDigitoCPF;
          iDigito2Aux += (12 - iCont) * iDigitoCPF;
        }

        int iRestoDivisao = iDigito1Aux % 11;
        int iDigito1;
        if (iRestoDivisao < 2) {
          iDigito1 = 0;
        } else {
          iDigito1 = 11 - iRestoDivisao;
        }

        iDigito2Aux += 2 * iDigito1;
        iRestoDivisao = iDigito2Aux % 11;
        int iDigito2;
        if (iRestoDivisao < 2) {
          iDigito2 = 0;
        } else {
          iDigito2 = 11 - iRestoDivisao;
        }

        final String strDigitoVerificador =
            strCpf.substring(strCpf.length - 2, strCpf.length);
        final String strDigitoResultado = '$iDigito1$iDigito2';
        if (strDigitoVerificador != strDigitoResultado) {
          msg = "CPF informado é inválido!";
        }
      } else {
        msg = "CPF informado é inválido!";
      }
    } else {
      msg = "Não foi possível válidar CPF informado!";
    }
    return msg;
  }
}
