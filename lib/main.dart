import 'package:booking_ticket/screens/booking_screen.dart';
import 'package:booking_ticket/screens/cubit/book_movies_cubit.dart';
import 'package:booking_ticket/screens/cubit/setting_cubit.dart';
import 'package:booking_ticket/screens/home_page.dart';
import 'package:booking_ticket/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingCubit>(
          create: (context) => SettingCubit(),
        ),
        BlocProvider<BookMoviesCubit>(create: (context) => BookMoviesCubit())
      ],
      child: BlocBuilder<SettingCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state,
              routes: {
                "homePage": (context) => HomePage(),
              },
              home: WelcomeScreen());
        },
      ),
    );
  }
}
