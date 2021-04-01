import 'package:animated_splash/animated_splash.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_teste/app/app_controller.dart';
import 'package:modular_teste/app/app_widget.dart';
import 'package:modular_teste/app/pages/home/home_controller.dart';
import 'package:modular_teste/app/pages/home/home_page.dart';
import 'package:modular_teste/app/pages/other/other_page.dart';
import 'package:modular_teste/app/shared/repositories/pokemon_repository.dart';
import 'package:modular_teste/app/shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(i.get())),
        Bind((i) => PokemonRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/',
            child: (context, args) => AnimatedSplash(
                  imagePath: "assets/images/splash.png",
                  home: HomePage(),
                  duration: 5500,
                  type: AnimatedSplashType.StaticDuration,
                )),
        ModularRouter('/other/:index',
            child: (context, args) => OtherPage(
                  index: args.params['index'],
                )),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
