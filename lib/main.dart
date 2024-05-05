import 'package:flutter/material.dart';
import 'package:trabajoclaseangeljoven/vistas/agregar_evento.dart';
import 'package:trabajoclaseangeljoven/vistas/calc.dart';
import 'package:trabajoclaseangeljoven/vistas/calendario.dart';
import 'package:trabajoclaseangeljoven/vistas/ingresa.dart';
import 'package:trabajoclaseangeljoven/vistas/imagenes.dart';
import 'vistas/bienvenida.dart';
import 'vistas/contador.dart';
import 'vistas/map.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const App());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static final List<Widget> _pagesOptions = <Widget>[
    const Bienvenida(),
    const Contador(),
    const Calculadora(titulo: 'Calculadora',),
    const Map(),
    const Calendario(),
    const Imagenes()
  ];

  void _home(int n) {
    setState(() {
      _selectedIndex = n;
    });
  }

  @override
  void initState() {
    super.initState();
    _pagesOptions.add(IngresaNombre(home: _home));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: {
        '/inicio': (context) => const Bienvenida(),
        '/contador': (context) => const Contador(),
        '/calculadora': (context) => const Calculadora(titulo: 'Calculadora',),
        '/Agregar Evento': (context) => const AgregarEvento(),
        '/Imagenes': (context) => const Imagenes()
      },
      home: Scaffold(
        body: _pagesOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.numbers), label: 'Contador'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'Calculadora'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: 'Calendario'),
            BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Imagen'),
            BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Ingresa'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
