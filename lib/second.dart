import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/list_provdier.dart';


class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: ((context, numbersListProivder, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbersListProivder.add();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: SizedBox(
          child: Column(
            children: [
              Text(
                numbersListProivder.numbers.last.toString(),
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbersListProivder.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      numbersListProivder.numbers[index].toString(),
                      style: const TextStyle(fontSize: 30),
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Second()));
                  },
                  child: const Text('Second'))
            ],
          ),
        ),
      )),
    );
  }
}
