import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold1(),
    );
  }
}

class Scaffold1 extends StatelessWidget {
  const Scaffold1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back),
            Row(
              children: [Icon(Icons.exit_to_app_sharp), Icon(Icons.settings)],
            )
          ],
        ),
      ),
      body: const Body1(),
    );
  }
}

class Body1 extends StatelessWidget {
  const Body1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset('assets/image.png'),
            Container(
              padding: null,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '1975 Porsche 911 Carrera',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.thumb_up), Text('0')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.message), Text('0')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.share), Text('Share')],
                  )
                ],
              ),
            ),
            const EssentialInfo()
          ],
        ));
  }
}

class DataFrame extends StatelessWidget {
  const DataFrame(
      {super.key,
      required this.text,
      required this.color,
      required this.widget1});

  final String text;
  final Color color;
  final Widget widget1;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.check_circle,
                color: color,
              ),
              Text(
                text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.edit)
            ],
          )
        ]));
  }
}

class EssentialInfo extends StatelessWidget {
  const EssentialInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Essential Information',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              '1 of 3 done',
              style: TextStyle(
                  fontSize: 19, color: Color.fromARGB(255, 93, 91, 85)),
            )
          ],
        ),
        Divider(
          color: Colors.black,
          thickness: 1.0,
        ),
        DataFrame(
          text: 'Year, Make, Model',
          color: Colors.green,
          widget1: Column(
            children: [
              Text(
                'Year: 1975',
                style: TextStyle(),
              ),
              Text('Make: Porsche'),
              Text("Model: 911 Carrera"),
              Text('VIN: 193939494')
            ],
          ),
        ),
        DataFrame(
          text: 'Description',
          color: Color.fromARGB(255, 117, 117, 115),
          widget1: Placeholder(),
        ),
        DataFrame(
          text: 'Photos',
          color: Color.fromARGB(255, 117, 117, 115),
          widget1: Placeholder(),
        )
      ],
    );
  }
}
