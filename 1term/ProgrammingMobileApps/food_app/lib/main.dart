import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Row(
          children: [
            Container(
              width: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                        Icons.fastfood_outlined, color: Colors.orange,
                        size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.local_pizza_outlined, color: Colors.orange,
                        size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.local_drink_outlined, color: Colors.orange,
                        size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.cake_outlined, color: Colors.orange, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.icecream_outlined, color: Colors.orange,
                        size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.local_cafe_outlined, color: Colors.orange,
                        size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.restaurant_menu_outlined, color: Colors.orange,
                        size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.breakfast_dining_outlined, color: Colors.orange,
                        size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Good morning',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const Text(
                      'Sanoj Dilshan 👋',
                      style: TextStyle(fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MenuButton(
                              label: 'All',
                              icon: Icons.all_inclusive,
                              selected: true,
                              onSelected: (selected) {}
                          ),
                          MenuButton(
                              label: 'Popular',
                              icon: Icons.star,
                              selected: false,
                              onSelected: (selected) {}
                          ),
                          MenuButton(
                              label: 'New',
                              icon: Icons.new_releases,
                              selected: false,
                              onSelected: (selected) {}
                          ),
                          MenuButton(
                              label: 'Special',
                              icon: Icons.local_offer,
                              selected: false,
                              onSelected: (selected) {}
                          ),
                          MenuButton(
                              label: 'Recommended',
                              icon: Icons.thumb_up,
                              selected: false,
                              onSelected: (selected) {}
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '(1060 dishes)',
                          style: TextStyle(color: Colors.orange[700]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.orange,
                              size: 35),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 0),
                        children: [
                          buildDishCard(
                            context,
                            'Barbecue Pizza',
                            '100.00',
                            '120.00',
                            'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/barbecue-thumbnail-480x480.png',
                            '5.0',
                            'Updated: September 22, 2020, 22:18',
                            '450gr',
                          ),
                          buildDishCard(
                            context,
                            'Hot Kebab',
                            '90.00',
                            '',
                            'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/HotKebab_big-thumbnail-480x480.png',
                            '4.3',
                            'Updated: September 21, 2020, 18:30',
                            '500gr',
                          ),
                          buildDishCard(
                            context,
                            '5 Cheeses Pizza',
                            '34.00',
                            '',
                            'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/5_syrov-thumbnail-480x480.png',
                            '4.1',
                            'Updated: September 20, 2020, 16:15',
                            '400gr',
                          ),
                          buildDishCard(
                            context,
                            'Pepperoni Deluxe',
                            '20.00',
                            '',
                            'https://media.dominos.by/__sized__/menu/product_osg_image/2023/11/02/Pepperony_Delux_100_big-thumbnail-480x480.png',
                            '4.0',
                            'Updated: September 19, 2020, 14:00',
                            '600gr',
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
    );
  }

  Widget MenuButton(
      {required String label, required IconData icon, required bool selected, required ValueChanged<
          bool> onSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ChoiceChip(
        label: Row(
          children: [
            Icon(icon, size: 18,
                color: selected ? Colors.white : Colors.orange[900]),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.orange[900],
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
        selected: selected,
        onSelected: onSelected,
        backgroundColor: Colors.orange[100],
        selectedColor: Colors.orange[700],
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        showCheckmark: false,
        side: BorderSide(
          color: selected ? Colors.transparent : Colors.transparent,
          width: 0,
        ),
      ),
    );
  }


  Widget buildDishCard(BuildContext context, String title, String price,
      String oldPrice, String imageUrl, String rating, String updatedAt,
      String weight) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: Container(
          height: 140,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit
                      .cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 16)),
                      Text(updatedAt, style: const TextStyle(
                          color: Colors.grey, fontSize: 9)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.black, size: 12),
                          const SizedBox(width: 2),
                          Text(rating, style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('\$$price', style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          if (oldPrice.isNotEmpty)
                            Text(
                              '\$$oldPrice',
                              style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 10,
                              ),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(weight, style: const TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                                Icons.arrow_forward, color: Colors.orange[700],
                                size: 18),
                          ),
                        ],
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
}
