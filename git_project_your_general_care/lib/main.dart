import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'Image.dart';

late SharedPreferences pref;

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  pref = await SharedPreferences.getInstance();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp(Key key{super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.purpleAccent,
      ),
      home: pref.getBool("isLogin") ==true ? HomePage(): LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  LoginScreen();
}

class _LoginScreenState extends State<LoginScreen> {
  //int _counter = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscureText = true;

  //get emailExp => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registration Page"),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.purpleAccent,
                    backgroundImage: AssetImage(doctorLogo),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: emailController,
                    onFieldSubmitted: (text) {
                      print(text);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          bottom: 10, left: 20, right: 20),
                      hintStyle: TextStyle(color: Colors.purple),
                      hintText: "Email*",
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: passwordController,
                    onFieldSubmitted: (text) {
                      print(text);
                    },
                    onChanged: (value) {
                      print(value);
                    },

                    obscureText: _isObscureText,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            bottom: 10, left: 20, right: 20),
                        hintStyle: TextStyle(color: Colors.purple),
                        hintText: "Password*",
                        suffixIcon : GestureDetector(
                            onTap: (){
                              _isObscureText = !_isObscureText;
                              setState(() {
                              });
                            },
                            child:  Icon(  _isObscureText ?Icons.visibility_off:Icons.visibility,color:  _isObscureText ?Colors.grey:Colors.black)
                        )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    print("LogIn Pressed");
                    String email = emailController.text;
                    String password = passwordController.text;
                    if(password.length<8){
                      showInSnackBar("Please Enter 8 or greater length password");
                      return;
                    }
                    if(!validateAndSubmit(email)){
                      showInSnackBar("Please Enter a Valid Email");
                      return;
                    }
                    else {
                      try {
                        UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        pref.setBool("isLogin", true);
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),), (route) => false);
                      } on FirebaseAuthException catch  (err) {
                        pref.setBool("isLogin", false);
                        if(err.code == "email-already-in-use"){
                          UserCredential user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          pref.setBool("isLogin", true);
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),), (route) => false);
                        }
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 30,
                    color: Colors.purpleAccent,
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}

validateAndSubmit(String value) {
  final bool isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
  return isValidEmail;
}