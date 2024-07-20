import 'package:flutter/material.dart';
import 'package:google_login/view/signin.dart';
import 'package:google_login/viewmodel/FirebaseService.dart';
import 'package:google_login/view/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  FirebaseService firebaseService = FirebaseService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 220,
                    child: Text('Login Account!', 
                          style: TextStyle(
                            fontFamily: 'Lexend',
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
                   Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 300,
                    child: Text("Please log in to continue discovering great things now",style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF4D4D4D),fontSize: 16),)),
                    SizedBox(height: 40,),
                      Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key), // thêm icon email
                          hintText: 'Enter Email',
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
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key), // thêm icon email
                          hintText: 'Enter Password',
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
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Spacer(),
                          Text("Forgot Your Password?", style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,color: Color(0xff1F41BB),fontWeight: FontWeight.w600),)
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: ()async{
                          try {
                          final check = await firebaseService.signInWithEmailAndPassword(email.text,password.text);
                          if (check != null) {
                            print('login success');
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                          }
                          } catch (e) {
                                print('Error signing in with email and password: $e');
                            }
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
                        child: Center(child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),)),
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
                            Text("Login Account With Google", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 18,fontWeight: FontWeight.bold),),
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
                    GestureDetector(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin()));
                      },
                      child: Center(child: Text("Create An Account", style: TextStyle(
                        fontFamily: 'Lexend',
                        color: Color(0xff00A884), fontSize: 18,fontWeight: FontWeight.w600),)),
                    ),
                    SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _SignGoooge() async{
       try {
         await FirebaseService().signInWithGoogle();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
            } catch (e) {
              print('Error signing in with Google: $e');
          }
   }
}