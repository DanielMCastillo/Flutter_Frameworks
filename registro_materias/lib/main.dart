import 'package:flutter/material.dart';
import 'package:registro_materias/screens/registro_materias.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Materias',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(title: Text('Registro de Materias')),
        body: Center(child: RegistroMateriasScreen()),
      ),
    );
  }
}
