import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:blaze_cafe/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.title,
    required this.selected,
  });

  final VoidCallback onTap;
  final String imagePath;
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            imagePath,
            colorFilter: ColorFilter.mode(
              selected ? context.theme.primaryColor : AppTheme.black,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: selected ? context.theme.primaryColor : AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
