import 'package:flutter/material.dart';
import 'category.dart'; 
import 'package:my_product/models/dataa.dart';
import 'Product_data.dart';
import 'category_data.dart';
import 'search.dart';

List<Map<String, dynamic>> products = const [
  {
    'img': 'assets/images/ball.jpeg',
    'title': 'product 1',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    'img': 'assets/images/ball2.jpeg',
    'title': 'product 2',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    'img': 'assets/images/img3.jpeg',
    'title': 'product 3',
    'des': 'description ...',
    'price': '340\$'
  },
  {
    'img': 'assets/images/img4.webp',
    'title': 'product 4',
    'des': 'description ...',
    'price': '340\$'
  },
];

List<Map<String, dynamic>> cats = const [
  {
    'icon': Icons.sports_baseball,
    'active': true,
    'txt': 'Sports'
  },
  {
    'icon': Icons.devices,
    'active': false,
    'txt': 'Devices'
  },
  {
    'icon': Icons.book,
    'active': false,
    'txt': 'Books'
  },
  {
    'icon': Icons.local_mall,
    'active': false,
    'txt': 'Clothes'
  },
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottom(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: ListView(
              children: [
                Search(),
                const SizedBox(height: 30),
                Categories(txt: 'Categories'),
                CategoriesData(),
                const SizedBox(height: 80),
                const Text('Best Selling', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 230,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductData(products: getData[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: Image.asset(
                                products[index]['img'],
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              child: Text(products[index]['title'], style: const TextStyle(color: Colors.black, fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              child: Text(products[index]['des'], style: const TextStyle(color: Colors.black54, fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              child: Text(products[index]['price'], style: const TextStyle(color: Colors.amber, fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  BottomNavigationBar bottom() {
    return BottomNavigationBar(
      currentIndex: activeIndex,
      selectedLabelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      onTap: (value) => setState(() {
        activeIndex = value;
      }),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: activeIndex == 0 ? '*' : '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.store_mall_directory),
          label: activeIndex == 1 ? '*' : '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: activeIndex == 2 ? '*' : '',
        ),
      ],
    );
  }
}