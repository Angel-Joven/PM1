import 'package:flutter/material.dart';

class ImagenClickeable extends StatefulWidget {
  const ImagenClickeable(
      {super.key,
      required this.alto,
      required this.ancho,
      required this.ruta,
      required this.accion});

  final double alto;
  final double ancho;
  final String ruta;
  final void Function() accion;

  @override
  State<ImagenClickeable> createState() => _ImagenClickeableState();
}

//HACER EN EL INITSTATE LA COMPROBACION DE SI ES HTTP O ASSETS

class _ImagenClickeableState extends State<ImagenClickeable> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.alto,
      width: widget.ancho,
      child: MaterialButton(
        onPressed: widget.accion,
        child: widget.ruta.startsWith('http')
            ? Image.network(widget.ruta)
            : Image.asset(widget.ruta),
      ),
    );
  }
}
