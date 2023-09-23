import 'package:blaze_cafe/global_widgets/app_button.dart';
import 'package:blaze_cafe/global_widgets/dish_item.dart';
import 'package:blaze_cafe/global_widgets/inner_shadow.dart';
import 'package:blaze_cafe/router.dart';
import 'package:blaze_cafe/utils/constants.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:blaze_cafe/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HotDealScreen extends StatelessWidget {
  const HotDealScreen({super.key});

  static const List<Map<String, String>> _dishTypes = [
    {
      'iconPath': 'assets/dish_types/salad.svg',
      'text': 'Salad',
    },
    {
      'iconPath': 'assets/dish_types/pasta.svg',
      'text': 'Pasta',
    },
    {
      'iconPath': 'assets/dish_types/pizza.svg',
      'text': 'Pizza',
    },
    {
      'iconPath': 'assets/dish_types/desert.svg',
      'text': 'Desert',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 50),
          SvgPicture.asset(
            'assets/logo.svg',
            height: 80,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => DishTypeItem(
                iconPath: _dishTypes[index]['iconPath'] ?? '',
                title: _dishTypes[index]['text'] ?? '',
              ),
            ),
          ),
          const SizedBox(height: 50),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Constants.pastas.length,
            itemBuilder: (context, index) {
              return DishItem(
                dish: Constants.pastas[index],
              );
            },
          ),
          const SizedBox(height: 50),
          AppButton(
            text: 'ORDER',
            onTap: () => context.pushNamed(AppRouter.hotDealOrder),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class DishTypeItem extends StatelessWidget {
  const DishTypeItem({
    super.key,
    required this.iconPath,
    required this.title,
    this.selected = false,
  });

  final String iconPath;
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: selected ? context.theme.primaryColor : const Color(0xFFF7F7FB),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: AppTheme.lightGrey,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFECECEC),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(iconPath),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: selected ? Colors.white : const Color(0xFF0A0A0A),
            ),
          ),
        ],
      ),
    );
  }
}
