import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:statemanagementdemo/todo.dart';

void main() {
  runApp(MaterialApp(
    title: 'Passin Data',
    home: TodoScreen(),
  ));
}

class TodoScreen extends StatelessWidget {
  final List<Todo> listing =
      List.generate(10, (index) => Todo('Todo-$index', 'description--$index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: ListView.builder(
        itemCount: listing.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listing[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(todo: listing[index])));
            },
          );
        },
      ),
    );
  }
}