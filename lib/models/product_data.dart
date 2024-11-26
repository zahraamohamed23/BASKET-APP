import 'package:flutter/material.dart';
import 'package:my_product/models/dataa.dart';
import 'package:my_product/models/home.dart';

class ProductData extends StatefulWidget {
  const ProductData({super.key, required this.products });
  
  final Data products;
  

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
int activeIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> const HomePage()));},
                           icon: const Icon(Icons.arrow_back, size: 20, color: Colors.white)),
                          const SizedBox(width: 5),
                          Text(widget.products.title, style: const TextStyle(fontSize: 20, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.menu, size: 30),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Image.asset(widget.products.img),
                      ),
                      const SizedBox(height: 20),
                      Text(widget.products.title,
                          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text(widget.products.des,
                          style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text(widget.products.price,
                          style: const TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }}