import 'package:flutter/material.dart';
import 'package:pmi_calculator/colors.dart';
import 'package:pmi_calculator/page/bmi_screen.dart';

class ResultScreen extends StatelessWidget{
   const ResultScreen({super.key, required this.result});
  final double result;

    String getClassification() {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result <= 24.9) {
      return 'Healthy Weight';
    } else if (result <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color getColor() {
    if (result < 18.5) {
      return Colors.amberAccent;
    } else if (result <= 24.9) {
      return Colors.green;
    } else if (result <= 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
      String getClassificationMessage() {
    if (result < 18.5) {
      return 'you need to get some weight';
    } else if (result <= 24.9) {
      return 'Your body is absolutely normal\n good job! 💪';
    } else if (result <= 29.9) {
      return 'you need to loss some weight';
    } else {
      return 'it is necessary for you to lose weight';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Your result',style: TextStyle(color: AppColors.whiteColor,fontSize: 25),),
              ],
            ),
            SizedBox(height: 30,),
            Expanded(child: Container(
              decoration: BoxDecoration(color: AppColors.cardColor,borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getClassification(),style: TextStyle(color: getColor()),),
                        SizedBox(height: 40,),
            
                  Text('18.0',style: TextStyle(color: AppColors.whiteColor,fontSize: 70),),
                        SizedBox(height: 40,),
            
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(getClassificationMessage(),style: TextStyle(color: AppColors.whiteColor,),),
                      ],
                    ),
                  )
                ],
              ),
            )),
            SizedBox(height: 15),
            ElevatedButton(
      
      onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BmiScreen()));},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: Size(double.infinity, 80),
      ),
      child: Text('Recalculate', style: TextStyle(color: AppColors.whiteColor)),
    )
          ],
        ),
      ),
    );
  }
}