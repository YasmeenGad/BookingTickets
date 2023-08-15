import 'package:booking_ticket/App_images/app_images.dart';
import 'package:booking_ticket/class_details/class_details.dart';
import 'package:booking_ticket/screens/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMovies extends StatelessWidget {
  List<Details> movies1 = [
    Details(image: "${Assets.AntMan3}", name: "Ant Man 3"),
    Details(image: "${Assets.Aquaman2}", name: "Aquaman 2"),
    Details(image: "${Assets.GOTGVol3}", name: "GOTG Vol 3"),
    Details(image: "${Assets.Shazam2}", name: "Shazam 2"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.white)),

        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "All Movies",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),

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
                      size: 28, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            SizedBox(
              height: 596,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: movies1.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "${movies1[index].image}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${movies1[index].name}",
                              style: TextStyle(fontSize: 17),
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_time_outlined, size: 20),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "2h",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, size: 24, color: Colors.amber),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.amber),
                                ),
                              ],
                            ),
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.amber,
                                onPressed: () {},
                                child: Text("Book a Ticket",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)))
                          ],
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
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
      ),
    ));
  }
}
