import 'package:denemebir/register.dart';
import 'package:denemebir/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF5434377),
        ),
        home: FutureBuilder(
          future: _initialization,
          builder: (context,snapshot) {
            if(snapshot.hasError){
              return Center(child: Text("Beklenilmeyen bir hata oluştu"),);
            }
            else if(snapshot.hasData)
              {return SignInPage();}
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }
}
