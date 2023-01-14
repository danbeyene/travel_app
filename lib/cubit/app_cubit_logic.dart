import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return const MainPage();
          }
          if (state is DetailPageState) {
            return const DetailPage();
          }
          if (state is FailureState) {
            return const Scaffold(
                body: Center(
              child: Text('get data error'),
            ));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
