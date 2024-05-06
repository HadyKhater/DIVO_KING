import 'package:divo_king/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: defultText(
          text: 'About',
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w700,
          color: Color(0xff3E3E3E),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:25.0.w),
            child: defultText(
                text:
                'Open Water dives | Min Age: 15 \nThe PADI Rescue Diver course is the first level of training where your focus is not only on your own safety but also on the safety of others and makes you a more aware diver. This course prepares you to deal with dive emergencies, minor and major, using a variety of techniques',
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
