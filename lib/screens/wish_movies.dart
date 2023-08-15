import 'package:booking_ticket/screens/cubit/book_movies_cubit.dart';
import 'package:booking_ticket/screens/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class WishMovies extends StatelessWidget {
  var color1;
  var color2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<SettingCubit, ThemeData>(
      listener: (context, state) {
        if (state == ThemeMode.dark) {
          color1 = Colors.white;
          color2 = Colors.white70;
        } else {
          color1 = Colors.black;
          color2 = Colors.black45.withOpacity(0.3);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 32),
          ),
          elevation: 0,
          title: Text(
            "Favorite Movies",
            style: TextStyle(fontSize: 24, color: color1),
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
                        size: 28, color: color1),
                  ),
                ],
              ),
            )
          ],
        ),
        body: BlocBuilder<BookMoviesCubit, BookMoviesState>(
          builder: (context, state) {
            if (state is BookMoviesSuccess) {
              return Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: BlocProvider.of<BookMoviesCubit>(context)
                            .bookMovies
                            .length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "${BlocProvider.of<BookMoviesCubit>(context).bookMovies[index].image}"),
                                                  fit: BoxFit.fill)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "${BlocProvider.of<BookMoviesCubit>(context).bookMovies[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: color1)),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Icon(Icons.access_time_outlined,
                                                  color: Colors.amber,
                                                  size: 25),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text("2h 30 Min",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: color2)),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Icon(Icons.star,
                                                  color: Colors.amber,
                                                  size: 25),
                                              Text("4.5",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.amber))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                ],
              );
            } else {
              return Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("You Don't Have Any favorite Movies!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color1)),
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
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
      ),
    ));
  }
}
