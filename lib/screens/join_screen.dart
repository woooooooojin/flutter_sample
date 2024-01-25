import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '회원가입',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        children: [
          const Text(
            '다음 정보를 모두 입력해 주세요.',
            textAlign: TextAlign.center,
          ),
          const TextField(
            autocorrect: false,
            autofocus: true,
            decoration: InputDecoration(hintText: 'name'),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          const TextField(
            autocorrect: false,
            decoration: InputDecoration(hintText: 'email'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const TextField(
            autocorrect: false,
            decoration: InputDecoration(hintText: 'password'),
            textInputAction: TextInputAction.next,
            obscureText: true, //글자를 암호화
          ),
          const TextField(
            autocorrect: false,
            decoration: InputDecoration(hintText: 'password confirm'),
            textInputAction: TextInputAction.done,
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                onChanged: (value) {
                  value = value;
                },
                value: false,
              ),
              const Text('이용약관에 동의합니다.')
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send),
            label: const Text('submit'),
          ),
        ],
      ),
    );
  }
}
