import 'package:angime/widgets/nsk_button.dart';
import 'package:angime/widgets/nsk_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  //контроллеры для полей ввода чтобы стягивать с них данных или управление текстом ввода
  final email = TextEditingController();
  final name = TextEditingController();
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
              label: "Имя пользователя",
              controller: name,
            ),
            NskTextField(
              label: "Почта",
              controller: email,
            ),
            NskTextField(
              label: "Пароль",
              controller: password,
            ),
            NskButton(
              text: "Регистрация",
              onPressed: () async {
                if(name.text != ""){
                  try {
                  final credit = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  )
                      .then((result) {
                    return result.user!.updateDisplayName(name.text);
                  });

                  if (FirebaseAuth.instance.currentUser != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Слабый пароль'),
                    ));
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Пользователь уже существует'),
                    ));
                  }
                } catch (e) {
                  print(e);
                }
                }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Введите имя'),
                    ));
                }
              },
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Уже есть аккаунт?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' Войти',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(context, '/login');
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
