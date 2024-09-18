import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PizzaDetailPage(),
    );
  }
}

class PizzaDetailPage extends StatelessWidget {
  const PizzaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Верхняя панель: стрелка назад, название товара, иконка уведомлений
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.orange, size: 30),
                    onPressed: () {
                    },
                  ),
                  const Text(
                    'Пепперони Делюкс',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: Colors.orange, size: 30),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            // Большое изображение пиццы
            Center(
              child: Image.network(
                'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/Pepperony_Delux_100_big-thumbnail-480x480.png',
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            const SizedBox(height: 20),
            // Цена и другие детали
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '9.99 BYN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.orange,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share_outlined, color: Colors.orange),
                            onPressed: () {
                            },
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orange, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.5',
                                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Updated: Sep 17, 2024, 12:30 PM',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  // Детали: размер, доставка, категория
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      detailItem('Size', 'Medium'),
                      detailItem('Delivery', '30 min'),
                      detailItem('Category', 'No Gluten'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Сочетание остроты и нежности: пепперони, сыр и свежие овощи. Вкусное дополнение к любому столу.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Кнопки для выбора размера и "Add"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      sizeButton('M', context),
                      const SizedBox(width: 10),
                      sizeButton('L', context),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[600],
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                    },
                    child: const Text(
                      '+ Add',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Виджет для кнопок выбора размера
  Widget sizeButton(String size, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
      },
      child: Text(
        size,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }

  // Виджет для отображения деталей: Размер, Доставка, Категория
  Widget detailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
