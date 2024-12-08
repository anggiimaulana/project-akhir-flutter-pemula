import 'package:flutter/material.dart';
import 'package:myindramayu_flutter/datas/kuliner.dart';
import 'package:myindramayu_flutter/pages/detail_kuliner_screen.dart';
import 'package:myindramayu_flutter/theme.dart';

class Kuliner extends StatelessWidget {
  const Kuliner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),

        // Menggunakan LayoutBuilder untuk mendeteksi ukuran layar dan menyesuaikan jumlah kolom
        LayoutBuilder(
          builder: (context, constraints) {
            // Menentukan jumlah kolom berdasarkan ukuran layar
            int crossAxisCount;
            if (constraints.maxWidth >= 1200) {
              // Desktop (large screens)
              crossAxisCount = 4;
            } else if (constraints.maxWidth >= 800) {
              // Medium screens (tablet)
              crossAxisCount = 3;
            } else {
              // Small screens (mobile)
              crossAxisCount = 1;
            }

            return GridView.builder(
              shrinkWrap:
                  true, // Menghindari GridView mempengaruhi ukuran yang lebih besar
              physics:
                  NeverScrollableScrollPhysics(), // Menonaktifkan scroll pada GridView jika sudah ada scroll di layar
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount, // Menentukan jumlah kolom
                crossAxisSpacing: 16, // Jarak antar kolom
                mainAxisSpacing: 16, // Jarak antar baris
                childAspectRatio: 1, // Rasio lebar dan tinggi item grid
              ),
              itemCount: kulinerPlace.length,
              itemBuilder: (context, index) {
                final item = kulinerPlace[index];
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: dark4),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigasi ke halaman detail ketika item ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailKulinerScreen(place: item),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Menampilkan gambar wisata dengan ukuran yang sesuai
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Image.asset(
                              'assets/images/${item.imageAsset}',
                              fit:
                                  BoxFit.cover, // Gambar menyesuaikan kontainer
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: bold16.copyWith(color: dark1),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 0, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.location,
                                style: semibold14.copyWith(color: dark3),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 0, bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kulineran',
                                style: semibold14.copyWith(color: green2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
