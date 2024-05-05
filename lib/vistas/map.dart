import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  String latitud = '';
  String longitud = '';
  late Position ubicacion;

  Future<Position> obtenerUbicacion() async {
    bool servicioOn;
    LocationPermission permiso;

    servicioOn = await Geolocator.isLocationServiceEnabled();
    if (!servicioOn) {
      return Future.error('Servicio de ubicacion deshabilitado');
    }
    permiso = await Geolocator.checkPermission();

    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
      if (permiso == LocationPermission.denied) {
        return Future.error('El permiso fue denegado');
      }
    }

    if (permiso == LocationPermission.deniedForever) {
      Future.error(
          'Los servicios de ubicacion estan denegados de forma permantente');
    }

    return Geolocator.getCurrentPosition();
  }

  void botonPresionado() async {
    ubicacion = await obtenerUbicacion();
    setState(() {
      latitud = ubicacion.latitude.toString();
      longitud = ubicacion.longitude.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'latitud: $latitud',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'longitud: $longitud',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          MaterialButton(
            onPressed: () {
              botonPresionado();
            },
            child: const Text('Obtener ubicacion'),
          )
        ],
      )),
    );
  }
}
