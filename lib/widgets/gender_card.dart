import 'package:flutter/material.dart';
import 'package:pmi_calculator/colors.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.isSelected
  });
  final String text;
  final IconData icon;
  final Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected?AppColors.primaryColor: AppColors.cardColor,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.whiteColor, size: 70),
              Text(text, style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ),
      ),
    );
  }
}
