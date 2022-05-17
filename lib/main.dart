import 'package:angime/pages/HomePage.dart';
import 'package:angime/pages/QuizPage.dart';
import 'package:angime/pages/auth/LoginPage.dart';
import 'package:angime/pages/auth/ProfilePage.dart';
import 'package:angime/pages/auth/RegisterPage.dart';
import 'package:angime/pages/stats.dart';
import 'package:angime/pages/study_widgets/lectiona1.dart';
import 'package:angime/pages/tutorpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {

   WidgetsFlutterBinding.ensureInitialized();
  // запуск firebase в приложений
    await GetStorage.init();
    final box = GetStorage();
    if(box.read('a1') ==null){
    box.write('a1',0);
    }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //проерка авторизован ли пользователь
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      //пути для перехода
      routes: {
        "/test": (context) => const QuizPage(),
        "/home": (context) =>  HomePage(),
        "/login": (context) =>  LoginPage(),
        "/register": (context) =>  RegisterPage(),
        "/profile": (context) =>  ProfilePage(user: FirebaseAuth.instance.currentUser!,),
        "/stats": (context) =>  MyStats(),
        "/home/lections": (context) => const TutorPage(),

        "/home/lections/a1": (context) => const LectionA1(),

        "/home/a2": (context) =>  HomePage(),
        "/home/b1": (context) =>  HomePage(),
        "/home/b2": (context) =>  HomePage(),
        "/home/c1": (context) =>  HomePage(),
        "/home/c2": (context) =>  HomePage(),
      },
    );
  }
}
