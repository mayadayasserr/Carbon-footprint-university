import 'package:flutter/material.dart';
import 'package:graduation/models/scan_plant_response_model.dart';
import 'package:graduation/routes.dart';
import 'package:graduation/screens/StaffHello/StaffHello.dart';
import 'package:graduation/screens/Staff_Login/Staff_login.dart';
import 'package:graduation/screens/Staff_Login2/Staff_Login2.dart';
import 'package:graduation/screens/Staff_result_question/Staff_result_question.dart';
import 'package:graduation/screens/about/about_screen.dart';
import 'package:graduation/screens/articles/article_screen.dart';
import 'package:graduation/screens/before_plants/before_plants_screen.dart';
import 'package:graduation/screens/before_regression/before_regression_screen.dart';
import 'package:graduation/screens/complete_profile/complete_profile_screen.dart';
import 'package:graduation/screens/contact_us/contact_screen.dart';
import 'package:graduation/screens/create_new_password/create_new_password_screen.dart';
import 'package:graduation/screens/edit_profile/edit_profile_screen.dart';
import 'package:graduation/screens/forget_password/forget_password_screen.dart';
import 'package:graduation/screens/gps/gps.dart';
import 'package:graduation/screens/home/home_screen.dart';
import 'package:graduation/screens/home_page/home_page_screen.dart';
import 'package:graduation/screens/intro_questions/intro_questions.dart';
import 'package:graduation/screens/leader_board/leader_board_screen.dart';
import 'package:graduation/screens/otp/otp_screen.dart';
//<<<<<<< HEAD
import 'package:graduation/screens/profile/profile_screen.dart';
//=======
import 'package:graduation/screens/plant1_page/plant1_screen.dart';
import 'package:graduation/screens/plant2_page/plant2_screen.dart';
import 'package:graduation/screens/plant3_page/plant3_screen.dart';
//>>>>>>> master
import 'package:graduation/screens/questions/components/question_one.dart';
import 'package:graduation/screens/regression1_page/regression1_screen.dart';
import 'package:graduation/screens/regression2_page/regression2_screen.dart';
import 'package:graduation/screens/result_page/components/result_screen.dart';
import 'package:graduation/screens/sign_in/sign_in_screen.dart';
import 'package:graduation/screens/sign_up/sign_up_screen.dart';
import 'package:graduation/screens/splash/splash_screen.dart';
import 'package:graduation/screens/staff_articles_screen/staff_articles.dart';

import 'package:graduation/screens/staff_calculate_smart_lighting/staff_calculate_smart_lighting.dart';
import 'package:graduation/screens/staff_calculate_solar_panels/staff_calculate_solar_panels.dart';
import 'package:graduation/screens/staff_chooseDU_page/staff_chooseDU_page.dart';
import 'package:graduation/screens/staff_electricity_project/staff_electricity_screen.dart';
import 'package:graduation/screens/staff_processing_file/staff_processing_file_screen.dart';
import 'package:graduation/screens/staff_projects/staff_projects_screen.dart';
import 'package:graduation/screens/staff_questions/components/staff_question_one.dart';
import 'package:graduation/screens/staff_result_target/staff_result_target_screen.dart';
import 'package:graduation/screens/staff_solar_panel_result/staff_solar_panel_result_screen.dart';
import 'package:graduation/screens/staff_stepAfterLogin/staff_stepAfterLogin.dart';

import 'package:graduation/screens/staff_step_to_do/staff_step_to_do.dart';
import 'package:graduation/screens/staff_target/staff_target_screen.dart';
import 'package:graduation/screens/staff_upload/staff_upload_screen.dart';
import 'package:graduation/screens/stuff_download/stuff_download_screen.dart';
import 'package:graduation/screens/stuff_home_page/stuff_home_page_screen.dart';
import 'package:graduation/screens/target_progress/target_progress_screen.dart';
import 'package:graduation/screens/test_open_camera/camera_screen.dart';
import 'package:graduation/services/api_service.dart';
import 'package:graduation/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/remember_me_request_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var rememberToken = prefs.getString("rememberToken") ?? "null";
 // var firstTime =  prefs.getString("currentStaffFirstTime") ?? "notSet";
  var StaffCheck = prefs.getString("LoginInStaff") ?? "notStaff";

  bool isStaff=false ;

 // bool isFirstTime = true  ;
  bool isLogged = false;
  bool isStaffLogged = false ;
print("StaffCheck");
print(StaffCheck);
  if (StaffCheck == 'yesStaff') {
    isStaff = true;
  } else if (StaffCheck == 'notStaff') {
    isStaff = false;
  }



  print("remember token in main");
  print(rememberToken);


  if(rememberToken != "null" && !isStaff ){

     RememberMeRequestModel model2 = RememberMeRequestModel(
       rememberToken: prefs?.getString('rememberToken')!,
     );
     await APIService.rememberMe(model2).then((response) async => {
       if (response.status == "Valid")
         {
         isLogged = true,
           print(response.status),
           prefs.setString('currentSession', response.sessionToken!),
          // Navigator.pushNamed(context, HomePageScreen.routeName)
         }
       else
         {
           print("remember token not valid"),
           isLogged = false
         //  Navigator.pushNamed(context, HomeScreen.routeName)
         }
     });

  }
  // else{
  //    isLogged = false;
  // }

  if(rememberToken != "null" && isStaff ){

    RememberMeRequestModel model2 = RememberMeRequestModel(
      rememberToken: prefs?.getString('rememberToken')!,
    );
    await APIService.rememberMe(model2).then((response) async => {
      if (response.status == "Valid")
        {
        isStaffLogged = true,
          print("isStaffLoggedin remember me "),
          print(isStaffLogged),
          print(response.status),
          prefs.setString('currentSession', response.sessionToken!),

        }
      else
        {
          print("remember token not valid"),
          isStaffLogged = false
        }
    });

  }
  // else{
  //   isStaffLogged = false;
  // }

  print ("these print after remeber me");
print("isLogged");
  print(isLogged);
  print("isStaff");
  print(isStaff);
  print("isStaffLogged");
  print(isStaffLogged);


  String determineInitialRoute() {
    print ("in chioce state");
    print("isStaff");
    print(isStaff);
    print("isStaffLogged");
    print(isStaffLogged);
    if (isStaff && isStaffLogged ) {
      //return StaffStepAfterLogin.routeName;

      return StuffHomePageScreen.routeName;
    }

    else if (!isStaff && isLogged ) {
      return HomePageScreen.routeName;
    }
    else if (!isStaff && !isLogged ) {
      return SplashScreen.routeName;
    }
    else{
      return SplashScreen.routeName;
    }

  }


  final MyApp myApp = MyApp(
  initialRoute:SplashScreen.routeName,


    // determineInitialRoute(),

  );
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    imageCache.clear();
    imageCache.clearLiveImages();
    return

      MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carbonite',
        theme: theme(),
home: Scaffold(
appBar: AppBar(
title: Text('Carbonite'),
    ),
    body: Center(
    child: Image.asset('assets/images/photo_2022-12-27_23-11-17.jpg'),
    ),),
// <<<<<<< HEAD
//         initialRoute: ProfileScreen.routeName,
// =======
        initialRoute: initialRoute,
//>>>>>>> master
        routes: routes,


    );
  }
}



