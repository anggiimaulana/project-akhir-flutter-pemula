import 'package:flutter/material.dart';
import 'package:myindramayu_flutter/pages/home_page.dart';
import 'package:myindramayu_flutter/pages/kuliner_page.dart';
import 'package:myindramayu_flutter/pages/wisata_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Indramayu',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Halaman pertama yang akan dimuat
      routes: {
        '/': (context) => const HomePage(),
        '/wisata': (context) => const WisataPage(),
        '/kuliner': (context) => const KulinerPage(),
      },
    );
  }
}
