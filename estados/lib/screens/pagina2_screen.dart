import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Screen extends StatelessWidget {
   
  const Pagina2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final cubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              cubit.borrarUsuario();
            }
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
                cubit.seleccionarUsuario(Usuario(
                  nombre: 'Alberto Linares', 
                  edad: 28, 
                  profesiones: [
                    'Developer',
                    'Jugador',
                  ]
                ));
              },
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                cubit.cambiarEdad(50);
              },
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                cubit.agregarProfesion();
              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            ),
          ],
        )
      ),
    );
  }
}