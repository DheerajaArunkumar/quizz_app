// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, dead_code, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/questions_db.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

void main() {
  runApp(QuestionScreen());
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int count = 0;
  int? selectedanswerIndex;
  // int index = 0;
  int optionindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.myCoustomBlack,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "${optionindex + 1}/${Questionsdb.questions.length}",
                style: TextStyle(color: ColorConstant.myCoustomBlue),
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: ColorConstant.myCoustomWhite),
                height: 8,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                // height: 200,
                //width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 45, 42, 42)),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    Questionsdb.questions[optionindex]["question"],
                    style: TextStyle(
                        color: ColorConstant.myCoustomWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //color: const Color.fromARGB(255, 47, 47, 47),
              ),
              SizedBox(
                height: 50,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedanswerIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Questionsdb.questions[optionindex]["options"]
                                    [index],
                                style: TextStyle(
                                    color: ColorConstant.myCoustomWhite),
                              ),
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        ColorConstant.myCoustomGrey,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: CircleAvatar(
                                      radius: 13,
                                      backgroundColor: rightColor(index),
                                      child: rightAnswer(index),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        height: 55,
                        // width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2,
                            color: getCorrectAnswer(index),
                          ),
                        ),

                        //color: Colors.red,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 30,
                      ),
                  itemCount:
                      Questionsdb.questions[optionindex]["options"].length),
              SizedBox(
                height: 50,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  if (optionindex < Questionsdb.questions.length - 1) {
                    setState(() {
                      // if (selectedanswerIndex != null &&
                      //     selectedanswerIndex ==
                      //         QuestionDb.question[optionindex]["answer"]) {
                      //   count++;
                      // } else
                      //   print("Correct Answer:$count");
                      //index++;
                      optionindex++;
                      selectedanswerIndex = null;
                    });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mark(),
                        ));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConstant.myCoustomBlue),
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(color: ColorConstant.myCoustomWhite),
                        ),
                      )),
                ),
              )
            ]),
          ),
        ));
  }

  Color getCorrectAnswer(int index) {
    if (selectedanswerIndex != null &&
        index == Questionsdb.questions[optionindex]["answer"]) {
      return ColorConstant.myCoustomGreen;
    }

    if (selectedanswerIndex == index) {
      if (selectedanswerIndex == Questionsdb.questions[optionindex]["answer"]) {
        return ColorConstant.myCoustomGreen;
      } else {
        return ColorConstant.myCoustomRed;
      }
    } else {
      return ColorConstant.myCoustomGrey;
    }
  }

  Widget rightAnswer(int index) {
    if (selectedanswerIndex == index) {
      if (selectedanswerIndex == Questionsdb.questions[optionindex]["answer"]) {
        return Icon(
          Icons.done,
          color: ColorConstant.myCoustomWhite,
          size: 18,
        );
      } else {
        return Icon(
          Icons.close,
          color: ColorConstant.myCoustomWhite,
          size: 18,
        );
      }
    } else {
      return SizedBox();
    }
  }

  Color rightColor(int index) {
    if (selectedanswerIndex == index) {
      if (selectedanswerIndex == Questionsdb.questions[optionindex]["answer"]) {
        return ColorConstant.myCoustomBlue;
      } else {
        return ColorConstant.myCoustomRed;
      }
    } else {
      return ColorConstant.myCoustomGrey;
    }
  }
}
