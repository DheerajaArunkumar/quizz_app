import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/question_db.dart';
import 'package:quiz_app/view/question_screen/question_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.myCoustomBlack,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hi, John',
                        style: TextStyle(
                            color: ColorConstant.myCoustomWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Let\'s make this day more productive',
                        style: TextStyle(
                            color: ColorConstant.myCoustomWhite, fontSize: 14),
                      )
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile_quizz.jpg'),
                          fit: BoxFit.cover),
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                height: 50,
                width: 300,
                child: Center(
                  child: Text(
                    'Choose a category',
                    style: TextStyle(
                        color: ColorConstant.myCoustomWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 55, 55, 55),
                    borderRadius: BorderRadiusDirectional.circular(15)),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    '   Let\'s play',
                    style: TextStyle(
                        color: ColorConstant.myCoustomWhite, fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      mainAxisExtent: 220),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionScreen(
                                selectedCategoryIndex: selectedCategoryIndex),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 55, 55, 55),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          Questiondb.homepageList[index]
                                              ["itemimage"],
                                        ),
                                        fit: BoxFit.cover),
                                    color: Colors.white,
                                  ),
                                  height: 150,
                                  width: 150,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  Questiondb.homepageList[index]["title"],
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: ColorConstant.myCoustomWhite),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
