import 'dart:ui';
import 'package:divo_king/controller/cubitCenterDetails/cubit.dart';
import 'package:divo_king/controller/cubitCenterDetails/states.dart';
import 'package:divo_king/controller/cubitServiceDetails/cubit.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:divo_king/view/Description/description.dart';
import 'package:divo_king/view/Reviews/reviews.dart';
import 'package:divo_king/view/center-details-diving/center-details-diving.dart';
import 'package:divo_king/view/xxxxxx/center-detailss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CenterDetailsView extends StatefulWidget {
  var id;
  CenterDetailsView(
      {super.key, this.id,});

  @override
  State<CenterDetailsView> createState() => _CenterDetailsViewState();
}

class _CenterDetailsViewState extends State<CenterDetailsView> {
int serviceIndex=0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CenterDetailsCubit()..getCenterDetails(widget.id),
      child: BlocConsumer<CenterDetailsCubit,CenterDetailsStates>(
        listener: (BuildContext context, CenterDetailsStates state) {  },
        builder: (BuildContext context, CenterDetailsStates state) {
          var cubit = CenterDetailsCubit.get(context);
          return CenterDetailsCubit.get(context).centerDetailsModel!=null
              ? Scaffold(
            body: Stack(
              children: [
                Image.asset('assets/images/Rectangle 10.png'),
                Padding(
                  padding: EdgeInsets.only(top: 31.0.h, right: 25.0.w, left: 25.0.w),
                  child: Row(
                    children: [
                      Container(
                        width: 46.0.w,
                        height: 46.0.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0.r),
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 46.0.w,
                        height: 46.0.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0.r),
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset('assets/icons/Vector (1).svg'),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 375.0.w,
                          height: 400.0.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25.0),
                                topLeft: Radius.circular(25.0),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 100.0, left: 14.0, right: 14.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  defultText(
                                      text: 'Description',
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3E3E3E)),
                                  SizedBox(
                                    height: 16.0.h,
                                  ),
                                  defultText(
                                      text: cubit.centerDetailsModel!.data!.description!.longDescription!,
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                  defultTextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DescriptionView()));
                                      },
                                      text: 'Read more ...',
                                      color: kPrimaryColor),
                                  defultText(
                                      text: 'Services',
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w700),
                                  // SizedBox(
                                  //   height: 10.0.h,
                                  //   child: ListView.separated(
                                  //       scrollDirection: Axis.horizontal,
                                  //       shrinkWrap: true,
                                  //       itemBuilder: (context,index)=>defaultButtonEmpty(
                                  //           onTap: () {
                                  //             setState(() {
                                  //               serviceIndex = index;
                                  //               // Navigator.push(context, MaterialPageRoute(builder: (context)=>CenterServiceDivingView()));
                                  //               print(serviceIndex);
                                  //             });
                                  //           },
                                  //           text:cubit.centerDetailsModel!.data!.services![index].name!,
                                  //           colorBackground: serviceIndex == index
                                  //               ? kPrimaryColor.withOpacity(0.6)
                                  //               : Colors.white,
                                  //           textColor: serviceIndex == index
                                  //               ? kPrimaryColor.withOpacity(0.6)
                                  //               : Colors.black,
                                  //           width: 82.0.w,
                                  //           height: 39.0.h),
                                  //       separatorBuilder: (context,index)=>SizedBox(
                                  //         width: 10.0.w,
                                  //       ),
                                  //       itemCount: cubit.centerDetailsModel!.data!.services!.length!
                                  // ),
                                  // ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: defaultButtonEmpty(
                                          onTap: (){
                                            var iid=cubit.centerDetailsModel!.data!.id!;
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CenterServiceDivingView(id: iid,)));
                                          },
                                            width: 111.w,
                                            height: 39.h,
                                            text: 'Snorkeling'),
                                      ),
                                      SizedBox(
                                        width: 20.0.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      serviceDetailsView()));
                                        },
                                        child: GestureDetector(
                                          onTap: (){
                                            var idd=cubit.centerDetailsModel!.data!.id!;
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CenterServiceDivingView(id: idd,)));
                                          },
                                          child: defaultButtonEmpty(
                                              width: 81.w,
                                              height: 39.h,
                                              text: 'Diving'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0.w,
                                      ),
                                      GestureDetector(
                                        child: defaultButtonEmpty(
                                          onTap: (){
                                            var id=cubit.centerDetailsModel!.data!.id!;
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CenterServiceDivingView(id: id,)));
                                          },
                                            width: 91.0.w,
                                            height: 39.0.h,
                                            text: 'Courses'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  defultText(
                                      text: 'Location',
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3E3E3E)),
                                  Row(
                                    children: [
                                      defultText(
                                          text: cubit.centerDetailsModel!.data!.location!.address,
                                          color: Colors.grey,
                                          fontSize: 14.0.sp,
                                          fontWeight: FontWeight.w400),
                                      SizedBox(
                                        width: 30.0.w,
                                      ),
                                      defultTextButton(
                                          onPressed: () {}, text: 'Direction')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  defultText(
                                      text: 'Reviews',
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3E3E3E)),
                                  defultTextButton(onPressed: (){
                                    var iid=cubit.centerDetailsModel!.data!.id!;
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewsView(id:iid,)));
                                  }, text: 'See More')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 320.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 315.0.w,
                            height: 140.0.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.all(30.0.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  defultText(
                                      text: cubit.centerDetailsModel!.data!.name!,
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                  defultText(
                                      text: 'Aqaba, Jordan',
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3E3E3E)),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/Star.svg'),
                                      SizedBox(
                                        width: 4.0.w,
                                      ),
                                      SvgPicture.asset('assets/icons/Star.svg'),
                                      SizedBox(
                                        width: 4.0.w,
                                      ),
                                      SvgPicture.asset('assets/icons/Star.svg'),
                                      SizedBox(
                                        width: 4.0.w,
                                      ),
                                      SvgPicture.asset('assets/icons/Star.svg'),
                                      SizedBox(
                                        width: 4.0.w,
                                      ),
                                      SvgPicture.asset('assets/icons/Star.svg'),
                                      SizedBox(
                                        width: 10.0.w,
                                      ),
                                      defultText(
                                          text: '4.6',
                                          fontSize: 15.0.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFD9942)),
                                      SizedBox(
                                        width: 10.0.w,
                                      ),
                                      defultText(
                                          text: '(1763 Reviews)',
                                          fontSize: 15.0.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffA9A9A9)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
              : Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
