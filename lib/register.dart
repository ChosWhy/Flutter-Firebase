import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register{
  late String errorMessage;
  BuildContext? context;
  Register({Key? key,required BuildContext this.context});

  CollectionReference _users = FirebaseFirestore.instance.collection("Users");

  Future<void> addUser(String email, String password, String nickName) async {
    try{
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print("user adedd to auth");
        return _users
            .doc(email)
            .set({
          "email": email,
          "password": password,
          "nickName": nickName,
        })
            .then((value) {
          print("User Added to database");
          dataSavedSuccessfully(context!);
          Timer(Duration(seconds: 1),(){
            showMyAlertDialogRegister(context!);
          });
          showMyAlertDialogRegister(context!);
        })
            .catchError((error) {
          print("Failed to add user: $error");
        });
      });
    }
  on FirebaseAuthException catch (error){
      print("Failed with error code :${error.code}");
      print(error);
      switch (error.code) {
        case "ERROR_INVALİD_EMAİL":
          errorMessage = "Your email address appears to be malform."; //E-posta adresiniz hatalı biçimlendirilmiş görünüyor.
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exits.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
           errorMessage = "An undefined Error happened.";
           break;
      }
    }
    if(errorMessage != Null)
      {
        return showMyAlertDialogError(context!, errorMessage);
      }
  }

  Future<void> dataSavedSuccessfully(BuildContext context) async{
    Navigator.pop(context);
  }

  Future showMyAlertDialogError(BuildContext context,String error) async{
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Hata!"),
        content: Text("Bir Hata Alındı :${error}"),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Kapat"))
        ],
      );
    });
  }
  Future showMyAlertDialogRegister(BuildContext context) async{
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Kayıt ol!"),
        content: Text("Başarılı şekilde kayıt oldunuz."),
      );
    });
  }
}
//sonrasında da giriş kısımlarıyla uğraş.