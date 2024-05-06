import 'package:divo_king/controller/cubitBookmark/cubit.dart';
import 'package:divo_king/controller/cubitBookmark/states.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:divo_king/view/Description/description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

  class serviceDetailsView extends StatelessWidget {
  const serviceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>BookMarkCubit(),
      child: BlocConsumer<BookMarkCubit,BookMarkStates>(
        listener: (context,state){},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.white ,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: defultText(
                      text: 'Bookmarks',
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 25.0.h,
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionView()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 125.h,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Rectangle Details10.png',
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  defultText(
                                      text: 'Royal Snorkeling',
                                      fontSize: 18.0.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                  SizedBox(
                                    height: 13.0.h,
                                  ),
                                  defultText(
                                    text: 'Aqaba, Jordan',
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff3E3E3E),
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/Star.svg'),
                                      SizedBox(
                                        width: 8.0.w,
                                      ),
                                      defultText(
                                          text: '4.6',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFD9942)),
                                      SizedBox(
                                        width: 8.0.w,
                                      ),
                                      defultText(
                                          text: '(1.7K)',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffA9A9A9)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0.h,
                                  ),
                                ],
                              ),
                              Container(
                                width: 50.0.w,
                                height: 50.0.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0.h),
                                        bottomRight: Radius.circular(10.0)),
                                    color: kPrimaryColor),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          defultText(
                                            text: '100',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 22.0.w,
                                              ),
                                              defultText(
                                                text: 'JD',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.h,
                      ),
                      itemCount: 10),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
