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
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        SizedBox(
          height: size.height * 0.05,
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
        ),
      ]),
    );
  }
}
