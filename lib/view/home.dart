import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_login/view/news.dart';
import 'package:google_login/view/profie.dart';
import 'package:google_login/view/signin.dart';
import 'package:google_login/view/youtube.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _selectedIndex = 0;
  List<String> _selectedImages = [
    'assets/news1.png',
    'assets/youtube.png',
    'assets/profile.png',
  ];
  void _onItemTapped(int index){
    setState(() {
          _selectedIndex = index;
          switch (_selectedIndex) {
            case 0:
              _selectedImages[0] = 'assets/news1.png';
              break;
            case 1:
              _selectedImages[1] = 'assets/youtube1.png';
              break;
            case 2:
              _selectedImages[2] = 'assets/profile1.png';
              break;  
            default:
          }
    });
  }

  Widget _getPage (int index){
        switch (index) {
      case 0:
        return News();
      case 1:
        return Youtube();
      case 2:
        return Profile();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _getPage(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
            offset: const Offset(8, 20))
            ],
            
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  
                  icon: Image(
                    image: AssetImage(
                      _selectedIndex == 0 ? _selectedImages[0] : 'assets/news.png',
                    ),
                    width: 30,
                    height: 30,
                  ),
                  label: 'News',
                  
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage(
                      _selectedIndex == 1 ? _selectedImages[1] : 'assets/youtube.png',
                    ),
                    width: 30,
                    height: 30,
                  ),
                  label: "Video",
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage(
                      _selectedIndex == 2 ? _selectedImages[2] : 'assets/profile.png',
                    ),
                    width: 30,
                    height: 30,
                  ),
                  label: 'Profile',
                ),
        ], backgroundColor: const Color.fromARGB(255, 255, 255, 255),
           selectedItemColor: Colors.blueAccent,),
      ),
    );
  }
}