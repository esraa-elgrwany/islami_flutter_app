import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project/data/model/RadioModel.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';

import 'mythemedata.dart';

class RadioItem extends StatelessWidget{
  Radios radios;
  AudioPlayer audioPlayer;
 RadioItem(this.radios,this.audioPlayer);

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Column(
      children: [
        Text(radios.name??"",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: pro.modeApp==ThemeMode.light?MyThemeData.blackColor:
            Colors.white,
          ),),
        SizedBox(height: 50.h,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(onPressed:() {
              play();
            },
                iconSize: 45,
                icon: Icon(Icons.play_circle_fill,color: Theme.of(context).
                colorScheme.surface,)),
            IconButton(onPressed:() {
              stop();
            },
                iconSize: 45,
                icon: Icon(Icons.pause_circle_outline,color: Theme.of(context).colorScheme.
                surface,)),
          ],
        )
      ],
    );
  }

  void play()async{
   await audioPlayer.play(UrlSource(radios.url??""));
  }

  void stop(){
    audioPlayer.stop();
  }
}
