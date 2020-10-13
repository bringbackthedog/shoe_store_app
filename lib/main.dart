import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const brands = [
  'Nike',
  'Adidas',
  'Jordan',
  'Puma',
  'Reebok',
  'Timberland',
  'Vans',
  'Converse'
];

const leftMenu = ['New', 'Featured', 'Upcoming'];

class Shoe {
  final String name;
  final String image;
  final double price;
  final Color color;

  const Shoe({
    this.name,
    this.image,
    this.price,
    this.color,
  });
}

const shoes = [
  const Shoe(
      name: 'NIKE EPICT-REACT',
      price: 130.00,
      image: 'images/shoes/1.png',
      color: Color(0xFF5574b9)),
  const Shoe(
      name: 'NIKE AIR-MAX',
      price: 130.00,
      image: 'images/shoes/2.png',
      color: Color(0xFF52b8c3)),
  const Shoe(
      name: 'NIKE AIR-270',
      price: 150.00,
      image: 'images/shoes/3.png',
      color: Color(0xFFE3AD9B)),
  const Shoe(
      name: 'NIKE EPICT-REACTII',
      price: 160.00,
      image: 'images/shoes/4.png',
      color: Color(0xFF444547)),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // final size = MediaQuery.of(context).size;
      home: Scaffold(
        appBar: buildAppBar(context),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: ColumnBody(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      textTheme: Theme.of(context).textTheme.copyWith(),
      title: Text(
        'Discover',
        style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      actions: [
        CircleAvatar(child: Icon(Icons.search)),
        SizedBox(
          width: 18.0,
        ),
        CircleAvatar(child: Icon(Icons.notifications_none)),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      // backgroundColor: bottomBackgroundColor,
      unselectedItemColor: Colors.grey[400],
      elevation: 4,
      type: BottomNavigationBarType.fixed,
      iconSize: 35,
      items: [
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.favorite_border,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.location_city,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.shopping_cart,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(''),
          icon: Icon(
            Icons.person_outline,
          ),
        )
      ],
    );
  }
}

class ColumnBody extends StatelessWidget {
  const ColumnBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildTopMenu(size),
              //center list
              SizedBox(
                  height: size.maxHeight * 0.65,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // log(constraints.maxWidth.toString());
                      return Stack(
                        children: [
                          //left menu
                          Positioned(
                            left: 0,
                            width: constraints.maxWidth * 0.15,
                            height: constraints.maxHeight,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: SizedBox.expand(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      leftMenu[0],
                                      style: GoogleFonts.roboto(
                                          color: Colors.black, //New
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      leftMenu[1],
                                      style: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(leftMenu[2],
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //main shoe list
                          Positioned(
                            // left: 25,
                            left: constraints.maxWidth * 0.2,
                            width: constraints.maxWidth * 0.8,
                            height: constraints.maxHeight,

                            child: Column(
                              children: [Text('Column2')],
                            ),
                          ),
                        ],
                      );
                    },
                  )),
              //bottom list
              buildBottomMenu(size),
            ],
          ),
        );
      },
    );
  }

  SizedBox buildBottomMenu(BoxConstraints size) {
    return SizedBox(
      height: size.maxHeight * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: size.maxWidth * 0.45,
            height: size.maxHeight * 0.65,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Card(
                elevation: 10,
                // child: Image.asset(shoes[index].image),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // log(constraints.maxWidth.toString());
                    return Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.favorite_border),
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Container(
                            width: 60,
                            height: 27,
                            color: Colors.pink,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'NEW',
                                style: GoogleFonts.roboto(
                                    // fontSize:
                                    color: Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 23,
                          left: 45,
                          height: 90,
                          child: Transform.rotate(
                              angle: math.pi / 10,
                              child: Image.asset('images/shoes/1.png')),
                        ),
                        Positioned(
                          top: 105,
                          width: constraints.maxWidth,
                          child: Text(
                            shoes[index].name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(fontSize: 16),
                          ),
                        ),
                        Positioned(
                          top: 125,
                          width: constraints.maxWidth,
                          child: Text(
                            "\$${shoes[index].price.toString()}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox buildTopMenu(BoxConstraints size) {
    return SizedBox(
      height: size.maxHeight * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                brands[index],
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: index == 0 ? Colors.black : Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
