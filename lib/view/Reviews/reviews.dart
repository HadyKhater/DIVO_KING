import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:divo_king/controller/cubitReviews/cubit.dart';
import 'package:divo_king/controller/cubitReviews/states.dart';
import 'package:divo_king/model/ReviewModel/review_model.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewsView extends StatelessWidget {
  var id;
  ReviewsView({super.key,this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ReviewsCubit()..getReviews(id),
      child: BlocConsumer<ReviewsCubit,ReviewsStates>(
        listener: (BuildContext context, ReviewsStates state) {  },
        builder: (BuildContext context, ReviewsStates state) {
          var cubit = ReviewsCubit.get(context);
          return ReviewsCubit.get(context).reviewModel!=null
          ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: defultText(
                  text: 'Reviews',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 35.0.h,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state is! ReviewsLoadingStates,
                    builder: (BuildContext context) {
                      return ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context,index)=>builderWidgetReviews(
                              cubit.reviewModel!,context,index
                          ),
                          separatorBuilder: (context,index)=>SizedBox(
                            height: 20.0.h,
                          ), itemCount: ReviewsCubit.get(context).reviewModel!.data!.length);
                    },
                    fallback: (BuildContext context) {
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                )
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
builderWidgetReviews(ReviewModel reviewModel, context, index)=>Row(
  children: [
    CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage('assets/images/profile-img.png'),
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        defultText(
            text: 'Hady Khater',
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black),
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
                text: '(1.7K)',
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xffA9A9A9)),
          ],
        ),
        SizedBox(
          height: 15.0.h,
        ),
        defultText(text: 'The bed was nice and comfortable,\nthe service was on point. Good job!', fontSize: 14.0.sp, fontWeight: FontWeight.w400,
            color: Color(0xff3E3E3E)
        )
      ],

    ),
  ],
);
