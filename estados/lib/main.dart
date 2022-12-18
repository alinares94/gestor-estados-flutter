import 'package:estados/screens/pagina1_screen.dart';
import 'package:estados/screens/pagina2_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/pagina1',
      themeMode: ThemeMode.light,
      getPages: [
        GetPage(name: '/pagina1', page: () => const Pagina1Screen()),
        GetPage(name: '/pagina2', page: () => const Pagina2Screen())
      ],
    );
  }
}