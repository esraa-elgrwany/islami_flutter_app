import 'package:flutter/material.dart';
import 'package:islami_project/ahadethmodel.dart';

import 'mythemedata.dart';

class HadethDetails extends StatefulWidget{
  static const String routeName="hadethDetails";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as AhadethModel;
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: MyThemeData.primaryColor, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: MyThemeData.primaryColor,
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                  ),
                  itemBuilder: (context, index) {
                    return Center(
                        child: Text(args.content[index],
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ));
                  },
                  itemCount:args.content.length ,
                ),
              ),
            ),
          ),
        ),
      ],
    );

  }
}