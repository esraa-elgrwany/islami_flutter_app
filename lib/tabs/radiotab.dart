import 'package:flutter/material.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget{
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Column(
    children: [
      SizedBox(height: 90,),
       Image.asset("assets/images/radio_image.png"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text("اذاعة القرآن الكريم",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: pro.modeApp==ThemeMode.light?MyThemeData.blackColor:
              Colors.white,
            ),),
        ],
      )
    ],
    );
  }
}
