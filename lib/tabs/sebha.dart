import 'package:flutter/material.dart';
import 'package:islami_project/mythemedata.dart';

class SebhaTab extends StatefulWidget{
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int index=0;
  int count=1;
  int anime=0;
  Color changeColor=MyThemeData.primaryColor;
  List<String>tasbeh=["سبحان الله","الحمد لله","الله اكبر"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
        InkWell(
          onTap: () {
            count++;
            resetTasbeh();
            anime++;
            animateColor();
            setState(() {
            });
          },
            child: Image.asset("assets/images/sebhagroup.png",color: changeColor,)),

              SizedBox(height: 35,),
              Text("عدد التسبيحات",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color:MyThemeData.blackColor,
                fontWeight: FontWeight.w400,

              )),
                          SizedBox(height: 30,),
                          Container(
                            width: 69,
                            height: 81,
                              decoration: BoxDecoration(
                                color: MyThemeData.primaryColor,
                                 borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text("$count",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: MyThemeData.blackColor,
                                ),textAlign: TextAlign.center,
                            ),
                              )),
                    SizedBox(height:15 ,),

                    Container(
                      width: 137,
                      height: 51,
                      decoration: BoxDecoration(
                        color: MyThemeData.primaryColor,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(tasbeh[index],style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),),
                        )),
                      ),


           ],
      )
    );
  }
  resetTasbeh(){
    if(index==2) {
      if(count==34){
        index = 0;
        count=1;
      }

    }
    if(count==34){
      count=1;
      index++;
      setState(() {
      });
    }
  }
  animateColor(){
   if(anime%2==0){
     changeColor=MyThemeData.primaryColor;
     setState(() {
     });
   }
   if(anime%2!=0){
     changeColor=MyThemeData.blackColor;
     setState(() {
     });
  }
}
}
