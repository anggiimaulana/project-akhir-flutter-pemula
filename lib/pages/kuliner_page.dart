import 'package:flutter/material.dart';
import 'package:myindramayu_flutter/component/kuliner.dart';
import 'package:myindramayu_flutter/component/search.dart';
import 'package:myindramayu_flutter/theme.dart';
import 'package:myindramayu_flutter/component/header.dart';

class KulinerPage extends StatelessWidget {
  const KulinerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: green2,
          elevation: 0,
          toolbarHeight: 71,
          title: const Header(selectedIndex: 2),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Search(),
              Kuliner(),
            ],
          ),
        ));
  }
}
