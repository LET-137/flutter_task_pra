import 'package:flutter/material.dart';
import 'package:taskcellpra/Views/item_view.dart';


class InputView extends StatefulWidget {
  const InputView({super.key});
  @override
  InputViewState createState() => InputViewState();
}

class InputViewState extends State<InputView> {
  final TextEditingController _controller = TextEditingController();
  final ItemListState itemListState = ItemListState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'タスクを入力してください'
                    ),
                  ),
                ),
              IconButton(
                onPressed: () {
                  setState(() {
                    final inputString = _controller.text;
                    itemListState.addItem(inputString);
                  });
                }, 
                icon: const Icon(Icons.add)),
              ],
            ),)
        ]),
    );
  }
}