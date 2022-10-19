import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denemebir/login_page.dart';
import 'package:denemebir/user_information.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    double sc = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nicknameController = TextEditingController();

    CollectionReference _users = FirebaseFirestore.instance.collection("Users");


    return Scaffold(
      backgroundColor: Color(0xFFe7dad7),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: sc * 0.2,
              ),
              Center(
                  child: Text(
                "Bir Hesaba Giriş Yapın",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF9584c5),
                    fontWeight: FontWeight.w700),
              )),
              SizedBox(
                height: sc * 0.08,
              ),
              Form(
                child: Expanded(
                  child: ListView(
                    children: [
                      TextFormField(
                        style: TextStyle(
                            color: Color(0xFF9584c5),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        cursorColor: Color(0xFF9584c5),
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: "E-mailinizi giriniz",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF9584c5), width: sc * 0.01),
                            borderRadius: BorderRadius.circular(sc * 0.02),
                          ),
                          hintStyle: TextStyle(
                              color: Color(0xFF9584c5),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: sc * 0.04,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: Color(0xFF9584c5),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        cursorColor: Color(0xFF9584c5),
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Şifrenizi giriniz",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF9584c5), width: sc * 0.01),
                            borderRadius: BorderRadius.circular(sc * 0.02),
                          ),
                          hintStyle: TextStyle(
                              color: Color(0xFF9584c5),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: sc * 0.06,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF9584c5)),
                        ),
                        onPressed: () {
                          GetUserData getdata = GetUserData(documentId: emailController.text, context: context);
                          getdata.GetUserDataFromCloudAndQuestining(emailController.text, passwordController.text);
                        },
                        child: Text(
                          "Giriş Yap",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFFe7dad7)),
                        ),
                      ),
                      SizedBox(
                        height: sc * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hesabın mı yok? Hemen ",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          GestureDetector(
                              child: Text("kayıt ol!",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//bug var bu bug e postanın tamamını yazmasını sağlamalı sadece deneme30 şeklinde degilde deneme30@gmail.com şeklinde olmalı bunu sorgulatmalıyım!
