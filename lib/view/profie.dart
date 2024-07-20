import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_login/view/login.dart';
import 'package:google_login/view/signin.dart';
import 'package:google_login/viewmodel/FirebaseService.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseService firebaseService = FirebaseService();

    Future<void> signOut() async {
    try {
      await auth.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      print('Error signing out user: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Row(children: [
                   ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/user.png', width: 80,height: 80,)),
                   SizedBox(width: 20,),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Username",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Lexend'),),
                      SizedBox(height: 5,),
                      Text("Email",style: TextStyle(color: Color(0xFF848484),fontSize: 18, fontFamily: 'Poppins'),)
                    ],
                   )
                ],
                ),
                SizedBox(height: 15,),
                Text("Account",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Lexend'),),
                SizedBox(height: 10,),
                Container(width: 350,child: Text("All features and settings are available in the app here",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,color: Color(0xFF848484), fontFamily: 'Poppins'),)),
                SizedBox(height: 15,),
                Container(height: 1,width: double.infinity,color: Color.fromARGB(255, 233, 232, 232),),
                SizedBox(height: 15,),
                Center(child: Text("Connect With", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, fontFamily: 'Poppins'),),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Image.asset('assets/fb.png',),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Image.asset('assets/instagram.png',),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Image.asset('assets/twitter.png',),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Image.asset('assets/web.png',),
                    ),
                    Spacer()
                  ],
                ),
                SizedBox(height: 20,),
                Text('Setting', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Image.asset('assets/notification.png'),
                    SizedBox(width: 20,),
                    Text("Notification Setting", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18, fontFamily: 'Poppins'),)
                  ],
                ),
                SizedBox(height: 15,),
                Container(height: 1,width: double.infinity,color: Color.fromARGB(255, 222, 222, 222),),
                SizedBox(height: 15,),
                                Row(
                  children: [
                    Image.asset('assets/about.png'),
                    SizedBox(width: 20,),
                    Text("About", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18, fontFamily: 'Poppins'),)
                  ],
                ),
                SizedBox(height: 15,),
                Container(height: 1,width: double.infinity,color: Color.fromARGB(255, 222, 222, 222),),
                SizedBox(height: 15,),
                                Row(
                  children: [
                    Image.asset('assets/contact.png'),
                    SizedBox(width: 20,),
                    Text("Contact Us", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18, fontFamily: 'Poppins'),)
                  ],
                ),
                SizedBox(height: 15,),
                Container(height: 1,width: double.infinity,color: Color.fromARGB(255, 222, 222, 222),),
                SizedBox(height: 15,),
                                Row(
                  children: [
                    Image.asset('assets/share.png'),
                    SizedBox(width: 20,),
                    Text("Share on social networks", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18, fontFamily: 'Poppins'),)
                  ],
                ),
                SizedBox(height: 15,),
                Container(height: 1,width: double.infinity,color: Color.fromARGB(255, 222, 222, 222),),
                SizedBox(height: 15,),
                                Row(
                  children: [
                    Image.asset('assets/privacy.png'),
                    SizedBox(width: 20,),
                    Text("Privacy And Policy", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18, fontFamily: 'Poppins'),)
                  ],
                ),
                SizedBox(height: 15,),
                Container(height: 1,width: double.infinity,color: Color.fromARGB(255, 222, 222, 222),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Image.asset('assets/logout.png'),
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        firebaseService.logout();
                      },
                      child: GestureDetector(
                        onTap: (){
                          signOut();
                        },
                        child: Text("Logout", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18, color: Color(0xFF3763FF), fontFamily: 'Poppins'),)))
                  ],
                ),
                SizedBox(height: 15,),
                Container(height: 1,width: double.infinity,color: Color.fromARGB(255, 222, 222, 222),),
                SizedBox(height: 15,)
              ],
            ),
          )
          ),
      ),
      );
  }
}