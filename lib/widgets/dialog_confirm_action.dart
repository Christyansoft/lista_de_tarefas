import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showConfirmAction(
  Function onPressedYes,
  String title,
  context,
) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('Confirma a exclusão dessa tarefa ?'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                onPressedYes();
                Navigator.pop(context);
              },
              child: Text(
                'Sim',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Não',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  } else if (Platform.isIOS) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Center(
            child: Text('Confirma a exclusão dessa tarefa ?'),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                onPressedYes();
                Navigator.pop(context);
              },
              child: Text(
                'Sim',
              ),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              isDestructiveAction: true,
              child: Text(
                'Não',
              ),
            ),
          ],
        );
      },
    );
  }
}
