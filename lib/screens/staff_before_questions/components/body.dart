import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/staff_projects/staff_projects_screen.dart';
import '../../../components/CustomDropdownButton2.dart';
import '../../../components/top_bar.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../staff_questions/components/staff_question_one.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  bool value = false;
  Map<String,String> dates={};
  List<String> itemsFrom =['2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023'];
  String? SelectedItem ;

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight*0.05,),
            TopBar(text: "    Questions", press: (){


              Navigator.pushNamed(context, StaffProjectsScreen.routeName);
            },),

            SizedBox(height: SizeConfig.screenHeight*0.1,),

            Align(
              child: RichText(
                text: TextSpan(
                  // style: LightModeSmallTextStyle,
                  children: <TextSpan>[
                    TextSpan(text: 'Choose ', style: TextStyle(
                        fontSize: 21, color: LightModeMainColor, fontWeight: FontWeight.w600,fontFamily: "Poppins2"
                    )),
                    TextSpan(text: 'the year before answering \nthe questions:', style: TextStyle(
                        fontSize: 21, color: LightModeSmallTextColor, fontWeight: FontWeight.w600,fontFamily: "Poppins2"
                    )),
                  ],
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(height: SizeConfig.screenHeight*0.08,),


            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  color: LightGray,
                  borderRadius: BorderRadius.all(Radius.circular(4))),

              child: Row(
                children: [
                  SizedBox(width:SizeConfig.screenWidth*0.02,),
                  Transform.scale(
                    scale: 1,
                    child: Checkbox(
                      value: value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                          if(value == true){
                            dates["chosen year"]="2023";
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StaffQuestionOne(
                                        answersData: dates

                                    ))


                            );
                          }
                        });
                      },
                      activeColor: LightModeMainColor,
                      checkColor: Colors.white,
                      autofocus: true,
                    ),
                  ),

                  Text("Current Year",style: TextStyle(
                      fontFamily: "Poppins", fontSize: 20, color: LightModeMainColor
                  ),)




                ],
              ), //edittttttttt
            ),

            SizedBox(height: SizeConfig.screenHeight*0.1,),

            Row(
              children: [
                SizedBox(width: SizeConfig.screenWidth*0.06,),
                Text("OR", style: TextStyle(fontSize: 23,fontFamily: "Poppins",fontWeight: FontWeight.bold,
                    color: LightModeMainColor),),
                Text(" Select another year:",style: TextStyle(fontSize: 22,fontFamily: "Poppins3",
                    color: LightModeSmallTextColor)),
              ],
            ),

            SizedBox(height: SizeConfig.screenHeight*0.04,),
            Container(


              child: CustomDropdownButton2(

                buttonHeight:60 ,
                buttonWidth: 350,
                dropdownWidth: 350,
                buttonDecoration:BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 2),
                  borderRadius: BorderRadius.circular(12),
                ) ,
                hint: '..........',
                icon: Icon(Icons.arrow_drop_down,color: LightModeMainColor,size: 24,),
                dropdownItems: itemsFrom,
                value: SelectedItem,
                onChanged: (value) {
                  setState(() {
                    SelectedItem = value;
                    print(SelectedItem);
                    dates["chosen year"]="2023";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StaffQuestionOne(
                                answersData: dates

                            ))


                    );

                  });
                },
              ),



            ),
          ],
        ),
      ),
    );
  }
}


