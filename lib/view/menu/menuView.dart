import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/view/booking/booking.dart';
import 'package:divo_king/view/bookmark/bookmark.dart';
import 'package:divo_king/view/profile/profileView.dart';
import 'package:divo_king/view/service_details/service_details.dart';
import 'package:divo_king/view/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 50.0,left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
                },
               child: CircleAvatar(
                 radius: 30.0,
               ),
             ),
              SizedBox(
                height: 15.0.h,
              ),
              defultText(text: 'Hady Khater', fontSize: 24.0, fontWeight: FontWeight.w700),
              defultText(text: 'Jordan', fontSize: 16.0, fontWeight: FontWeight.w500),
              SizedBox(
                height: 72.0.h,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/home.svg'),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  GestureDetector(
                      onTap: (){
        
                      },
                      child: defultText(text: 'Home', fontSize: 16.0.sp, fontWeight: FontWeight.w700))
                ],
              ),
              SizedBox(
                height: 45.0.h,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/bookmark.svg'),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookMark()));
                      },
                      child: defultText(text: 'Bookmarks', fontSize: 16.0.sp, fontWeight: FontWeight.w700))
                ],
              ),
              SizedBox(
                height: 45.0.h,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/ticket.svg'),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking()));
                      },
                      child: defultText(text: 'My Bookings', fontSize: 16.0.sp, fontWeight: FontWeight.w700))
                ],
              ),
              SizedBox(
                height: 45.0.h,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/settings.svg'),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  defultTextButton(text: 'Settings', onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingView()));
                  },color: Colors.white,fontSize:16.0.sp,fontWeight: FontWeight.w700 )
                ],
              ),
              SizedBox(
                height: 90.0.h,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/help-circle.svg'),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  defultText(text: 'Help', fontSize: 16.0.sp, fontWeight: FontWeight.w700)
                ],
              ),
              SizedBox(
                height: 45.0.h,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/log-out (1).svg'),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  defultText(text: 'Logout', fontSize: 16.0.sp, fontWeight: FontWeight.w700)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
