import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  double _resultado = 0;
  double _primerNumero = 0;
  String _operador = '';
  String _input = '';

  void _borrarTodo() {
    setState(() {
      _resultado = 0;
      _primerNumero = 0;
      _operador = '';
      _input = '';
    });
  }

  /* void _presionarNumero(int n) {
    setState(() {
      _input += n.toString();
    });
  } */

  void _presionarNumero(dynamic n) {
    setState(() {
      if (n is int) {
        _input += n.toString();
      } else if (n == '.') {
        // En caso de que el punto decimal aún no ha sido ingresado
        if (!_input.contains('.')) {
          // Agregar el punto decimal solo si no está agregado
          _input += '.';
        }
      }
    });
  }

  void _presionarOperador(String operador) {
    setState(() {
      _operador = operador;
      _primerNumero = double.parse(_input);
      _input = '';
    });
  }

  void _calcularResultado() {
    double segundoNumero = double.parse(_input);
    double resultado;

    switch (_operador) {
      case '+':
        resultado = _primerNumero + segundoNumero;
        break;
      case '-':
        resultado = _primerNumero - segundoNumero;
        break;
      case '*':
        resultado = _primerNumero * segundoNumero;
        break;
      case '/':
        resultado = _primerNumero / segundoNumero;
        break;
      default:
        resultado = 0;
    }

    setState(() {
      _resultado = resultado;
      _input = resultado.toString();
      print(_resultado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              height: 60,
              width: 224,
              child: Text(
                _input.isEmpty ? _resultado.toString() : _input,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              height: 280,
              width: 224,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () => _presionarOperador('*'),
                        child: const Text(
                          "*",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarOperador('/'),
                        child: const Text(
                          "/",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _borrarTodo(),
                        child: const Text(
                          "C",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _borrarTodo(),
                        child: const Text(
                          "CE",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(1),
                        child: const Text(
                          "1",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(2),
                        child: const Text(
                          "2",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(3),
                        child: const Text(
                          "3",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarOperador('+'),
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(4),
                        child: const Text(
                          "4",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(5),
                        child: const Text(
                          "5",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(6),
                        child: const Text(
                          "6",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarOperador('-'),
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(7),
                        child: const Text(
                          "7",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(8),
                        child: const Text(
                          "8",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(9),
                        child: const Text(
                          "9",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                        onPressed: () => _presionarNumero('.'),
                        child: const Text(
                          ".",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _presionarNumero(0),
                        child: const Text(
                          "0",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => _calcularResultado(),
                        child: const Text(
                          "=",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
