import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//UST: 10/08 - DgGenericSelectMenu - id:15 - 4pts - Criação
class DgGenericSelectMenu extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List<Map<String, dynamic>> dataSource;
  final String textField;
  final dynamic valueField;
  final Function onChanged;
  final bool filled;

  DgGenericSelectMenu(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      bool autovalidate = false,
      this.titleText = 'Título',
      this.hintText = 'Selecione',
      this.required = false,
      this.errorText = 'Selecione uma opcão',
      this.value,
      this.dataSource,
      this.textField,
      this.valueField,
      this.onChanged,
      this.filled = true})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidate: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    decoration: InputDecoration(
                        labelText: titleText,
                        labelStyle: value == null
                            ? const TextStyle(fontSize: 22)
                            : const TextStyle(fontSize: 16)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        hint: Text(
                          hintText,
                          style: const TextStyle(fontSize: 16),
                        ),
                        value: value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dataSource.map((item) {
                          return DropdownMenuItem<dynamic>(
                            value: item[valueField],
                            child: Text(item[textField].toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText : '',
                    style: TextStyle(
                        color: Colors.redAccent.shade700,
                        fontSize: state.hasError ? 12.0 : 0.0),
                  ),
                ],
              ),
            );
          },
        );
}
