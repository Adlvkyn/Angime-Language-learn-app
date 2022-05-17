

import 'package:angime/widgets/nsk_button.dart';
import 'package:angime/widgets/nsk_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Image.asset('assets/boy.jpg')],
        title: const Text(
          'Angime',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/yurt.jpg"),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth),
        ),
        child: Column(
          children: [
            NskTextField(
              label: "Почта",
              controller: email,
            ),
            NskTextField(
              label: "Пароль",
              controller: password,
            ),
            NskButton(
              text: "Войти",
              onPressed: () async {
                try {
                  final credential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  print(credential.user);
                  if (FirebaseAuth.instance.currentUser != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Пользователь не найден'),
                    ));
                  } else if (e.code == 'wrong-password') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Неверный пароль'),
                    ));
                  }
                }
              },
            ),
            
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Еще не зарегистрированы?',
                    style: new TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' Зарегистрироваться',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
