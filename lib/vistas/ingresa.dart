import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IngresaNombre extends StatefulWidget {
  const IngresaNombre({super.key, required this.home});

  final Function home;

  @override
  State<IngresaNombre> createState() => _IngresaNombreState();
}

class _IngresaNombreState extends State<IngresaNombre> {
  TextEditingController _textEditingController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _guardarNombre() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs != Null) {
      prefs.setString('nombre', _textEditingController.text);
      setState(() {
        _textEditingController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresa'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              'Ingresa tu nombre',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      _guardarNombre();
                      widget.home(0);
                    },
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _guardarNombre();
                    widget.home(0);
                  },
                  child: const Text(
                    'Enviar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
