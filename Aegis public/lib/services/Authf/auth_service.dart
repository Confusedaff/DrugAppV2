import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? getCurrentUser(){
    return auth.currentUser;
  }

  Future<UserCredential> signInWithEmailPassword(String email,password)async{
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, password: password);
        firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid':userCredential.user!.uid,
            'email':email,
          },
        );
        return userCredential;
    }on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  Future<void> signOut()async{
    return await auth.signOut();
  }

  Future<UserCredential> signUpWithEmailPassword(String email,password)async {
    try{
      UserCredential userCredential =
      await auth.createUserWithEmailAndPassword(
        email: email,
         password: password
         );

        firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid':userCredential.user!.uid,
            'email':email,
          },
        );

         return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

}