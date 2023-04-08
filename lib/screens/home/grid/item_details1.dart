import 'package:ecommerce_app/screens/home/grid/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../utils/routes_name.dart';
import '../cart/cart_model.dart';

class ItemDetails1 extends StatelessWidget {
  const ItemDetails1({
    super.key,
    required Item Item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 226, 220, 220),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: ImageSlideshow(
                      indicatorColor: Colors.red,
                      indicatorBackgroundColor: Colors.white,
                      indicatorRadius: 4,
                      height: 300,
                      children: [
                        Image.asset('assets/images/Sneakers1.png'),
                        Image.asset('assets/images/Sneakers2.png'),
                        Image.asset('assets/images/Sneakers7.png'),
                        Image.asset('assets/images/Sneakers9.png'),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, size: 25),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'White Sneakers',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('(250)'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Text(
                          '\$100',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Anton',
                          ),
                        ),
                        SizedBox(width: 5),
                        Text('30% off'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'The classic white sneaker will never go out of style, Adding a paneled accent color to a white shoe is the best way to make a subtle statement in 2022.',
                      style: TextStyle(fontFamily: 'SecularOne'),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routename.cartPage);
                      },
                      child:
                          Consumer<CartModel>(builder: (context, value, child) {
                        return Container(
                            width: 140,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color.fromARGB(255, 244, 12, 19)),
                            child: ElevatedButton(
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(0),
                              child: const Text('Add to Cart',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'LibreBaskerville',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ));
                      }),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
