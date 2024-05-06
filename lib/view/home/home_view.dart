import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:divo_king/controller/cubitHome/cubit.dart';
import 'package:divo_king/controller/cubitHome/states.dart';
import 'package:divo_king/model/HomeModal/home_model.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:divo_king/view/search/search.dart';
import 'package:divo_king/view/service_details/service_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          HomeCubit()..getDataForHome(status: 'recommend'),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                  onTap: () => ZoomDrawer.of(context)!.toggle(),
                  child: Image.asset('assets/icons/menu (1).png')),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0.w),
                  child: Image.asset('assets/icons/bell.png'),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defultText(
                        text: 'Good Morning,\nOmar!',
                        fontSize: 28.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    SizedBox(
                      height: 37.0.h,
                    ),
                    defultTextFormFiled(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchView()));
                      },
                      hintText: 'Find your Admire Place',
                      prefix: Icons.search,
                      // onTap: (){
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchView()));
                      // }
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            HomeCubit.get(context)
                                .getDataForHome(status: 'recommend');
                            HomeCubit.get(context).setSelectedOption(0);
                          },
                          child: Column(
                            children: [
                              defultText(
                                text: 'Recommend',
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.w700,
                                color:
                                    HomeCubit.get(context).selectedOption == 0
                                        ? kPrimaryColor
                                        : Colors.grey,
                              ),
                              CircleAvatar(
                                radius: 5.0.r,
                                backgroundColor:
                                    HomeCubit.get(context).selectedOption == 0
                                        ? kPrimaryColor
                                        : Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30.0.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            HomeCubit.get(context)
                                .getDataForHome(status: 'popular');
                            HomeCubit.get(context).setSelectedOption(1);
                          },
                          child: Column(
                            children: [
                              defultText(
                                text: 'Popular',
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.w700,
                                color:
                                    HomeCubit.get(context).selectedOption == 1
                                        ? kPrimaryColor
                                        : Colors.grey,
                              ),
                              CircleAvatar(
                                radius: 5.0.r,
                                backgroundColor:
                                    HomeCubit.get(context).selectedOption == 1
                                        ? kPrimaryColor
                                        : Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 35.0.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            HomeCubit.get(context)
                                .getDataForHome(status: 'trending');
                            HomeCubit.get(context).setSelectedOption(2);
                          },
                          child: Column(
                            children: [
                              defultText(
                                text: 'Trending',
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.w700,
                                color:
                                    HomeCubit.get(context).selectedOption == 2
                                        ? kPrimaryColor
                                        : Colors.grey,
                              ),
                              CircleAvatar(
                                radius: 5.0.r,
                                backgroundColor:
                                    HomeCubit.get(context).selectedOption == 2
                                        ? kPrimaryColor
                                        : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0.h,
                    ),
                    SizedBox(
                      height: 350.0.h,
                      child: ConditionalBuilder(
                        condition: state is! HomeLoadingStates,
                        builder: (context) => ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => builderWidgetHome(
                                HomeCubit.get(context).homeModel!,
                                index,
                                context),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 30.0.w,
                                ),
                            itemCount:
                                HomeCubit.get(context).homeModel!.data!.length),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget builderWidgetHome(HomeModel homeModel, index, context) =>
    GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ServiceDetailsView(id: homeModel.data![index].id,)));
      },
      child: Stack(
        children: [
          if (homeModel.data![index].images!.isNotEmpty)
            Container(
                width: 250.0.w,
                height: 400.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0.r),
                image: DecorationImage(image: NetworkImage(homeModel.data![index].images![0],),
                  fit: BoxFit.fitHeight,
              ),
),
            ),

              // child: Image(
              //   image: NetworkImage(homeModel.data![index].images![0]),
              //   width: 250.0.w,
              //   height: 400.0.h,
              //   fit: BoxFit.fitHeight,
              //
              // ),

            if (homeModel.data![index].images!.isEmpty)
            Image.asset(
              'assets/images/img.jpg',
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 130.w,
                    ),
                    Container(
                      width: 74.0.w,
                      height: 36.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.5.r),
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/Star.svg'),
                          SizedBox(
                            width: 7.0.w,
                          ),
                          Text(
                            '4.6',
                            style: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200.0.h,
                ),
                Text(
                  '${homeModel.data![index].name}',
                  style: TextStyle(fontSize: 20.0.sp, color: Colors.white),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Shop.svg'),
                    SizedBox(
                      width: 10.0.w,
                    ),
                    Text(
                      'Petra Diving Center',
                      style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/volume 1.svg'),
                    SizedBox(
                      width: 10.0.w,
                    ),
                    Text(
                      'Beginner',
                      style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/map-pin.svg'),
                    SizedBox(
                      width: 10.0.w,
                    ),
                    Text(
                      'Aqaba, Jordan',
                      style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
