//UST: 14/09- CadastroProdutorForm - id:2 - 0,5pts - Criação
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final MaskTextInputFormatter dateMask =
    MaskTextInputFormatter(mask: '##/##/####',
        // ignore: unnecessary_raw_strings
        filter: {"#": RegExp(r'[0-9]')});
