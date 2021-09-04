//UST: 02/09 - NumberParser - id:11 - 2pts - Criação
double parseDouble(String val) {
  if (val != null && val.isNotEmpty) {
    final String cleanVal =
        val.replaceAll(',', '.').replaceAll('-', '').replaceAll(' ', '');
    return double.parse(cleanVal);
  }
  return 0.0;
}

//UST: 02/09 - NumberParser - id:11 - 2pts - Criação
int parseInt(String val) {
  if (val != null && val.isNotEmpty) {
    final String cleanVal =
        val.replaceAll(',', '').replaceAll('-', '').replaceAll(' ', '');
    return int.parse(cleanVal);
  }
  return 0;
}
