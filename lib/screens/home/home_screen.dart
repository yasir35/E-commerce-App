import 'package:ecommerce_app/screens/home/categories/categories.dart';
import 'package:ecommerce_app/screens/home/grid/grid_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/routes_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Ebuy',
          style: TextStyle(
              color: Colors.red,
              fontFamily: 'LibreBaskerville',
              fontSize: 25,
              letterSpacing: 2,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 40,
              width: 80,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 228, 219, 219),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, Routename.cartPage);
                },
              ),
            ),
          ),
        ],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                      'Micheal',
                      style: TextStyle(fontFamily: 'SecularOne'),
                    ),
                    accountEmail: Text(
                      'Micheal@gmail.com',
                      style: TextStyle(fontFamily: 'SecularOne'),
                    ),
                    currentAccountPictureSize: Size.square(50),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(
                        'M',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Anton',
                            fontSize: 20),
                      ),
                    ),
                  )),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  'My Profile',
                  style: TextStyle(
                    fontFamily: 'Anton',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text(
                  'Notifications',
                  style: TextStyle(
                    fontFamily: 'Anton',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text(
                  'My Favourite',
                  style: TextStyle(
                    fontFamily: 'Anton',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Anton',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: const Text(
                  'My Orders',
                  style: TextStyle(
                    fontFamily: 'Anton',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 50),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'Anton',
                  ),
                ),
                onTap: () {
                  // Sign out the user
                  FirebaseAuth auth = FirebaseAuth.instance;
                  if (auth.currentUser != null) {
                    auth.signOut();
                  }
                  Navigator.pushNamed(context, Routename.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(children: [
          Container(
            height: 40,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey.withOpacity(0.3),
            ),
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                hintText: "Search items...",
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Text(
                'Get Huge Discount',
                style: TextStyle(
                  fontFamily: 'SecularOne',
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Flat 50%!',
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'LibreBaskerville',
                    fontSize: 25,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const CategoriesPage(),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Top Picks',
                style: TextStyle(
                    color: Colors.red, fontSize: 20, fontFamily: 'SecularOne'),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const GridItems(),
        ]),
      ),
    );
  }
}
