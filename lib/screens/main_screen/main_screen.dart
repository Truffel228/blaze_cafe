import 'package:blaze_cafe/router.dart';
import 'package:blaze_cafe/screens/main_screen/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(
        onQrTap: ()=>_onQrTap(context),
        onItemTap: _onNavBarItemTap,
        currentIndex: child.currentIndex,
      ),
    );
  }

  void _onNavBarItemTap(int index) {
    child.goBranch(index, initialLocation: index == child.currentIndex);
  }

  void _onQrTap(BuildContext context) {
    context.pushNamed(AppRouter.qr);
  }
}
