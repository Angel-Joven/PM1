import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  final db = FirebaseFirestore.instance;

  void _leedatos() async {
    await db.collection('numeros').doc('n0').get().then((documento) {
      setState(() {
        _contador = documento.get('contador');
      });
    });
  }

  @override
  void initState() {
    _leedatos();
  }

  void _escribeDatos() async {
    await db.collection('numeros').doc('n0').set({'contador': _contador});
  }

  int _contador = 0;

  void _incrementCounter() {
    setState(() {
      _contador++;
    });

    _escribeDatos();
  }

  void _decrementCounter() {
    setState(() {
      _contador--;
    });
    _escribeDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contador'),
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'El valor del contador es:',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                '$_contador',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'Plus',
              onPressed: _incrementCounter,
              tooltip: 'Incrementa el contador',
              backgroundColor: Colors.greenAccent,
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              heroTag: 'Minus',
              onPressed: _decrementCounter,
              tooltip: 'Decrementa el contador',
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.remove),
            )
          ],
        ));
  }
}
