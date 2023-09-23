import 'package:blaze_cafe/models/dish.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:blaze_cafe/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DishItem extends StatelessWidget {
  const DishItem({
    super.key,
    required this.dish,
  });

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            color: AppTheme.lightGrey,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Image.asset(
              dish.imagePath,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.title,
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  'Tap to read discription',
                  style: context.textTheme.titleSmall,
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/star.svg'),
                    const SizedBox(width: 2),
                    Text(
                      dish.rating.toString(),
                      style: context.textTheme.labelSmall,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '(${dish.reviews})',
                      style: context.textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
