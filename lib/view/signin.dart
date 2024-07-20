import 'package:flutter/material.dart';
import 'package:google_login/view/login.dart';
import 'package:google_login/viewmodel/FirebaseService.dart';
import 'package:google_login/view/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final FirebaseService firebaseService = FirebaseService();
  TextEditingController username  = TextEditingController();
  TextEditingController email  = TextEditingController();
  TextEditingController password  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  SizedBox(height: 25,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 220,
                    child: Text('Create Account!', 
                          style: TextStyle(
                          fontSize: 36.0,
                          fontFamily: 'Lexend',
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
                   Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 300,
                    child: Text("Please log in to continue discovering great things now",
                    style: TextStyle(
                      color: Color(0xFF4D4D4D),
                      fontFamily: 'Poppins',
                      fontSize: 16),
                      )),
                    SizedBox(height: 40,),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: username,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person), // thêm icon email
                          hintText: 'Enter Username',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                            color: Color(0xFF4D4D4D),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Colors.green,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.green,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                          prefixIcon: Icon(Icons.email), // thêm icon email
                          hintStyle: TextStyle(
                             fontFamily: 'Poppins',
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                            color: Color(0xFF4D4D4D),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Colors.green,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.green,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        obscureText: true,
                        controller: password,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key), // thêm icon email
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            fontFamily: 'lexend',
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                            color: Color(0xFF4D4D4D),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Colors.green,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.green,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Spacer(),
                          Text("Forgot Your Password?", style: TextStyle(
                            fontSize: 14,color: Color(0xff1F41BB),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () async{
                           try {
                            final check = await firebaseService.registerWithEmailAndPassword(username.text,email.text, password.text);
                            if(check !=null){
                              print('Create Account succces');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                            }
                          } catch (e) {
                            print(e);
                          };
                      },
                      child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
                        width: 250,
                        child: Center(child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),)),
                      ),
                     ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Spacer(),
                           Container(width: 100,height: 1, color: Color(0xff999999),),
                           SizedBox(width: 20,),
                           Text("or",style: TextStyle(color: Color(0xff999999),fontSize: 14),),
                           SizedBox(width: 20,),
                           Container(width: 100,height: 1, color: Color(0xff999999)),
                           Spacer()
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                     _SignGoooge();
                    },
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255),
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
                        width: 300,
                        child: Center(child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/google.png'),
                            SizedBox(width: 10,), 
                            Text("Create Account With Google", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 18,fontWeight: FontWeight.bold),),
                            ])),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                                      Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Spacer(),
                           Container(width: 150,height: 1, color: Color(0xff999999),),
                           SizedBox(width: 30,),
                           Container(width: 150,height: 1, color: Color(0xff999999)),
                           Spacer()
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                      },
                      child: Text("Login In Account", style: TextStyle(
                        color: Color(0xff00A884),
                        fontFamily: 'Lexend'
                        , fontSize: 18,fontWeight: FontWeight.w600),),
                    )),
                    SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _SignGoooge() async{
       try {
         await firebaseService.signInWithGoogle();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
            } catch (e) {
              print('Error signing in with Google: $e');
          }
   }
}