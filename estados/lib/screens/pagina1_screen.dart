import 'package:estados/models/Usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Screen extends StatelessWidget {
   
  const Pagina1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData && usuarioService.existeUsuario
            ? InformacionUsuario(usuario: snapshot.data!)
            : const Center(child: Text('No hay información de usuario'));
        },
      ),
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

          const ListTile( title: Text('Profesión 1: ')),
          const ListTile( title: Text('Profesión 2: ')),
          const ListTile( title: Text('Profesión 3: ')),

      ]),
    );
  }
}