import 'package:flutter/material.dart';

class CategoriesData extends StatefulWidget {
  @override
  _CategoriesDataState createState() => _CategoriesDataState();
}

class _CategoriesDataState extends State<CategoriesData> {
  List<Map<String, dynamic>> cats = [
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

  void _onCategoryTap(int index) {
    setState(() {
      for (var cat in cats) {
        cat['active'] = false; 
      }
      cats[index]['active'] = true; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(top: 20),
        child: cats.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cats.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onCategoryTap(index), // استدعاء الدالة عند الضغط
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: cats[index]['active'] ? Colors.orange : Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                cats[index]['icon'],
                                size: 20,
                                color: cats[index]['active'] ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cats[index]['txt'],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : const Center(child:  Text("No categories available")),
      ),
    );
  }
}