import 'package:booking_ticket/screens/all_movies.dart';
import 'package:booking_ticket/screens/booking_screen.dart';

import 'package:booking_ticket/screens/cubit/book_movies_cubit.dart';
import 'package:booking_ticket/screens/cubit/setting_cubit.dart';
import 'package:booking_ticket/screens/wish_movies.dart';
import 'package:flutter/material.dart';
import 'package:booking_ticket/class_details/class_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

import '../App_images/app_images.dart';

class HomePage extends StatelessWidget {
  var color1;
  var color2;
  var color3;

  List<Details> movies1 = [
    Details(image: "${Assets.AntMan3}", name: "Ant Man 3"),
    Details(image: "${Assets.Aquaman2}", name: "Aquaman 2"),
    Details(image: "${Assets.GOTGVol3}", name: "GOTG Vol 3"),
    Details(image: "${Assets.Shazam2}", name: "Shazam 2"),
  ];
  List<Details> movies2 = [
    Details(image: "${Assets.GOTGVol3}", name: "GOTG Vol 3"),
    Details(image: "${Assets.Shazam2}", name: "Shazam 2"),
    Details(image: "${Assets.Aquaman2}", name: "Aquaman 2"),
    Details(image: "${Assets.AntMan3}", name: "AntMan 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingCubit, ThemeData>(
      listener: (context, state) {
        if (state == ThemeData.dark()) {
          color1 = Color(0xFFF7D300);
          color2 = Colors.white;
          color3 = Colors.white70;
        } else {
          color1 = Color(0xFFF7D300);
          color2 = Colors.black;
          color3 = Colors.black54.withOpacity(0.5);
        }
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0.5, end: 6),
                badgeContent: Text(
                    "${BlocProvider.of<BookMoviesCubit>(context).counter}"),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WishMovies()));
                  },
                  icon: Icon(Icons.favorite_outline, size: 32),
                ),
              ),
              // backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "DP Cineples",
                style: TextStyle(fontSize: 24, color: color2),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<SettingCubit>(context).toggleTheme();
                        },
                        child: Icon(Icons.light_mode_outlined,
                            size: 28, color: color2),
                      ),
                    ],
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Playing Now",
                          style: TextStyle(
                              color: color2,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllMovies()));
                        },
                        child: Text("View All",
                            style: TextStyle(
                                color: Color(0xFFF7D300),
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 390,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: movies1.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BookingScreen(
                                                    image:
                                                        '${movies1[index].image}',
                                                    name:
                                                        "${movies1[index].name}",
                                                  )));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "${movies1[index].image}",
                                        height: 280,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${movies1[index].name}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: color2),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 25,
                                              color: Color(0xFFF7D300),
                                            ),
                                            Text("4.5",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFFF7D300),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.access_time_rounded,
                                                size: 20, color: color3),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("2h 30min",
                                                style: TextStyle(color: color3))
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Comming Soon",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: color3)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllMovies()));
                        },
                        child: Text("View All",
                            style: TextStyle(
                                color: Color(0xFFF7D300),
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                    height: 250,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: movies2.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BookingScreen(
                                                    image:
                                                        '${movies2[index].image}',
                                                    name:
                                                        "${movies2[index].name}",
                                                  )));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "${movies2[index].image}",
                                        fit: BoxFit.fill,
                                        height: 200,
                                        width: 180,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${movies2[index].name}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: color2),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
              ],
            )),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: 'WishMovies',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.movie_creation),
                  label: 'Movies',
                ),
              ],
            )),
      ),
    );
  }
}
