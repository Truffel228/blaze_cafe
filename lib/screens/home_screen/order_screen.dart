import 'package:blaze_cafe/global_widgets/app_button.dart';
import 'package:blaze_cafe/global_widgets/back_arrow_button.dart';
import 'package:blaze_cafe/global_widgets/dish_item.dart';
import 'package:blaze_cafe/utils/constants.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 50),
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 80,
                ),
                const SizedBox(height: 50),
                Text(
                  'Your Dishes',
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 50),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => DishItem(
                    dish: Constants.dishes[index],
                  ),
                ),
                const SizedBox(height: 50),
                AppButton(
                  text: 'ORDER',
                  onTap: () {},
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          const BackArrowButton(),
        ],
      ),
    );
  }
}
