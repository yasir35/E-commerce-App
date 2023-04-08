import 'package:ecommerce_app/screens/home/grid/item_details1.dart';
import 'package:ecommerce_app/screens/home/grid/item_details2.dart';
import 'package:ecommerce_app/screens/home/grid/item_details3.dart';
import 'package:ecommerce_app/screens/home/grid/item_details4.dart';
import 'package:flutter/material.dart';

import 'catalog.dart';

class GridItems extends StatelessWidget {
  const GridItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetails1(Item: items[index]),
                    ));
              } else if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetails2(Item: items[index]),
                    ));
              } else if (index == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetails3(Item: items[index]),
                    ));
              } else if (index == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetails4(Item: items[index]),
                    ));
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: items[index].color,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 4,
                            spreadRadius: 2),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              items[index].detail,
                              style: const TextStyle(
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 247, 101, 90),
                            )
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            items[index].image,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(items[index].title,
                                style: const TextStyle(
                                    fontFamily: 'Anton',
                                    fontWeight: FontWeight.bold)),
                            Text("\$ ${items[index].price}",
                                style: const TextStyle(
                                  fontFamily: 'SecularOne',
                                )),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
