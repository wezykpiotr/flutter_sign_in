import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign_in/home_page_child.dart';
import 'package:flutter_sign_in/new_page.dart';
import 'package:flutter_sign_in/service/google_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return const SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                  clientId:
                      '1057557637265-10devjcbga7v6d0ibucrmg0sllv77trp.apps.googleusercontent.com')
            ],
          );
        }

        return const HomePageChild();
      },
    );
  }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("LOG IN BY GOOGLE"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ElevatedButton(
//             onPressed: () => GoogleAuth().signInWithGoogle(),
//             child: const Text('Log in with google'),
//           ),
//           Text('data'),
//         ],
//       ),
//     );
//   }
// }
}
