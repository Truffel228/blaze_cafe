import 'package:blaze_cafe/screens/on_boarding_screen.dart/widgets/widgets.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {
          _currentPage = (_controller.page ?? 0.0).round();
        }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNextButtonTap() => _controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              FirstPage(onTap: _onNextButtonTap),
              SecondPage(onTap: _onNextButtonTap),
              ThirdPage(onTap: _onNextButtonTap),
              FourthPage(onTap: _onNextButtonTap),
              const FifthPage(),
            ],
          ),
          if (_currentPage != 4)
            Align(
              alignment: const Alignment(0, 0.8),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 5,
                effect: WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: context.theme.primaryColor,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1,
                  dotColor: context.theme.primaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
