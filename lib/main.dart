import 'package:menufyy/providers/carosel_slider.dart';
import 'package:menufyy/providers/restaurant_item.dart';
import 'package:menufyy/providers/table.dart';

import 'package:menufyy/scrrens/restaurant_screen.dart';

import 'package:menufyy/scrrens/fav_screen.dart';
import 'package:menufyy/scrrens/seat_no_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Menufy());
}

class Menufy extends StatelessWidget {
  const Menufy({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => TableNo())),
        ChangeNotifierProvider(create: ((context) => CarouselImages())),
        ChangeNotifierProvider(create: ((context) => Item()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          // appBar: AppBar(
          //   title: Text('Menufy'),
          // ),
          body: SeatScreen(),
        ),
        routes: {
          Fav.routeName: (context) => const Fav(),
          // CartScreen.routeName : (context) => CartScreen(),
          RestaurantScreen.routeName: (context) => const RestaurantScreen(),
        },
      ),
    );
  }
}
