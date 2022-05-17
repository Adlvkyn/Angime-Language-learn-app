import 'package:angime/widgets/nsk_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NskDrawer extends StatelessWidget {
  final BuildContext context;
  const NskDrawer({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 50,
          ),
          const NskTitle(title: "Angime"),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.table_chart_rounded,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Главная',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        letterSpacing: 0.5,
                        color: Color.fromRGBO(10, 10, 10, 1))),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          const Divider(
            color: Color.fromRGBO(187, 187, 187, 1),
            thickness: 1,
            indent: 10,
            endIndent: 18,
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Аккаунт',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        letterSpacing: 0.5,
                        color: Color.fromRGBO(10, 10, 10, 1))),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
          const Divider(
            color: Color.fromRGBO(187, 187, 187, 1),
            thickness: 1,
            indent: 10,
            endIndent: 18,
          ),

          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.multiline_chart_rounded,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Прогресс',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        letterSpacing: 0.5,
                        color: Color.fromRGBO(10, 10, 10, 1))),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/stats');
            },
          ),
          const Divider(
            color: Color.fromRGBO(187, 187, 187, 1),
            thickness: 1,
            indent: 10,
            endIndent: 18,
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Выйти',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        letterSpacing: 0.5,
                        color: Color.fromRGBO(10, 10, 10, 1))),
              ],
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              if (FirebaseAuth.instance.currentUser == null) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
          const Divider(
            color: Color.fromRGBO(187, 187, 187, 1),
            thickness: 1,
            indent: 10,
            endIndent: 18,
          ),
        ],
      ),
    );
  }
}
