import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/models/data_model.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkeling',
    'balloning.png': 'Ballooning',
    'hiking.png': 'Hiking'
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit,CubitStates>(
        builder: (context,state) {
          if(state is LoadedState){
            List<DataModel> dataModelList = state.dataModelList;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: AppLargeText(
                    text: 'Discover',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                      tabs: [
                        Text('Places'),
                        Text('Inspirations'),
                        Text('Emotions'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount: dataModelList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: (){
                               BlocProvider.of<AppCubit>(context).goToDetailPage(dataModelList[index]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15,top: 30),
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+dataModelList[index].img),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          }),
                      Text('Second Tab view'),
                      Text('Third Tab'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore more",
                        size: 22,
                      ),
                      AppText(
                        text: 'See all',
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 120,
                  width: double.maxFinite,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/${images.keys.elementAt(index)}'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: AppText(text: images.values.elementAt(index),color: AppColors.textColor2,),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          }else{
            return Container();
          }

        }
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    Offset _circleOffset = Offset(configuration.size!.width / 2 -radius/2, configuration.size!.height+radius*2);
    canvas.drawCircle(offset + _circleOffset, radius, _paint);
  }
}
