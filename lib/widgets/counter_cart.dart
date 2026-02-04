import 'package:flutter/material.dart';
import 'package:pmi_calculator/colors.dart';

class CounterCart extends StatelessWidget {
  const CounterCart({super.key, required this.text, required this.value,required this.onAdd,required this.onRemove});
  final String text;
  final int value;
  final Function()onAdd;
  final Function()onRemove;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$text', style: TextStyle(color: AppColors.whiteColor)),
            Text(
              '$value',
              style: TextStyle(color: AppColors.whiteColor, fontSize: 45),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.grayColor,
                  ),
                  onPressed: onRemove,
                  icon: Icon(Icons.remove, color: AppColors.whiteColor),
                ),
                SizedBox(width: 7),
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.grayColor,
                  ),
                  onPressed: onAdd,
                  icon: Icon(Icons.add, color: AppColors.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
