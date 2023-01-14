import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/models/data_model.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../cubit/app_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit,CubitStates>(
        builder: (context, state) {
          if(state is DetailPageState){
            DataModel dataModel = state.dataModel;
            return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 350,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+dataModel.img),
                                  fit: BoxFit.cover)),
                        )),
                    Positioned(
                        top: 50,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  BlocProvider.of<AppCubit>(context).goBack();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 30,
                                  color: Colors.white,
                                ))
                          ],
                        )),
                    Positioned(
                        top: 320,
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                          width: MediaQuery.of(context).size.width,
                          height: 550,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppLargeText(
                                    text: dataModel.name,
                                    size: 22,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  AppLargeText(
                                    text: '\$ ${dataModel.price}',
                                    size: 22,
                                    color: AppColors.mainColor,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: AppColors.mainColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AppText(
                                    text: dataModel.location,
                                    size: 12,
                                    color: AppColors.textColor1,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(5, (index) {
                                      return Icon(
                                        Icons.star,
                                        color: index < dataModel.stars
                                            ? AppColors.starColor
                                            : AppColors.textColor2,
                                        size: 20,
                                      );
                                    }),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  AppText(
                                    text: '(4.0)',
                                    color: AppColors.textColor2,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              AppLargeText(
                                text: 'People',
                                size: 20,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AppText(
                                text: 'Number of people in your group',
                                color: AppColors.mainTextColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: List.generate(dataModel.people, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: AppButtons(
                                            text: (index + 1).toString(),
                                            childColor: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                            backgroundColor: selectedIndex == index
                                                ? Colors.black
                                                : AppColors.buttonBackground,
                                            borderColor: selectedIndex == index
                                                ? Colors.black
                                                : AppColors.buttonBackground,
                                            size: 50)),
                                  );
                                }),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AppLargeText(
                                text: 'Description',
                                size: 20,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AppText(
                                text:
                                dataModel.description,
                                color: AppColors.mainTextColor,
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Row(
                          children: [
                            AppButtons(
                              childColor: AppColors.textColor2,
                              backgroundColor: Colors.white,
                              borderColor: AppColors.textColor2,
                              size: 60,
                              isIcon: true,
                              icon: Icons.favorite_border,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ResponsiveButton(
                              isResponsive: true,
                            )
                          ],
                        ))
                  ],
                ));
          }else{
            return Container();
          }
        }
      ),
    );
  }
}
