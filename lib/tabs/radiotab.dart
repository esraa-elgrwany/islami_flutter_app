import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project/data/api_manager.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:islami_project/radio_item.dart';
import 'package:provider/provider.dart';

import '../data/model/RadioModel.dart';

class RadioTab extends StatefulWidget{
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    audioPlayer=AudioPlayer();
  }
  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height:100.h),
       Image.asset("assets/images/radio_image.png"),
      SizedBox(height: 55.h,),
     FutureBuilder<List<Radios>?>(
         future: ApiManager.getRadios(),
         builder:(context, snapshot) {
           if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
           }else if(snapshot.connectionState==ConnectionState.waiting){
             return Center(child: CircularProgressIndicator());
           }else{
             return SizedBox(
               height: 160.h,
               child: ListView.builder(
                 physics: PageScrollPhysics(),
                 itemExtent:412.w,
                 scrollDirection: Axis.horizontal,
                 itemBuilder:(context, index) => RadioItem(snapshot.data![index],audioPlayer),
                 itemCount: snapshot.data?.length??0,
               ),
             );
           }
         },)

    ],
    );
  }
}
