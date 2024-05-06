import 'package:divo_king/share/Dio/dio.dart';
import 'package:divo_king/share/cache/cache.dart';
import 'package:divo_king/view/Zoom%20Drawer%20Home/zoom_drawer_home.dart';
import 'package:divo_king/view/auth/Login/login_view.dart';
import 'package:divo_king/view/center-details-diving/center-details-diving.dart';
import 'package:divo_king/view/center_details/center_details.dart';
import 'package:divo_king/view/service_details/service_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await DioHelper.init();
    await CashHelper.init();

  runApp( MyApp(tok: CashHelper.getData(key: 'token'),));
}

class MyApp extends StatelessWidget {
   MyApp({super.key,this.tok});

var tok;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // home:ProfileView(),
          // home:BookNowView(),
           home:tok!=null ? ZoomeDrawerHome():LoginView(),
          //home:CenterDetailsView()
          //home:DetailsView(),
          // home: ServiceDetailsView(),
          // home: BookNowView(),
          // home: DetailsView(),
          // home: SettingView(),
          // home: CenterServiceDivingView(),
          );
      },
    );
  }
}

