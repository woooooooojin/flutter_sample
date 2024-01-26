import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/provider_smaple.dart';
import 'package:provider/provider.dart';

class CatInfoScreen extends StatefulWidget {
  const CatInfoScreen({super.key});

  @override
  State<CatInfoScreen> createState() => _CatInfoScreenState();
}

class _CatInfoScreenState extends State<CatInfoScreen> {
  TextEditingController nameController = TextEditingController();
  void setName(String newName) {
    nameController.text = newName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cat info'),
        backgroundColor: Colors.lightBlue.shade50,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.fromLTRB(15, 30, 15, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('name'),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: const InputDecoration(hintText: 'name'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  onChanged: (value) {
                    setName(value);
                    context.read<MainProvider>().addName(value);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('age'),
              const SizedBox(
                height: 5,
              ),
              const AgeInput(),
              const SizedBox(
                height: 30,
              ),
              const Text('weight'),
              const SizedBox(
                height: 5,
              ),
              const WeightInput(),
              const SizedBox(
                height: 40,
              ),
              const Text('my pet info'),
              const SizedBox(
                height: 10,
              ),
              const PetInfo(),
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
