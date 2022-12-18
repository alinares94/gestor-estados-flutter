import 'package:estados/screens/pagina1_screen.dart';
import 'package:estados/screens/pagina2_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (_) => const Pagina1Screen(),
        'pagina2': (_) => const Pagina2Screen(),
      },
    );
  }
}