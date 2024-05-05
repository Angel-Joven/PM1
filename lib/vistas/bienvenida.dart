import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bienvenida extends StatefulWidget {
  const Bienvenida({super.key});
  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _mensaje = '';
  String _nombre = '';

  Future<void> _getNombre() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs != Null) {
      setState(() {
        _nombre = (prefs.getString('nombre') ?? '');
        _mensaje = 'Bienvenido $_nombre';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getNombre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina Principal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_mensaje,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
