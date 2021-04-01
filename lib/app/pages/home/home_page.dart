import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transparent_image/transparent_image.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: ClipHome(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        child: Image.network(
                          'https://www.pngarts.com/files/3/Pokemon-Pikachu-PNG-Photo.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                'Pokémon',
                                style: TextStyle(
                                  fontSize: 40,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 10
                                    ..color = Colors.blue[700],
                                ),
                              ),
                              // Solid text as fill.
                              Text(
                                'Pokémon',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        Color(0xFF11249F),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Observer(
            builder: (_) {
              if (homeController.pokemons.error != null) {
                return Center(child: Text('Erro ao buscar dados'));
              }
              if (homeController.pokemons.value == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var list = homeController.pokemons.value;

                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          homeController.actual = list[index];
                          Modular.to.pushNamed('other/$index');
                        },
                        child: ListTile(
                          title: Text(
                            list[index].nome,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(list[index].url),
                          leading: SizedBox(
                            height: 100.0,
                            width: 50.0, // fixed width and height
                            child: Hero(
                              tag: 'imageHero$index',
                              child: FadeInImage.memoryNetwork(
                                  image: list[index].imagem,
                                  placeholder: kTransparentImage),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ClipHome extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height + 40, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
