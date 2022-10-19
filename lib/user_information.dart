import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denemebir/content_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetUserData {
  late String documentId;
  BuildContext? context;
  CollectionReference _users = FirebaseFirestore.instance.collection("Users");

  GetUserData({required this.documentId,required BuildContext this.context});

  Future<void> GetUserDataFromCloudAndQuestining(String emailController,String passwordController) async{
    var response = await _users.doc(documentId).get();
    var data = response;
    String email = data["email"];
    String password = data["password"];

    //burda sorgu yapıcam işte
    if(email == emailController && password == passwordController)
      {
        //giriş başarılı
        //buradan navigator ile diğer sayfaya yolla
        if(context != null)
          Navigator.push(context!, MaterialPageRoute(builder: (context) => ContentPage()));
        //null ise burası calısır!
      }
    else{
      //giriş başarısız alertDialog çıkart
      showMyAlertDialogSignIn(context!);
    }
  }
  Future showMyAlertDialogSignIn(BuildContext context) async{
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Hata!"),
        content: Text("Kullanıcı adı veya şifre hatalı. Lütfen daha sonra tekrar deneyiniz."),
      );
    });
  }
}

//burda firebase den verileri almam gerekli
//veriler bu şekilde gelmiyor başka birşey denicez tek tek almak için!