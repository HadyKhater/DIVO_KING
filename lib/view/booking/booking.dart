import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:divo_king/controller/cubitBooking/cubit.dart';
import 'package:divo_king/controller/cubitBooking/states.dart';
import 'package:divo_king/model/BookingModel/booking_model.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          BookingCubit()..getBooking(status: 'pending'),
      child: BlocConsumer<BookingCubit, BookingStates>(
        listener: (BuildContext context, BookingStates state) {},
        builder: (BuildContext context, BookingStates state) {
          return (BookingCubit.get(context).bookingModel!=null)? Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.white,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: defultText(
                      text: 'My Bookings',
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 25.0.h,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state is! BookingLoadingStates,
                    builder: (BuildContext context) => ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => builderWidgetBooking(
                          BookingCubit.get(context).bookingModel!,
                          index,
                          context,
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.0.h,
                        ),
                        itemCount: BookingCubit.get(context)
                            .bookingModel!
                            .data!
                            .length),
                    fallback: (BuildContext context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                )
              ],
            ),
          ):Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

Widget builderWidgetBooking(BookingModel bookingModel, context, index) =>
    GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => CenterDetailsView()));
      },
      child: Container(
        width: double.infinity,
        height: 125.h,
        child: Row(
          children: [
            // if(centerServiceDivingModel.data!.divingCenter[index].images!.isNotEmpty)
            // Image(
            //   image: NetworkImage(centerServiceDivingModel.data!.images![index]),
            // ),
            // if(centerServiceDivingModel.data!.divingCenter[index].images!.isEmpty)
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
                defultText(
                    text: 'Jan 01, 2024',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor),
                SizedBox(
                  height: 20.0.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
