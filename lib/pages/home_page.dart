import 'package:flutter/material.dart';
import 'package:myindramayu_flutter/component/akses.dart';
import 'package:myindramayu_flutter/component/goclub.dart';
import 'package:myindramayu_flutter/component/gopay.dart';
import 'package:myindramayu_flutter/component/menus.dart';
import 'package:myindramayu_flutter/component/news.dart';
import 'package:myindramayu_flutter/component/search.dart';
import 'package:myindramayu_flutter/theme.dart';
import 'package:myindramayu_flutter/component/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: green2,
          elevation: 0,
          toolbarHeight: 71,
          title: const Header(selectedIndex: 0),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Search(),
              Gopay(),
              Menus(),
              Goclub(),
              Akses(),
              News(),
            ],
          ),
        ));
  }
}
