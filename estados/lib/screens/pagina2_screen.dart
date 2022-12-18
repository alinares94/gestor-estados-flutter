import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Screen extends StatelessWidget {
   
  const Pagina2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario(
                  nombre: 'Alberto Linares',
                  edad: 28,
                  profesiones: [
                    'Developer',
                    'Jugador',
                  ]
                ));
                Get.snackbar('Usuarios', 'Usuario Añadido', backgroundColor: Colors.white,
                boxShadows: [
                  const BoxShadow(
                    color: Colors.black,
                    blurRadius: 10
                  )
                ]);
              },
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                usuarioCtrl.cambiarEdad(50);
              },
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                final profesiones = usuarioCtrl.usuario.value.profesiones?.length ?? 0;
                usuarioCtrl.agregarProfesion('Profesión ${profesiones + 1}');
              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: const Text('Cambiar Tema', style: TextStyle(color: Colors.white)),
            ),
          ],
        )
      ),
    );
  }
}