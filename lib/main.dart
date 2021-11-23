import 'package:desafio_flutter_cubos/app_module.dart';
import 'package:desafio_flutter_cubos/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(ModularApp(
    module: AppModule(),
    child:  AppWidget()
  ));
}
