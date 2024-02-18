import 'package:flutter/material.dart';
import 'package:islami_sun_c10/ui/utils/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double rotationAngle = 0;
  int zekrIndex = 0;
  List<String> zekrList = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله'
  ];

  void incrementCounter() {
    setState(() {
      counter++;
      rotationAngle += 0.1;

      if (counter >= 34) {
        counter = 0;
        zekrIndex = (zekrIndex + 1) % zekrList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String zekr = zekrList[zekrIndex];

    return Column(
      children: [
        // Image.asset(
        //   'assets/images/head of seb7a.png',
        //   width: 100,
        //   height: 100,
        // ),
        Transform.rotate(
          angle: rotationAngle,
          // child: GestureDetector(
          //   onTap: incrementCounter,
            child: Image.asset(
              'assets/images/sebha.png',
              // width: 250,
              // height: 250,
           ),
       // ),
        ),
        SizedBox(height: 20),
        Text(
          'عدد التسبيحات',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColors.lightBlack,
          ),
        ),
        SizedBox(height: 40,),
        SizedBox(
          width: 70,
          height: 70,
          child: ElevatedButton(
            onPressed: incrementCounter,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFB7935F)),
            ),
            child: Text('$counter'),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius:
                BorderRadius.circular(20), 
          ),
          child: Center(
            child: Text(
              zekr,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // const Expanded(
        //   child: Row(
        //       // alignment: Alignment.center,
        //       ),
        // ),
      ],
    );
  }
}
