import 'package:flutter/material.dart';
import 'package:google_login/view/home.dart';
import 'package:google_login/view/login.dart';
import 'package:google_login/view/signin.dart';
import 'package:google_login/viewmodel/FirebaseService.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  FirebaseService firebaseService = FirebaseService();

      @override
      void initState() {
        super.initState();
        _checkLoggedInUser();
      }

    Future<void> _checkLoggedInUser() async {
    final user = await firebaseService.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xffF8F8F8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
                SizedBox(
                  width: 220,
                  child: Text('Entertaiment Application', 
                        style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [
                              Color(0xFF25D366),
                              Color(0xFF00A884),
                            ],
                          ).createShader(
                            Rect.fromLTWH(0.0, 0.0, 200.0, 50.0),
                          ),
                      ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: Text("an application that brings information to the community",style: TextStyle(color: Color(0xFF4D4D4D),fontSize: 16),)),
                  SizedBox(height: 40,),
                  Center(child: Image.asset('assets/splash.png',width: 250,height: 250,)),
                  Spacer(),
                  GestureDetector(
                   onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                     },
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff00A884),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        height: 50,
                        width: 150,
                        child: Center(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Next", style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10,), 
                            Image.asset('assets/next.png')
                            ])),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}