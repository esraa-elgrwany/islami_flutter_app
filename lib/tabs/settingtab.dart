import 'package:flutter/material.dart';
import 'package:islami_project/mythemedata.dart';

class SettingTab extends StatefulWidget{
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language",style:Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: MyThemeData.blackColor
          )),
          InkWell(
            onTap: showLangugeBottomSheet,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemeData.primaryColor)
              ),
              child: Text("English",style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MyThemeData.blackColor
              )),
            ),
          ),
          SizedBox(height: 30,),
          Text("Themeing",style:Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: MyThemeData.blackColor,
          )),
           InkWell(
             onTap: showThemeingBottomSheet,
             child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: MyThemeData.primaryColor)
              ),
              child: Text("Light",style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MyThemeData.blackColor,
              )),
          ),
           )
        ],
      ),
    );
  }

  showLangugeBottomSheet(){
    showModalBottomSheet(context: context,
      isScrollControlled: true,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.transparent)
      ),
      builder:(context) => Container(
        height: MediaQuery.of(context).size.height*.7,
    ),);
  }
  showThemeingBottomSheet(){
    showModalBottomSheet(context: context,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent)
      ),
      builder:(context) => Container(
        height: MediaQuery.of(context).size.height*.7,
      ),);
  }
}
