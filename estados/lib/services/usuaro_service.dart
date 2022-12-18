import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {

  Usuario? _usuario;

  Usuario get usuario => _usuario!;
  bool get existeUsuario => _usuario != null;

  set usuario( Usuario user ) {
    _usuario = user;
    notifyListeners();
  }

  set edad( int edad ) {
    _usuario?.edad = edad;
    notifyListeners();
  }
  
  void remove() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario?.profesiones?.add('Profesion ${(usuario.profesiones?.length ?? 0) + 1}');
    notifyListeners();
  }
}