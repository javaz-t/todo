import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todoList = ['kjdfhsjd', 'fjdsfhkjs'];
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    _add() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: TextField(

                controller: titleController,
                decoration: InputDecoration(hintText: 'add task',),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                  setState(() {
                    String todo =titleController.text;
                    todoList.add(todo);

                  });
                    print(todoList);
                  },
                  child: Text('SAVE'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Cancel'))
              ],
            );
          });
    }
    _edit(int index) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: TextField(

                controller: titleController,
                decoration: InputDecoration(hintText: 'add task',),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                     todoList[index]=titleController.text;

                    });
                    print(todoList);
                  },
                  child: Text('SAVE'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Cancel'))
              ],
            );
          });
    }

    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: (){ _add(); } , child: Text('Add ')),
      appBar: AppBar(
        title: Text('Todo List '),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(todoList[index].toString()),
                leading: IconButton(onPressed: () {
                  titleController.text = todoList[index].toString();
                  _edit(index);
                }, icon: Icon(Icons.edit)),
                trailing: IconButton(icon: const Icon(Icons.delete),onPressed: (){
                  setState(() {
                    todoList.removeAt(index);
                  });
                },),
              ),
            );
          }),
    );
  }
}
