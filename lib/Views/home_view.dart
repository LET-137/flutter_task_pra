import 'package:flutter/material.dart';
import 'package:taskcellpra/Views/views.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<ItemListState> itemListKey = GlobalKey<ItemListState>();

  @override
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                      hintText: 'Enter item title',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      // ここで ItemList の addItem メソッドを呼び出す
                      if (_controller.text.isNotEmpty) {
                        itemListKey.currentState?.addItem(_controller.text);
                        _controller.clear();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ItemList(
              key: itemListKey,
            ),
          ),
        ],
      ),
    );
  }
}