

import 'dart:async';

import 'package:estados/models/Usuario.dart';

class _UsuarioService {

  final StreamController<Usuario> _usuarioStreamController = StreamController<Usuario>.broadcast();
  Usuario? _usuario;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;
  Usuario? get usuario => _usuario;
  bool get existeUsuario => _usuario != null;

  void cargarUsuario( Usuario user ) {
    _usuario = user;
    _usuarioStreamController.add(_usuario!);
  }

  void cambiarEdad( int edad ) {
    _usuario?.edad = edad;
    _usuarioStreamController.add(_usuario!);
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();