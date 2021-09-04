import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//UST: 31/08 - DgPanelItem - id:7 - 0,5pts - Criação
class DgPanelItem {
  final String header;
  Widget modal;
  Widget body;
  bool isExpanded;

  DgPanelItem(
      {@required this.header, this.modal, this.body, this.isExpanded = false});
}

//UST: 31/08 - DgExpansionPanelList - id:15 - 4pts - Criação
class DgExpansionPanelList extends StatefulWidget {
  final List<DgPanelItem> items;

  const DgExpansionPanelList({Key key, @required this.items}) : super(key: key);

  @override
  _DgExpansionPanelListState createState() => _DgExpansionPanelListState();
}

class _DgExpansionPanelListState extends State<DgExpansionPanelList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            widget.items[index].isExpanded = !widget.items[index].isExpanded;
          });
        },
        children: widget.items
            .map((DgPanelItem item) => ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) =>
                      Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(item.header ?? 'Título'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                item.isExpanded = false;
                              });
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return item.modal ??
                                        const Text('Conteúdo não disponível');
                                  });
                            },
                            color: Colors.grey[500],
                          )
                        ]),
                  ),
                  isExpanded: item.isExpanded,
                  canTapOnHeader: true,
                  body: item.body ??
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Conteúdo não disponível'),
                      ),
                ))
            .toList());
  }
}
