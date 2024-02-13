import 'package:flutter/material.dart';

import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/question_db.dart';
import 'package:quiz_app/view/question_screen/question_screen.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class QuestionPage extends StatefulWidget {
  final int? selectedCategoryIndex;

  const QuestionPage({Key? key, this.selectedCategoryIndex}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionIndex = 0;
  int? selectedIndex;
  int count = 0;
  late List<Map<String, dynamic>> questions; // Declare questions here

  @override
  void initState() {
    super.initState();
    // Initialize questions based on selectedCategoryIndex
    switch (widget.selectedCategoryIndex) {
      case 0:
        questions = Questiondb.literaturequestion;
        break;
      case 1:
        questions = Questiondb.sportsquestion;
        break;
      case 2:
        questions = Questiondb.sciencequestion;
        break;
      case 3:
        questions = Questiondb.itquestions;
        break;
      default:
        questions = [];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> options = questions[questionIndex]["options"];

    return Scaffold(
      backgroundColor: ColorConstant.myCoustomBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "${questionIndex + 1}/${questions.length}",
              style: TextStyle(
                color: ColorConstant.myCoustomGrey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstant.myCoustomGrey,
              ),
              child: Text(
                questions[questionIndex]["question"].toString(),
                style: TextStyle(
                  color: ColorConstant.myCoustomWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      color: getcolor(index), // Modified here
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 3,
                        color: getcolor(index), // Modified here
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            options[index].toString(),
                            style: TextStyle(
                              color: ColorConstant.myCoustomWhite,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: ColorConstant.myCoustomWhite,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, optionIndex) => SizedBox(height: 0),
            itemCount: options.length,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                ColorConstant.myCoustomBlue,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              if (selectedIndex != questions[questionIndex]["answer"]) {
                // Check if the answer is correct
                count++;
              }
              selectedIndex = null;
              if (questionIndex + 1 < questions.length) {
                setState(() {
                  questionIndex++;
                });
              } else {
                print('Correct Answers: $count');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      count: count,
                      correctAnswers:
                          count, // Assuming all answered questions are correct
                      wrongAnswers: 0, // Assuming no wrong answers
                      skippedCount: questions.length -
                          count, // Total questions minus answered questions
                    ),
                  ),
                );
              }
            },
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Color getcolor(int index) {
    final int correctAnswerIndex = questions[questionIndex]["answer"];
    final bool isWrongAnswer =
        selectedIndex != correctAnswerIndex && selectedIndex == index;

    if (selectedIndex != null && index == correctAnswerIndex) {
      return ColorConstant.myCoustomGreen;
    }
    if (selectedIndex == index) {
      return isWrongAnswer ? Colors.red : Colors.green;
    } else {
      return ColorConstant.myCoustomGrey;
    }
  }
}
