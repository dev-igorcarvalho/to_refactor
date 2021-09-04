//UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - Criação
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final MaskTextInputFormatter celMask =
    MaskTextInputFormatter(mask: '(##)#####-####',
        // ignore: unnecessary_raw_strings
        filter: {"#": RegExp(r'[0-9]')});
