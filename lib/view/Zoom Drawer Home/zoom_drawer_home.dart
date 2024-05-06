import 'package:divo_king/view/home/home_view.dart';
import 'package:divo_king/view/menu/menuView.dart';
import 'package:divo_king/view/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomeDrawerHome extends StatelessWidget {
  const ZoomeDrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        drawerShadowsBackgroundColor:Colors.grey,
        showShadow: true,
        shadowLayer1Color:Colors.white.withOpacity(0.6),
        shadowLayer2Color: Colors.white.withOpacity(0.8),
        menuBackgroundColor:Colors.blue,
      angle: 0,
        mainScreenScale: 0.1,
        borderRadius: 20.0,
        menuScreen: MenuView(),
        mainScreen: HomeView()

    );
  }
}
