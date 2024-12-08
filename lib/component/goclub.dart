import 'package:flutter/material.dart';
import 'package:myindramayu_flutter/theme.dart';

class Goclub extends StatelessWidget {
  const Goclub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/gopaylater.png',
            height: 14,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Lebih hemat pake GoPayLater',
            style: bold16.copyWith(color: dark1),
          ),
          Text(
            'Yuk, belanja pake GoPayLater dan nikmatin cashback-nya',
            style: regular14.copyWith(color: dark2),
          )
        ],
      ),
    );
  }
}
