import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(100) % 7 == 0 ? 2 : 1;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
    print(groupBox);
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef),
            ),
            child: const Row(
              children: [
                Icon(Icons.search),
                Text(
                  '검색',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff838383),
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.location_pin),
        )
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jindex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jindex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5uX6OFAY6yGyLf0vEbR5iRYPblHgRfUyOGw&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [_appbar(), Expanded(child: _body())],
        ),
      ),
    );
  }
}
