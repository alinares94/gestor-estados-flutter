import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuaro_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Screen extends StatelessWidget {
   
  const Pagina1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: usuarioService.existeUsuario
        ? InformacionUsuario( usuario: usuarioService.usuario)
        : const Center(child: Text('No existe usuario')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2') 
      ),
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

          if (usuario.profesiones != null)
            ...usuario.profesiones!.map((e) => ListTile( title: Text(e))),

      ]),
    );
  }
}