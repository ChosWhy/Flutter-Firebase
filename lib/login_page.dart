import 'package:flutter/material.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    double sc = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nicknameController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: sc * 0.07,
                      color: Color(0xFFdae3dd),
                    )),
                SizedBox(
                  height: sc * 0.12,
                ),
                Center(
                  child: Text(
                    "Bir Hesap Oluşturun",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFdae3dd),
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: sc * 0.08,
                ),
                Form(
                  child: Expanded(
                    child: ListView(
                      children: [
                        TextFormField(
                          style: TextStyle(
                              color: Color(0xFFdae3dd),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                          cursorColor: Color(0xFFdae3dd),
                          controller: nicknameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Kullanıcı adınızı giriniz.",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFdae3dd), width: sc * 0.01),
                              borderRadius: BorderRadius.circular(sc * 0.02),
                            ),
                            hintStyle: TextStyle(
                                color: Color(0xFFdae3dd),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: sc * 0.04,
                        ),
                        TextFormField(
                          style: TextStyle(
                              color: Color(0xFFdae3dd),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                          cursorColor: Color(0xFFdae3dd),
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "E-mailiniz giriniz.",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFdae3dd), width: sc * 0.01),
                              borderRadius: BorderRadius.circular(sc * 0.02),
                            ),
                            hintStyle: TextStyle(
                                color: Color(0xFFdae3dd),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: sc * 0.04,
                        ),
                        TextFormField(
                          style: TextStyle(
                              color: Color(0xFFdae3dd),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                          cursorColor: Color(0xFFdae3dd),
                          controller: passwordController,
                          obscureText:
                              true, //bu şifre girilirken karakterleri gizler!
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Şifre",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFdae3dd), width: sc * 0.01),
                              borderRadius: BorderRadius.circular(sc * 0.02),
                            ),
                            hintStyle: TextStyle(
                                color: Color(0xFFdae3dd),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: sc * 0.06,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF5434390)),
                          ),
                          onPressed: () {
                            Register(context: context).addUser(
                                emailController.text,
                                passwordController.text,
                                nicknameController.text);
                            //alert dialog çıkartıp ekrana kayıt başarılı yazdırtırsam kapattıktan sonra diger kısma geçsin kayıt başarısız cıkarsa burda kalsın!
                          },
                          child: Text(
                            "Kayıt Ol!",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFFdae3dd)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void buildNavgitaorPop(BuildContext context){
  return Navigator.pop(context);
}


//hesap eklendiğinde veya eklenmediginde alert dialogun cıkmasını ve ekranda uyarı verip loginpage e öyle geçmesini istiyorum
