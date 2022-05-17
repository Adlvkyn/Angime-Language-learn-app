import 'package:angime/pages/auth/LoginPage.dart';
import 'package:angime/widgets/nsk_appbar.dart';
import 'package:angime/widgets/nsk_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer()
            ),
        actions: [Image.asset('assets/boy.jpg')],
        title: const Text(
          'Angime',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: NskDrawer(context: context),
      body: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/mountain.jpg"),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                'Пользователь: ${_currentUser.displayName}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Почта: ${_currentUser.email}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 16.0),
              _isSigningOut
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await FirebaseAuth.instance.signOut();
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: const Text('Выйти'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
