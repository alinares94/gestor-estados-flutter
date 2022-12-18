import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Screen extends StatelessWidget {
   
  const Pagina1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2') 
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioActivo:
            return InformacionUsuario( usuario: (state as UsuarioActivo).usuario );
          case UsuarioInitial:
            return const Center(child: Text('No hay información del usuario'));
          default:
            return const Center(child: Text('Estado no reconocido'));
        }
      } 
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    required this.usuario,
    Key? key,
  }) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ListTile( title: Text('Nombre: ${usuario.nombre}')),
          ListTile( title: Text('Edad: ${usuario.edad}')),

          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ...usuario.profesiones.map((x) => 
            ListTile(title: Text(x))
          ),

      ]),
    );
  }
}