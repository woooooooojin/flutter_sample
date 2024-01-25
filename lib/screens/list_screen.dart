import 'package:flutter/material.dart';
import 'package:flutter_sample/models/cat.dart';
import 'package:flutter_sample/screens/detail_screen.dart';
import 'package:flutter_sample/screens/join_screen.dart';
import 'package:flutter_sample/screens/upload_screen.dart';

final List<Cat> cats = [
  Cat(
    id: '0',
    name: '별님이',
    title: '오늘의 귀염둥이',
    link: 'assets/images/cat_01.jpeg',
    likeCount: 1930,
    replyCount: 6,
    created: DateTime(2022, 11, 13, 22, 14, 53, 982),
  ),
  Cat(
    id: '1',
    name: '버찌',
    title: '너만 본단 말이야',
    link: 'assets/images/cat_02.jpeg',
    likeCount: 1000,
    replyCount: 8,
    created: DateTime(2022, 11, 15, 22, 14, 53, 982),
  ),
  Cat(
    id: '2',
    name: '레이',
    title: '암 소 씨리어스',
    link: 'assets/images/cat_03.jpeg',
    likeCount: 1500,
    replyCount: 9,
    created: DateTime(2022, 11, 16, 22, 14, 53, 982),
  ),
  Cat(
    id: '3',
    name: '굿보이',
    title: '고양이와 함께 춤을',
    link: 'assets/images/cat_04.jpeg',
    likeCount: 2023,
    replyCount: 7,
    created: DateTime(2022, 11, 17, 22, 14, 53, 982),
  ),
  Cat(
    id: '4',
    name: '차라',
    title: '이래뵈어도 난 왕족 고양이야',
    link: 'assets/images/cat_05.png',
    likeCount: 2000,
    replyCount: 5,
    created: DateTime(2022, 11, 18, 22, 14, 53, 982),
  ),
];

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Cats'),
        actions: [
          //업로드화면으로 이동
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const UploadScreen(),
              );
            },
          ),
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => const JoinScreen());
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: cats.length,
        itemBuilder: (_, int index) => GestureDetector(
          //상세화면으로 이동
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  cat: cats[index],
                ),
              ),
            );
          },
          child: Image.asset(
            cats[index].link,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
