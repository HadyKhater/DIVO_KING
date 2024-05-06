 import 'package:divo_king/controller/cubitDescription/cubit.dart';
import 'package:divo_king/controller/cubitDescription/states.dart';
import 'package:divo_king/controller/cubitServiceDetails/cubit.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/view/Reviews/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DescriptionView extends StatelessWidget {
  var id;
  var name;
  var description;
  DescriptionView({super.key,this.id,this.description, this.name});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: defultText(
          text: 'Description',
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewsView()));
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
                          text: '${name}',
                          // text: 'Royal Diving Club',
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
                            color: Color(0xffFD9942),
                          ),
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:25.0.w),
            child: defultText(
                text: '${description}',
                // text: '${DescriptionCubit.get(context).descriptionModel!.data!.description}',
                //   text:
                // 'The Royal Diving Club (RDC) is a distinguished diving facility that is part of the Luxotel Aqaba Beach Resort & Spa hotel. It was inaugurated by His Majesty the late King Hussein in November 1984. Situated on the southern part of the Jordanian coastline, the RDC enjoys a prime location just 17 kilometers away from Aqaba City.Established with the goal of promoting diving in Jordan while maintaining high safety and technical standards, the RDC offers a unique opportunity to explore the underwater world. The club provides direct shore access to the Coral Bay Reef dive site, which is a part of the His Majesty protected reef system. This exclusive access is available only to guests of the resort, ensuring a privileged experience.',
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff3E3E3E)
            ),
          )
        ],
      ),
    );
  }
}
