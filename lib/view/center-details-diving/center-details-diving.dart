import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:divo_king/controller/cubitCenterServiceDiving/cubit.dart';
import 'package:divo_king/controller/cubitCenterServiceDiving/states.dart';
import 'package:divo_king/controller/cubitServiceDetails/cubit.dart';
import 'package:divo_king/controller/cubitServiceDetails/states.dart';
import 'package:divo_king/model/CenterServiceDiving/center_service_diving.dart';
import 'package:divo_king/model/ServiceDetailsModel/service_details_model.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:divo_king/view/center_details/center_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CenterServiceDivingView extends StatefulWidget {
  var id;
  CenterServiceDivingView({super.key,this.id});
  @override
  State<CenterServiceDivingView> createState() => _CenterServiceDivingState();
}

class _CenterServiceDivingState extends State<CenterServiceDivingView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ServiceDetailsCubit()..getServiceDetails(widget.id),
      child: BlocConsumer<ServiceDetailsCubit, ServiceDetailsStates>(
        listener: (BuildContext context,  state) {},
        builder: (BuildContext context,  state) {
          var cubit = ServiceDetailsCubit.get(context);
          return cubit.serviceDetails != null
              ? Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.white,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: defultText(
                      text: 'Diving',
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 25.0.h,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state is! CenterServiceDivingLoadingStates,
                    builder: (BuildContext context) => ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            builderWidgetCenterDetailsDiving(
                              cubit.serviceDetails!,
                                index,
                                context),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.h,
                        ),
                        itemCount: 10),
                    fallback: (BuildContext context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                )
              ],
            ),
          )
              : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

Widget builderWidgetCenterDetailsDiving(
       ServiceDetails  serviceDetails, index, context) =>
    GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CenterDetailsView()));
      },
      child: Container(
        width: double.infinity,
        height: 125.h,
        child: Row(
          children: [
            // if(centerServiceDivingModel.data![index].images!.isNotEmpty)
            // Image(
            //   image: NetworkImage(centerServiceDivingModel.data![index].images![0]),
            //     width: 50.0.w,
            //     height: 50.0.h,
            //     fit: BoxFit.fitHeight,
            //   ),
            // if(centerServiceDivingModel.data![index].images!.isEmpty)
            Image.asset(
              'assets/images/Rectangle Details10.png',
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defultText(
                    text: serviceDetails.data!.name!,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                SizedBox(
                  height: 13.0.h,
                ),
                defultText(
                  text: serviceDetails.data!.location!.address!,
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
            SizedBox(
              width: 30.0.w,
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
                          text: serviceDetails.data!.price!,
                          fontSize: 10.0,
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
    );
