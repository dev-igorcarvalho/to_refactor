import 'package:flutter/material.dart';

class DgDataTable extends StatelessWidget {
  const DgDataTable(
      {this.headers = const [],
      this.data = const [],
      this.editMode = true,
      this.deleteMode = true});

  final bool editMode;
  final bool deleteMode;
  final List<String> headers;
  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: headers
          .map((e) => DataColumn(
                label: Text(
                  e,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ))
          .toList(),
      rows: [
        DataRow(
          cells: <DataCell>[
            const DataCell(Text('William')),
            const DataCell(Text('27')),
            DataCell(Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.mode_edit),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            )),
          ],
        ),
      ],
    ); //---
  }
}
