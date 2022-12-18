import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuaro_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Screen extends StatelessWidget {
   
  const Pagina2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario 
          ? Text(usuarioService.usuario.nombre)
          : const Text('Pagina 2'),
        actions: [
          IconButton(
            onPressed: (){
              usuarioService.remove();
            }, 
            icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.usuario = Usuario(
                  nombre: 'Alberto Linares', 
                  edad: 28,
                  profesiones: ['Developer', 'Jugador'], 
                );
              },
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.edad = 50; 
              },
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            ),
          ],
        )
      ),
    );
  }
}