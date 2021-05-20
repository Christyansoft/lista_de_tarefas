import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xffC1007E),
      ),
      home: HomePage(),
    );
  }
}

