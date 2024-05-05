import 'package:flutter/material.dart';
import 'package:trabajoclaseangeljoven/widgets/lista_imagenes.dart';

class Imagenes extends StatefulWidget {
  const Imagenes({super.key});

  @override
  State<Imagenes> createState() => _ImagenesState();
}

class _ImagenesState extends State<Imagenes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Imagenes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: ListaImagenes(listImages: [
            'assets/gatos/nojao.jpg',
            'assets/gatos/nojao.jpg',
            'assets/gatos/nojao.jpg',
            'assets/gatos/nojao.jpg',
            'assets/gatos/nojao.jpg',
            'assets/gatos/nojao.jpg',
            'assets/gatos/nojao.jpg',
            'assets/gatos/nojao.jpg'
          ], listDescriptions: [
            'IMG 1',
            'IMG 2',
            'IMG 3',
            'IMG 4',
            'IMG 5',
            'IMG 6',
            'IMG 7',
            'IMG 8'
          ]),
        ));
    /* return const ImagesList(
        listImages: ['assets/gatos/gato.png', 'assets/gatos/gato.png'],
        listDescriptions: ['Neon 1', 'Neon 2']); */
/*     return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Imágenes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImagenClickeable(
              alto: 200,
              ancho: 200,
              ruta: 'assets/gatos/gato.png',
              accion: () {
                print('Imagen clickeada desde un componente');
              }),
          ImagenClickeable(
              alto: 200,
              ancho: 200,
              ruta:
                  'https://i.etsystatic.com/20023820/r/il/5d2081/2885402032/il_1080xN.2885402032_c3lj.jpg',
              accion: () {
                print('Imagen clickeada desde un componente');
              }),
          SizedBox(
            height: 200,
            child: MaterialButton(
                onPressed: () {
                  print('Se presiono el gato enojado');
                },
                child: Image.network(
                    'https://i.etsystatic.com/20023820/r/il/5d2081/2885402032/il_1080xN.2885402032_c3lj.jpg')),
          ),
          ImagesList(listImages: [
            'https://i.etsystatic.com/20023820/r/il/5d2081/2885402032/il_1080xN.2885402032_c3lj.jpg',
            'https://i.etsystatic.com/20023820/r/il/5d2081/2885402032/il_1080xN.2885402032_c3lj.jpg'
          ], listDescriptions: [
            'Cheems 1',
            'Cheems 2'
          ])
        ],
      )),
    ); */
  }
}
