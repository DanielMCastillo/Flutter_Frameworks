import 'package:flutter/material.dart';
import '../models/materias.dart';

class RegistroMateriasScreen extends StatefulWidget {
  @override
  _RegistroMateriasScreenState createState() => _RegistroMateriasScreenState();
}

class _RegistroMateriasScreenState extends State<RegistroMateriasScreen> {
  final _formKey = GlobalKey<FormState>();
  final _materia = Materia('', '', 0, '', false, '');

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Aquí puedes realizar acciones adicionales, como guardar los datos en una base de datos
      print('Materia registrada: ${_materia.nombre} (${_materia.clave})');
      print('Créditos: ${_materia.creditos}');
      print('Semestre: ${_materia.semestre}');
      print('Optativa: ${_materia.optativa}');
      print('Programa: ${_materia.programa}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Nombre de la materia'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el nombre de la materia';
              }
              return null;
            },
            onSaved: (value) {
              _materia.nombre = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Clave de la materia'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa la clave de la materia';
              }
              return null;
            },
            onSaved: (value) {
              _materia.clave = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Créditos'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa los créditos';
              }
              return null;
            },
            onSaved: (value) {
              _materia.creditos = int.parse(value!);
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Semestre'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el semestre';
              }
              return null;
            },
            onSaved: (value) {
              _materia.semestre = value!;
            },
          ),
          SwitchListTile(
            title: Text('Optativa'),
            value: _materia.optativa,
            onChanged: (value) {
              setState(() {
                _materia.optativa = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Programa'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el programa';
              }
              return null;
            },
            onSaved: (value) {
              _materia.programa = value!;
            },
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Registrar materia'),
          ),
        ],
      ),
    );
  }
}
