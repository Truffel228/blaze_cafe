import 'package:blaze_cafe/global_widgets/app_button.dart';
import 'package:blaze_cafe/global_widgets/back_arrow_button.dart';
import 'package:blaze_cafe/global_widgets/dish_item.dart';
import 'package:blaze_cafe/models/dish.dart';
import 'package:blaze_cafe/utils/constants.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YourRewardsScreen extends StatelessWidget {
  const YourRewardsScreen({
    super.key,
    required this.dish,
  });

  final Dish? dish;

  static final Dish _dish = Constants.dishes.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const BackArrowButton(),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 80,
                ),
                const SizedBox(height: 40),
                Text(
                  'Your Dishes',
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DishItem(
                    dish: dish ?? _dish,
                  ),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Total :   ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${dish?.points ?? _dish.points} points',
                          style: context.textTheme.titleSmall?.copyWith(
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                AppButton(
                  text: 'Reedem now',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
