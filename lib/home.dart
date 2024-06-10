import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/list_provdier.dart';
import 'package:providerpractice/second.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  Expanded(
                    child: ListView.builder(
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
