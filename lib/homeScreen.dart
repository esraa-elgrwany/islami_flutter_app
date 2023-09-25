import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/tabs/ahadethtab.dart';
import 'package:islami_project/tabs/qurantab.dart';
import 'package:islami_project/tabs/radiotab.dart';
import 'package:islami_project/tabs/sebha.dart';
import 'package:islami_project/tabs/settingtab.dart';

class HomeScreen extends StatefulWidget{

  static const String routeName="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Image.asset("assets/images/background.png",width: double.infinity,fit: BoxFit.cover,),
        Scaffold(
         appBar: AppBar(
           title: Text("Islami",style: Theme.of(context).textTheme.bodyLarge
         ),
        ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              index=value;
              setState(() {
              });
            },
            backgroundColor:MyThemeData.primaryColor,
            currentIndex: index,
            items: [
            BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/radio.png")),
                label: "Radio",
                backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "Sebha",
                  backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: "Ahadeth",
                  backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/quran.png")),
                  label: "Quran",
                  backgroundColor: MyThemeData.primaryColor),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting",
                backgroundColor: MyThemeData.primaryColor),
          ],
          ),
          body: tabs[index],
    ),
      ],
    );
  }
  List<Widget>tabs=[RadioTab(),SebhaTab(),AhadethTab(),QuranTab(),SettingTab()];
}
