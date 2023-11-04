import 'package:flutter/material.dart';
import 'package:flutter_sign_in/login_page.dart';

class HomePageChild extends StatelessWidget {
  const HomePageChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("TESSSSSSSSSSSSSSST"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.grey[800],
              size: 36,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
