import 'package:booking_ticket/class_details/class_details.dart';
import 'package:booking_ticket/screens/cubit/book_movies_cubit.dart';
import 'package:booking_ticket/screens/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  String image;
  String name;
  BookingScreen({required this.image, required this.name});
  List<String> formats = ["2D", "3D", "4DX", "IMAX"];
  List<String> days = ["S", "M", "T", "W", "T", "F", "S"];
  var color1;
  var color2;
  var color3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<SettingCubit, ThemeData>(
        listener: (context, state) {
          if (state == ThemeData.dark()) {
            color1 = Color(0xFFF7D300);
            color2 = Colors.white70;
            color3 = Colors.white60;
          } else {
            color1 = Color(0xFFF7D300);
            color2 = Colors.black;
            color3 = Colors.black54.withOpacity(0.5);
          }
        },
        child: Material(
          color: color2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.2,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage("${image}"),
                          fit: BoxFit.fill,
                          opacity: 0.7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 18, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back,
                                  color: Colors.white, size: 30),
                            ),
                            Row(
                              children: [
                                Icon(Icons.share_outlined,
                                    color: Colors.white, size: 25),
                                SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<BookMoviesCubit>(context)
                                          .bookMovie(Details(
                                              image: image, name: name));

                                      final snackBar = SnackBar(
                                          content: Text(
                                              "you added this movie as a favorite successfully"));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    icon: Icon(Icons.favorite_outline,
                                        color: Colors.white, size: 25)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "${name}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Format",
                              style: TextStyle(
                                  color: Color(0xFFF7D300),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            height: 25,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {},
                                      child: Container(
                                        child: Center(
                                            child: Text("${formats[index]}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white70))),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: index == 1
                                                ? Color(0xFFF7D300)
                                                : Color(0xFF2F3236),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: index != 1
                                                ? Border.all(
                                                    color: Colors.white60)
                                                : null),
                                      ));
                                }),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Select Date",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: color2)),
                      SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${days[index]}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: color2)),
                                        Text("${index + 8}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: color2)),
                                      ],
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                      color:
                                          index == 1 ? Color(0xFFF7D300) : null,
                                      borderRadius: BorderRadius.circular(5),
                                      // border: index != 1
                                      //     ? Border.all(color: Colors.white60)
                                      //     : null
                                    ),
                                  ));
                            }),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xFFF7D300)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("City Complex Cinema",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: color2)),
                          Spacer(),
                          Text("Hall A",
                              style: TextStyle(
                                color: color2,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text("Select Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: color2)),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    child: Center(
                                      child: Text("${index + 8} : 30 AM",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: color2)),
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: index == 1
                                            ? Color(0xFFF7D300)
                                            : Colors.white24,
                                        borderRadius: BorderRadius.circular(5),
                                        border: index != 1
                                            ? Border.all(color: Colors.white60)
                                            : null),
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xFFF7D300)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("City Complex Cinema",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: color2)),
                          Spacer(),
                          Text("Hall B",
                              style: TextStyle(
                                color: color2,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Select Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white70)),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    child: Center(
                                      child: Text("${index + 11} : 30 AM",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: color2)),
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: index == 1
                                            ? Color(0xFFF7D300)
                                            : Colors.white24,
                                        borderRadius: BorderRadius.circular(5),
                                        border: index != 1
                                            ? Border.all(color: Colors.white60)
                                            : null),
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Material(
                          color: Color(0xFFF7D300).withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(
                                      "Book Ticket",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
