import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      // body: ProfileScreen(
      //   providerConfigs: const [
      //     EmailProviderConfiguration(),
      //   ],
      //   actions: [
      //     SignedOutAction((context) {
      //       Navigator.of(context).pop();
      //     })
      //   ],
      //   avatarSize: 48,
      // ),
    );
  }
}
