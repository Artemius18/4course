import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.menu,
                    size: 35,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Good Morning',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
            const Row(
              children: [
                Text(
                  'Sanoj Dilshan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Icon(
                  Icons.waving_hand,
                  color: Colors.amber,
                  size: 25,
                ),
              ],
            ),
            const Row(
              children: [],
            )
          ],
        ),
      ))),
    );
  }
}
