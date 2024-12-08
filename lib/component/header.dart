import 'package:flutter/material.dart';
import 'package:myindramayu_flutter/theme.dart';
import 'package:myindramayu_flutter/pages/home_page.dart';
import 'package:myindramayu_flutter/pages/kuliner_page.dart';
import 'package:myindramayu_flutter/pages/wisata_page.dart';

class Header extends StatelessWidget {
  final int selectedIndex;

  const Header({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar halaman dengan judul dan widget
    final List<Map<String, dynamic>> menuItems = [
      {'title': 'Beranda', 'page': const HomePage()},
      {'title': 'Wisata', 'page': const WisataPage()},
      {'title': 'Kulineran', 'page': const KulinerPage()},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Tentukan responsivitas berdasarkan lebar layar
        bool isMdScreen =
            constraints.maxWidth >= 768 && constraints.maxWidth < 1024;
        bool isLgScreen = constraints.maxWidth >= 1024;

        // Atur padding dan ukuran font berdasarkan tipe layar
        double horizontalPadding = isLgScreen ? 16 : (isMdScreen ? 14 : 12);
        double verticalPadding = isLgScreen ? 10 : (isMdScreen ? 10 : 8);
        double fontSize = isLgScreen ? 14 : (isMdScreen ? 14 : 12);

        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: green1,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: menuItems.asMap().entries.map((entry) {
              final int index = entry.key;
              final Map<String, dynamic> item = entry.value;

              return InkWell(
                onTap: () {
                  // Navigasi ke halaman yang dipilih
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => item['page']),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 1,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    decoration: index == selectedIndex
                        ? BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          )
                        : null,
                    child: Center(
                      child: Text(
                        item['title'],
                        style: semibold12_5.copyWith(
                          fontSize: fontSize,
                          color: index == selectedIndex ? green1 : dark4,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
