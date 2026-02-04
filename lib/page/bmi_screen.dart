import 'package:flutter/material.dart';
import 'package:pmi_calculator/colors.dart';
import 'package:pmi_calculator/page/result_screen.dart';
import 'package:pmi_calculator/widgets/counter_cart.dart';
import 'package:pmi_calculator/widgets/gender_card.dart';

class BmiScreen extends StatefulWidget {
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int weight = 50;
  int age = 24;
  double sliderValue = 160;
  bool isMale=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.local_pizza, color: AppColors.primaryColor),
            Text('Bmindex', style: TextStyle(color: AppColors.whiteColor)),
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //1male and female
            _genderSelection(),
            SizedBox(height: 15),
            //2height
            _getHeight(),
            SizedBox(height: 15),

            //3 weight and age
            _weightAndAge(),
            SizedBox(height: 15),

            //4 Calculate button
            _calculateButton(),
          ],
        ),
      ),
    );
  }


     //1male and female
  
  Expanded _genderSelection() {
    return Expanded(
      child: Row(
        children: [
          //male
          GenderCard(text: 'male',isSelected: isMale, icon: Icons.male_rounded,onPressed: (){setState(() {
            isMale=true;
          });},),
          SizedBox(width: 15),
          //female
          GenderCard(text: 'female', isSelected: !isMale,icon: Icons.female_rounded,onPressed: (){setState(() {
            isMale=false;
          });},),
        ],
      ),
    );
  }

  //2
  Expanded _getHeight() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Height', style: TextStyle(color: AppColors.whiteColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  sliderValue.toStringAsFixed(1),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  'cm',
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 15),
                ),
              ],
            ),
            Slider(
              value: sliderValue,
              min: 20,
              max: 250,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
              activeColor: AppColors.primaryColor,
              inactiveColor: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
  
  //3
  Expanded _weightAndAge() {
    return Expanded(
      child: Row(
        children: [
          CounterCart(
            text: 'weight',
            value: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              setState(() {
                weight--;
              });
            },
          ),
          SizedBox(width: 15),
          CounterCart(
            text: 'age',
            value: age,
            onAdd: () {
              if (weight < 100) {
                setState(() {
                  age++;
                });
              }
            },
            onRemove: () {
              setState(() {
                age--;
              });
            },
          ),
        ],
      ),
    );
  }



  //4
  ElevatedButton _calculateButton() {
    return ElevatedButton(
      
      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResultScreen(result: (weight / ((sliderValue / 100)* (sliderValue / 100))),)));},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text('Calculator', style: TextStyle(color: AppColors.whiteColor)),
    );
  }

}

