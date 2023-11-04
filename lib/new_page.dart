import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google SignIn"),
      ),
      body: _user != null ? _userInfo() : _googleSignInButton(),
    );
  }

  Widget _googleSignInButton() {
    return Center(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: _handleGoogleSignIn,
          child: const Text("Sign up with Google"),
        ),
      ),
    );
  }

  Widget _userInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_user!.photoURL!),
              ),
            ),
          ),
          Text(_user!.email!),
          Text(_user!.displayName ?? ""),
          Text(_user!.uid),
          MaterialButton(
            color: Colors.red,
            onPressed: FirebaseAuth.instance.signOut,
            child: const Text("Sign Out"),
          )
        ],
      ),
    );
  }

  _handleGoogleSignIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await auth.signInWithCredential(credential);
      }
    } catch (error) {
      print(error);
    }

    //   try {
    //     GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
    //     _auth.signInWithProvider(_googleAuthProvider);
    //   } catch (error) {
    //     print(error);
    //   }
    // }
//*  W JAKIŚ SPOSÓB TRZEBA ZRESETOWAĆ UŻYTKOWNIKA
    // print('tu jestem');
    // final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // print('tu jestem 2');
    // final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    // print('tu jestem 3');
    // final credential = GoogleAuthProvider.credential(
    //     accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    // print('1' + '${gAuth.accessToken}');
    // print('2' + '${gAuth.idToken}');
    // try {
    //   print('tu jestem 5');
    //   _auth.signInWithCredential(credential);
    // } catch (e) {
    //   print(e);
    // }
  }
}
