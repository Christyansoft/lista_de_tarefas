import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/task_model.dart';
import 'package:lista_de_tarefas/widgets/task_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tasks = <TaskModel>[];

  var _cNameTask = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_ioasys.png'),
            SizedBox(
              width: 16,
            ),
            Text('Lista de Tarefas')
          ],
        ),
      ),
      drawer: Drawer(),
      body: _body(),
    );
  }

  _body() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: _validateInputTask,
                    controller: _cNameTask,
                    decoration: InputDecoration(
                      labelText: 'Nova tarefa',
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: _onClickAdd,
                  child: Text('ADD'),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  var item = tasks[index];

                  return TaskItem(item.title, item.completed,
                      () => _onChangedTask(index), () => _onDismissed(index));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String? _validateInputTask(String? text) {
    if (text!.trim().isEmpty) return 'Informe o nome da tarefa';
  }

  _onChangedTask(int index) {
    tasks[index].completed = !tasks[index].completed;

    setState(() {});
  }

  _onClickAdd() {
    if (_formKey.currentState!.validate()) {
      tasks.add(TaskModel(_cNameTask.text, false));

      setState(() {});

      _cNameTask.clear();
    }
  }

  _onDismissed(int index) {
    tasks.removeAt(index);

    setState(() {});
  }

  @override
  void dispose() {
    _cNameTask.dispose();
    super.dispose();
  }
}
