import 'package:flutter/material.dart';

class Tareas extends StatefulWidget {

  @override
  _TareasState createState() => _TareasState();
}

class _TareasState extends State<Tareas> {

  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
	title: const Text('Laboratorio3 Tareas'),
	actions : [
	  Row(
	    children: [
	      const _UserAvatar()
	    ],
	  ),
	],
      ),
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
	onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add)
      ),
    );
  }
  
  void _addTodoItem(String title) {
    // Incorporar un nuevo dato
    // cambiar el estado de la lista
    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  // Generar una lista de widgets items
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  // Generacion de un widget de dialogo
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agrega una tarea'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Laboratorio 3 PE'),
          ),
          actions: <Widget>[
	    TextButton(
              child: const Text('ADD'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }

}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage("assets/images/user.png"),
    );
  }
}
