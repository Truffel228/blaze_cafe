import 'package:blaze_cafe/router.dart';
import 'package:blaze_cafe/utils/constants.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:blaze_cafe/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage>
    with SingleTickerProviderStateMixin {
  static const _animationDuration = Duration(seconds: 2);

  late final AnimationController _controller;
  late final Animation<int> _animation;

  late final SharedPreferences _sharedPrefs;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _animation = IntTween(begin: 0, end: 1000).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    init();
  }

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => _controller.forward());
    await _sharedPrefs.setBool(Constants.onBoardingShowed, true);
    Future.delayed(
      _animationDuration + const Duration(milliseconds: 300),
    ).then((value) => context.go(AppRouter.home));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        SvgPicture.asset('assets/logo.svg'),
        const Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomLoader(
                  percent: _animation.value,
                );
              }),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
    required this.percent,
  });

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Row(
        children: [
          Expanded(
            flex: percent,
            child: Container(
              color: context.theme.primaryColor,
            ),
          ),
          Expanded(
            flex: 1000 - percent,
            child: Container(
              color: AppTheme.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
