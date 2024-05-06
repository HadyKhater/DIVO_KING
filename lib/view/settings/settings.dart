import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:divo_king/view/auth/Login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});
  bool isRadioOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Image.asset('assets/icons/menu (1).png'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0.w),
            child: Image.asset('assets/icons/bell.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defultText(
                  text: 'Settings',
                  fontSize: 28.0.sp,
                  fontWeight: FontWeight.w700,
                  color:  Colors.black
                  ),
                  SizedBox(
                    height: 15.0.h,
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
                      Icon(
                        Icons.notifications_none,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 20.0.w,
                      ),
                      defultText(
                          text: 'Notification',
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
                height: 20.0.h,
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
                      SvgPicture.asset('assets/icons/Language.svg'),
                      SizedBox(
                        width: 20.0.w,
                      ),
                      defultText(
                          text: 'Language',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      Spacer(),
                      defultTextButton(onPressed: () {}, text: 'English')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0.h,
              ),
              Container(
                width: double.infinity.w,
                height: 64.0.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    border: Border.all(color: Color(0xffA9A9A9))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.language_outlined,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 20.0.w,
                      ),
                      defultText(
                          text: 'Country',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kPrimaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0.h,
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
                      SvgPicture.asset('assets/icons/currency 1.svg'),
                      SizedBox(
                        width: 20.0.w,
                      ),
                      defultText(
                          text: 'Currency',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kPrimaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0.h,
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
                      SvgPicture.asset('assets/icons/Policy.svg'),
                      SizedBox(
                        width: 20.0,
                      ),
                      defultText(
                          text: 'Policies',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kPrimaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0.h,
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
                      SvgPicture.asset('assets/icons/info.svg'),
                      SizedBox(
                        width: 20.0,
                      ),
                      defultText(
                          text: 'About',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kPrimaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0.h,
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
                      SvgPicture.asset('assets/icons/info.svg'),
                      SizedBox(
                        width: 20.0,
                      ),
                      defultText(
                          text: 'About',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0.h,
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
                      SvgPicture.asset('assets/icons/log-out.svg'),
                      SizedBox(
                        width: 20.0.w,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                        },
                        child: defultText(
                            text: 'Logout',
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                        SizedBox(
                        height: 20.0.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
