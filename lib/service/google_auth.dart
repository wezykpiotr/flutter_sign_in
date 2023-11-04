import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuth {
  signInWithGoogle() async {
    print('tu jestem');
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    print('tu jestem 2');
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    print('tu jestem 3');
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    print('tu jestem 4');
    try {
      print('tu jestem 5');
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }

  signInGoogle()async{
    
  }
}
