import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/question_db.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';

class ResultScreen extends StatefulWidget {
  final int count;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedCount;

  ResultScreen({
    required this.count,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedCount,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    int totalQuestions = Questiondb.literaturequestion.length;
    double percentage = (widget.count / totalQuestions) * 100;

    return Scaffold(
      backgroundColor: ColorConstant.myCoustomBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congrats!",
              style: TextStyle(
                color: ColorConstant.myCoustomWhite,
                fontSize: 30,
              ),
            ),
            Text(
              '  ${percentage.toStringAsFixed(0)}% score',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorConstant.myCoustomGreen,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Correct Answers: ${widget.correctAnswers}',
              style: TextStyle(
                color: ColorConstant.myCoustomWhite,
                fontSize: 20,
              ),
            ),
            Text(
              'Wrong Answers: ${widget.wrongAnswers}',
              style: TextStyle(
                color: ColorConstant.myCoustomWhite,
                fontSize: 20,
              ),
            ),
            Text(
              'Skipped: ${widget.skippedCount}',
              style: TextStyle(
                color: ColorConstant.myCoustomWhite,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 120,
                child: Center(
                  child: Text(
                    'Restart',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorConstant.myCoustomWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.myCoustomBlue,
                  border: Border.all(
                    color: ColorConstant.myCoustomWhite,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
