import 'package:entrada_dados/CampoTexto.dart';
import 'package:entrada_dados/EntradaCheckbox.dart';
import 'package:entrada_dados/EntradaRadio.dart';
import 'package:entrada_dados/EntradaSlider.dart';
import 'package:entrada_dados/EntradaSwitch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //home: EntradaCheckbox(),
    //home: CampoTexto(),
    //home: EntradaRadio(),
    //home: EntradaSwitch(),
    home: EntradaSlider(),
    debugShowCheckedModeBanner: false,
  ));
}
