import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_teste/app/pages/home/home_controller.dart';
import 'package:transparent_image/transparent_image.dart';

class OtherPage extends StatefulWidget {
  final String index;

  const OtherPage({Key key, this.index}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homeController.actual.nome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Hero(
                tag: 'imageHero${widget.index}',
                child: Observer(
                  builder: (_) => FadeInImage.memoryNetwork(
                      image: homeController.actual.imagem,
                      placeholder: kTransparentImage),
                ),
              ),
            ),
            Center(
              child: Text(homeController.actual.nome,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
