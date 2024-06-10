import 'package:flutter/material.dart';
import 'package:taskcellpra/model/models.dart';
import 'package:intl/intl.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});
  @override
  ItemListState createState() => ItemListState();
}

class ItemListState extends State<ItemList> {
  final List<Item> items = [];
  
  void addItem(String title) {
    String now = timeFormat();
    setState(() {
      items.add(Item(titleText: title, date: now, isCheck: false));
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);  
    });
  }
  
  String timeFormat() {
    DateTime now = DateTime.now();
    String nowTime = DateFormat('yyyy-MM-dd').format(now);
    return nowTime;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(items[index].titleText), 
          onDismissed: (direction) {
            final removedItem = items[index];
            removeItem(index);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${removedItem.titleText} を削除しました"),
                action: SnackBarAction(
                  label: "取り消し", 
                  onPressed: () {
                    setState(() {
                      items.insert(index, removedItem);
                    });
                  },
                ),
              )
            );
          },
          child: ListTile(
            title: Text(items[index].titleText),
            subtitle: Text(items[index].date),
            trailing: IconButton(
              icon: Icon(items[index].isCheck ? Icons.check_box : Icons.check_box_outline_blank),
              onPressed: () {
                setState(() {
                  items[index].isCheck = !items[index].isCheck;
                });
              },
            ),
          ),
        );
      }
    );
  }
}

// class DateFormatter extends StatelessWidget {
//   const DateFormatter({super.key});
//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     String dateFormat = DateFormat('yyyy/MM/dd').format(now);
//     return Text(dateFormat);
//   }
// }

