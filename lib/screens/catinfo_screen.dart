import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/provider_smaple.dart';
import 'package:provider/provider.dart';

class CatInfoScreen extends StatelessWidget {
  const CatInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cat info'),
        backgroundColor: Colors.lightBlue.shade50,
      ),
      body: const SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.fromLTRB(15, 30, 15, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('age'),
              SizedBox(
                height: 5,
              ),
              AgeInput(),
              SizedBox(
                height: 30,
              ),
              Text('weight'),
              SizedBox(
                height: 5,
              ),
              WeightInput(),
              SizedBox(
                height: 40,
              ),
              Text('my pet info'),
              SizedBox(
                height: 10,
              ),
              PetInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class AgeInput extends StatelessWidget {
  const AgeInput({super.key});

  @override
  Widget build(BuildContext context) {
    late TextEditingController controller;

    final age = context
        .select<MainProvider, int>((provider) => provider.age)
        .toString();

    controller = TextEditingController(text: '$age살');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: context.read<MainProvider>().subAge,
          child: const Text('-'),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 100,
          child: TextField(
            readOnly: true,
            controller: controller,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: context.read<MainProvider>().addAge,
          child: const Text('+'),
        ),
      ],
    );
  }
}

class WeightInput extends StatelessWidget {
  const WeightInput({super.key});

  @override
  Widget build(BuildContext context) {
    late TextEditingController controller;

    final weight = context
        .select<MainProvider, int>((provider) => provider.weight)
        .toString();

    controller = TextEditingController(text: '$weight kg');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: context.read<MainProvider>().subWeight,
          child: const Text('-'),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 100,
          child: TextField(
            readOnly: true,
            controller: controller,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: context.read<MainProvider>().addWeight,
          child: const Text('+'),
        ),
      ],
    );
  }
}

class PetInfo extends StatelessWidget {
  const PetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final petInfo = context.watch<MainProvider>().pet;
    return Container(
      height: 100,
      width: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Name : ${petInfo.name}\nAge : ${petInfo.age}살\nWeight : ${petInfo.weight}kg',
        textAlign: TextAlign.center,
      ),
    );
  }
}
