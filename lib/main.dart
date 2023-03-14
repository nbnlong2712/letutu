import 'package:flutter/material.dart';
import 'package:letutu/routes/eroute.dart';
import 'package:letutu/screen/advanced_setting_screen.dart';
import 'package:letutu/screen/change_password_screen.dart';
import 'package:letutu/screen/course_screen.dart';
import 'package:letutu/screen/forget_password_screen.dart';
import 'package:letutu/screen/history_screen.dart';
import 'package:letutu/screen/home_screen.dart';
import 'package:letutu/login/login_screen.dart';
import 'package:letutu/screen/main_screen.dart';
import 'package:letutu/screen/register_screen.dart';
import 'package:letutu/screen/setting_screen.dart';
import 'package:letutu/screen/tutor_screen.dart';
import 'package:letutu/screen/upcoming_screen.dart';

import 'screen/become_teacher_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      initialRoute: Eroute.login,
      routes: {
        //home page
        Eroute.main: (context) => MainScreen(),
        //auth
        Eroute.login: (context) => LoginScreen(),
        Eroute.register: (context) => RegisterScreen(),
        Eroute.forgetPassword: (context) => ForgetPasswordScreen(),
        Eroute.changePassword: (context) => ChangePasswordScreen(),
        //main
        Eroute.home: (context) => HomeScreen(),
        Eroute.course: (context) => CourseScreen(),
        Eroute.setting: (context) => SettingScreen(),
        Eroute.tutors: (context) => TutorScreen(),
        Eroute.upcoming: (context) => UpcomingScreen(),
        //setting
        Eroute.history: (context) => HistoryScreen(),
        Eroute.advancedSetting: (context) => AdvancedSettingScreen(),
        Eroute.becomeTeacher: (context) => BecomeTeacherScreen(),
      },
    );
  }
}
