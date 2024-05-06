import 'dart:ui';
import 'package:divo_king/controller/cubitServiceDetails/cubit.dart';
import 'package:divo_king/controller/cubitServiceDetails/states.dart';
import 'package:divo_king/model/ServiceDetailsModel/service_details_model.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:divo_king/view/Description/description.dart';
import 'package:divo_king/view/Reviews/reviews.dart';
import 'package:divo_king/view/about/about.dart';
import 'package:divo_king/view/center-details-diving/center-details-diving.dart';
import 'package:divo_king/view/center_details/center_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceDetailsView extends StatefulWidget {
  var id;
  ServiceDetailsView({this.id});
  @override
  State<ServiceDetailsView> createState() => _ServiceDetailsView();
}

class _ServiceDetailsView extends State<ServiceDetailsView> {
  DateTime today = DateTime.now();

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ServiceDetailsCubit()..getServiceDetails(widget.id),
      child: BlocConsumer<ServiceDetailsCubit,ServiceDetailsStates>(
        listener: ( context,  state) {  },
        builder: ( context,  state) {
          return (ServiceDetailsCubit.get(context).serviceDetails!= null)
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
                            )),
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
                                  Row(
                                    children: [
                                      Container(
                                        width: 48.0.w,
                                        height: 48.0.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10.0.r),
                                            color: Colors.grey.withOpacity(0.5)),
                                        child: SvgPicture.asset(
                                          'assets/icons/Shop.svg',
                                          width: 10.0.w,
                                          height: 10.0.h,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0.w,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          var ids= ServiceDetailsCubit.get(context).serviceDetails!.data!.id;
                                          // var description = ServiceDetailsCubit.get(context).serviceDetails!.data!.description!.shortDescription;
                                          // var location = ServiceDetailsCubit.get(context).serviceDetails!.data!.location!;
                                          // var name = ServiceDetailsCubit.get(context).serviceDetails!.data!.name;
                                          // print(ids);
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CenterDetailsView(id: ids,)));
                                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>CenterServiceDivingView(id: ids)));
                                        },
                                        child: defultText(
                                            text: '${ServiceDetailsCubit.get(context).serviceDetails!.data!.divingCenter!.name}',
                                            fontSize: 16.0.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff3E3E3E)),
                                      ),
                                      Spacer(),
                                      defultTextButton(
                                          onPressed: () {
                                          },
                                          text: 'Direction',
                                          color: kPrimaryColor),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 48.0.w,
                                        height: 48.0.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10.0.r),
                                            color: Colors.grey.withOpacity(0.5)),
                                        child: SvgPicture.asset(
                                          'assets/icons/volume 1.svg',
                                          width: 10.0.w,
                                          height: 10.0.h,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0.w,
                                      ),
                                      defultText(
                                          text: 'Beginner',
                                          fontSize: 16.0.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff3E3E3E)),
                                      Spacer(),
                                      defultTextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AboutView()));
                                          },
                                          text: 'About',
                                          color: kPrimaryColor),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0.h,
                                  ),
                                  defultText(
                                      text: 'Description',
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3E3E3E)),
                                  SizedBox(
                                    height: 16.0.h,
                                  ),
                                  defultText(
                                      text:
                                      '${ServiceDetailsCubit.get(context).serviceDetails!.data!.description!.longDescription}',
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                  defultTextButton(
                                      onPressed: () {
                                        var idss= ServiceDetailsCubit.get(context).serviceDetails!.data!.id;
                                        var descr=ServiceDetailsCubit.get(context).serviceDetails!.data!.description!.longDescription;
                                        var name = ServiceDetailsCubit.get(context).serviceDetails!.data!.name;
                                        print(idss);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DescriptionView(id:idss,description:descr,name: name,)));
                                      },
                                      text: 'Read more ...',
                                      color: kPrimaryColor),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          defultText(
                                              text: 'Single Dive Price',
                                              fontSize: 14.0.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.withOpacity(0.5)),
                                          defultText(
                                              text: '${ServiceDetailsCubit.get(context).serviceDetails!.data!.price} JD',
                                              fontSize: 24.0.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff3E3E3E)),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.0.w,
                                      ),
                                      defaultButton(
                                          onPressed: () {
                                            showModalBottomSheets(context);
                                          },
                                          text: 'Book Now',
                                          width: 180.0.w)
                                    ],
                                  )
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
                                      text: '${ServiceDetailsCubit.get(context).serviceDetails!.data!.name}',
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                  defultText(
                                      text: '${ServiceDetailsCubit.get(context).serviceDetails!.data!.location!.address}',
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3E3E3E)),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewsView()));
                                    },
                                    child: Row(
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
          ) : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  showModalBottomSheets(context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return  Padding(
                padding: EdgeInsets.only(
                  top: 50.0.h,
                  right: 25.0.w,
                  left: 25.0.w,
                ),
                child: Container(
                  width: 375.0.w,
                  height: 592.0.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0.r),
                        topRight: Radius.circular(25.0.r)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TableCalendar(
                            locale: 'en_US',
                            rowHeight: 42.h,
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                            ),
                            availableGestures: AvailableGestures.all,
                            selectedDayPredicate: (day) => isSameDay(day, today),
                            focusedDay: today,
                            firstDay: DateTime.utc(2024, 3, 8),
                            lastDay: DateTime.utc(2028, 3, 8),
                          ),
                        ),
                        defultText(text: 'Time', fontSize: 20.0.sp, fontWeight: FontWeight.w700,color: kSecondColor),
                        SizedBox(
                          height: 200.0.h,
                        ),
                        defaultButton(onPressed: (){
                          showModalPaymentMethods(context);
                        },
                            text: 'Continue')
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
  showModalPaymentMethods(context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) {
          return  Container(
            width: 375.0.w,
            height: 592.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0.r),
                  topRight: Radius.circular(25.0.r)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.0.h,
                right: 25.0.w,
                left: 25.0.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defultText(text: 'Payment Methods', fontSize: 20.0.sp, fontWeight: FontWeight.w700,color: kPrimaryColor),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Container(
                      width: double.infinity.w,
                      height: 64.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Color(0xffA9A9A9))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset('assets/images/cash-on-delivery 1.png'),
                            SizedBox(
                              width: 20.0.w,
                            ),
                            defultText(
                                text: 'Cash',
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            Spacer(),
                            Icon(Icons.radio_button_checked_outlined)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0.h,
                    ),
                    Container(
                      width: double.infinity.w,
                      height: 64.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Color(0xffA9A9A9))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset('assets/images/Vector.png'),
                            SizedBox(
                              width: 20.0.w,
                            ),
                            defultText(
                                text: 'Stripe (Visa - Master)',
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            Spacer(),
                            Icon(Icons.radio_button_checked_outlined)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0.h,
                    ),
                    Container(
                      width: double.infinity.w,
                      height: 64.0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Color(0xffA9A9A9))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset('assets/images/paypal.png'),
                            SizedBox(
                              width: 20.0.w,
                            ),
                            defultText(
                                text: 'PayPal',
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            Spacer(),
                            Icon(Icons.radio_button_checked_outlined)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 180.0.h,
                    ),
                    defaultButton(onPressed: (){

                    },
                        text: 'Continue')
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
