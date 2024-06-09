import 'package:flutter/material.dart';
import 'package:taskcellpra/model/models.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});
  @override
  ItemListState createState() => ItemListState();
}

class ItemListState extends State<ItemList> {
  final List<Item> items = [];
  // final TextEditingController _Controller = TextEditingController();

  void addItem(String title) {
    setState(() {
      items.add(Item(titleText: title, isCheck: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].titleText),
          trailing: IconButton(
            icon: Icon(items[index].isCheck ? Icons.check_box : Icons.check_box_outline_blank),
            onPressed: () {
              setState(() {
                items[index].isCheck = !items[index].isCheck;
              });
            },
          ),
        );
      }
    );
  }
}

