import 'package:flutter/material.dart';

class ListaImagenes extends StatefulWidget {
  const ListaImagenes(
      {super.key, required this.listImages, required this.listDescriptions});

  final List<String> listImages;
  final List<String> listDescriptions;

  @override
  State<ListaImagenes> createState() => _ListaImagenesState();
}

class _ListaImagenesState extends State<ListaImagenes> {
  List<Widget> listaWidgets = [];

  @override
  void initState() {
    super.initState();
    crearWidgets();
  }

  void crearWidgets() {
    for (var i = 0; i < widget.listImages.length; i++) {
      listaWidgets.add(Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8), // Color de la sombra
                spreadRadius: 5, // Radio de propagación de la sombra
                blurRadius: 7, // Radio de desenfoque de la sombra
                offset: const Offset(0, 3), // Cambio de posición de la sombra
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    widget.listImages[i],
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(widget.listDescriptions[i],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ));
      listaWidgets.add(const SizedBox(height: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: listaWidgets);
  }
}
