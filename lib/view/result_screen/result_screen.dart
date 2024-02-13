/import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.myCoustomBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congrats!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.myCoustomWhite),
            ),
            Text(
              "90% Score",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.myCoustomGreen),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 250,
                height: 60,
                child: Center(
                    child: Text(
                  "Restart",
                  style: TextStyle(color: ColorConstant.myCoustomWhite),
                )),
                decoration: BoxDecoration(
                    color: ColorConstant.myCoustomOrange,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: ColorConstant.myCoustomWhite, width: 2)),
              ),
            )
          ],
        ),
      ),
    );
  }
}