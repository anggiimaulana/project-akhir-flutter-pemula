import 'package:flutter/material.dart';
import 'package:myindramayu_flutter/theme.dart';
import 'package:myindramayu_flutter/datas/wisata.dart';
import 'package:myindramayu_flutter/datas/kuliner.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ambil 2 data pertama dari masing-masing
    final selectedWisata = wisataPlace.take(2).toList();
    final selectedKuliner = kulinerPlace.take(2).toList();

    // Gabungkan wisata dan kuliner
    final combinedNews = [
      ...selectedWisata.map((item) => {
            'name': item.name,
            'location': item.location,
            'image': item.imageAsset,
            'type': 'wisata',
          }),
      ...selectedKuliner.map((item) => {
            'name': item.name,
            'location': item.location,
            'image': item.imageAsset,
            'type': 'kuliner',
          }),
    ];

    return Column(
      children: [
        const SizedBox(height: 24),
        Center(
          child: Text(
            'Rekomendasi Wisata dan Kulineran',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: dark1,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Render data
        ...combinedNews.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: dark4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/${item['image']}'),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name']!,
                            style: bold16.copyWith(color: dark1),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['location']!,
                            style: regular14.copyWith(color: dark2),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['type'] == 'wisata' ? 'Wisata' : 'Kuliner',
                            style: semibold14.copyWith(color: green2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
