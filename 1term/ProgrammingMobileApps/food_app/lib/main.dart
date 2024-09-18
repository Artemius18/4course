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
          child: Row(
            children: [
              // Левая часть - меню
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.fastfood),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.cake),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.icecream),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.rice_bowl),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.soup_kitchen),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.coffee),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.local_pizza),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.local_drink),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings),
                        color: Colors.orange,
                        iconSize: 35,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              // Правая часть - контент
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Good Morning',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            'Sanoj Dilshan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Icon(
                            Icons.waving_hand,
                            color: Colors.orange,
                            size: 25,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Кнопки "All" и "Popular"
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {},
                            child: const Text('All',
                              style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                            ),
                            onPressed: () {},
                            child: const Text('Popular'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '(1060 dishes)',
                            style: TextStyle(
                              color: Colors.orange[700],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.menu_outlined),
                            color: Colors.orange,
                            iconSize: 35,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      // Список товаров
                      Expanded(
                        child: ListView(
                          children: [
                            pizzaItem(
                              'Пепперони Делюкс',
                              '9.99',
                              '4.5',
                              '500 г',
                              'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/Pepperony_Delux_100_big-thumbnail-480x480.png',
                            ),
                            pizzaItem(
                              'Сырная',
                              '7.99',
                              '4.8',
                              '450 г',
                              'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/5_syrov-thumbnail-480x480.png',
                            ),
                            pizzaItem(
                              'Цыпленок барбекю',
                              '10.99',
                              '4.6',
                              '550 г',
                              'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/barbecue-thumbnail-480x480.png',
                            ),
                            pizzaItem(
                              'Баварская',
                              '8.99',
                              '4.9',
                              '800 г',
                              'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/HotKebab_big-thumbnail-480x480.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Виджет для отображения товара
  Widget pizzaItem(String name, String price, String rating, String weight, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        color: Colors.grey[100],
        child: ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          leading: Image.network(imageUrl, width: 100, height: 70),
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 5),
                  Text(
                    rating,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Вес: $weight',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                'Цена: $price',
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
