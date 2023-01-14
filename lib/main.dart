import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';
import 'package:travel_app/services/data_services.dart';

import 'cubit/app_cubit_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubit>(
        create: (context)=>AppCubit(dataServices: DataServices()),
        child: const AppCubitLogic(),
      ),
    );
  }
}
