import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  String color = '';

  @override
  void initState() {
    super.initState();
    color = 'blue';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetailSample(
                  color: color,
                ),
              ),
            );
          },
          child: const Text('내가좋아하는색상은?'),
        ),
      ),
    );
  }
}

class DetailSample extends StatelessWidget {
  final String color;

  const DetailSample({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('정답'),
      ),
      body: Center(
        child: Text(color),
      ),
    );
  }
}
