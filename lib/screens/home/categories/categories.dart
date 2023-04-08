import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'categories_model.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < categories.length; i++)
                InkWell(
                  onTap: () {
                    setState(() {
                      id = categories[i].id;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: id == i
                          ? const Color.fromARGB(255, 190, 223, 245)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          categories[i].image,
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          categories[i].name,
                          style: TextStyle(
                              color: id == i ? Colors.red : Colors.black,
                              fontFamily: 'SecularOne'),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
            height: 120,
            width: 420,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 241, 129, 129),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Stack(children: [
              Center(
                child: ImageSlideshow(
                    indicatorColor: Colors.red,
                    indicatorBackgroundColor: Colors.white,
                    indicatorRadius: 4,
                    isLoop: true,
                    autoPlayInterval: 3000,
                    children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (id == 0)
                            Image.asset('assets/images/Sneakers1.png',
                                height: 100, width: 150),
                          Image.asset('assets/images/Sneakers2.png'),
                          Image.asset('assets/images/Sneakers3.png'),
                          Image.asset('assets/images/Sneakers5.png'),
                          Image.asset('assets/images/Sneakers6.png'),
                          Image.asset('assets/images/Sneakers7.png'),
                          Image.asset('assets/images/Sneakers9.png'),
                          Image.asset('assets/images/Sneakers10.png'),
                          Image.asset('assets/images/Sneakers11.png'),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (id == 1)
                            Image.asset('assets/images/Formals4.png',
                                height: 100, width: 150),
                          Image.asset('assets/images/Formals2.png'),
                          Image.asset('assets/images/Formals3.png'),
                          Image.asset('assets/images/Formals1.png'),
                          Image.asset('assets/images/Formals5.png'),
                          Image.asset('assets/images/Formals7.png'),
                          Image.asset('assets/images/Formals9.png'),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (id == 2)
                            Image.asset('assets/images/Boots1.png',
                                height: 100, width: 150),
                          Image.asset('assets/images/Boots2.png'),
                          Image.asset('assets/images/Boots3.png'),
                          Image.asset('assets/images/Boots4.png'),
                          Image.asset('assets/images/Boots5.png'),
                          Image.asset('assets/images/Boots7.png'),
                          Image.asset('assets/images/Boots8.png'),
                          Image.asset('assets/images/Boots9.png'),
                          Image.asset('assets/images/Boots10.png'),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (id == 3)
                            Image.asset('assets/images/Jackets12.png',
                                height: 100, width: 150),
                          Image.asset('assets/images/Jackets4.png'),
                          Image.asset('assets/images/Jackets5.png'),
                          Image.asset('assets/images/Jackets7.png'),
                          Image.asset('assets/images/Jackets8.png'),
                          Image.asset('assets/images/Jackets9.png'),
                          Image.asset('assets/images/Jackets10.png'),
                          Image.asset('assets/images/Jackets11.png'),
                          Image.asset('assets/images/Jackets11.png'),
                          Image.asset('assets/images/Jackets13.png'),
                          Image.asset('assets/images/Jackets14.png'),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (id == 4)
                            Image.asset('assets/images/Shirts12.png',
                                height: 100, width: 150),
                          Image.asset('assets/images/Shirts3.png'),
                          Image.asset('assets/images/Shirts5.png'),
                          Image.asset('assets/images/Shirts6.png'),
                          Image.asset('assets/images/Shirts7.png'),
                          Image.asset('assets/images/Shirts9.png'),
                          Image.asset('assets/images/Shirts11.png'),
                          Image.asset('assets/images/Shirts1.png'),
                        ],
                      ),
                    ]),
              ),
            ])),
      ],
    );
  }
}
