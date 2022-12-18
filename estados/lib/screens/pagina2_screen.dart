import 'package:estados/models/Usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Screen extends StatelessWidget {
   
  const Pagina2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
              ? Text(snapshot.data!.nombre)
              : const Text('Pagina 2');
          },
        ),
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
                usuarioService.cargarUsuario(Usuario(
                  nombre: 'Alberto Linares',
                  edad: 28,
                ));
              },
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(50);
              },
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {

              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            ),
          ],
        )
      ),
    );
  }
}