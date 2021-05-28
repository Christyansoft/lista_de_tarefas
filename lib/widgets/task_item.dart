import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/widgets/dialog_confirm_action.dart';


class TaskItem extends StatelessWidget {
  final String title;
  final bool completed;
  final Function onChanged;
  final Function onDismissed;

  TaskItem(this.title, this.completed, this.onChanged, this.onDismissed);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) => onDismissed(),
      background: Container(
        padding: EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).disabledColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (dismissDirection) async {
        showConfirmAction(
          onDismissed,
          'Deseja realmente apagar esta tarefa ?',
          context,
        );
      },
      direction: DismissDirection.startToEnd,
      movementDuration: Duration(seconds: 3),
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      child: CheckboxListTile(
        activeColor: Theme.of(context).primaryColor,
        value: completed,
        onChanged: (value) => onChanged(),
        title: Text(title),
        secondary: Icon(
          completed ? Icons.check_circle : Icons.error,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
