import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/ahadethmodel.dart';
import 'package:islami_project/hadethdetails.dart';
import 'package:islami_project/mythemedata.dart';

class AhadethTab extends StatelessWidget {
  List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    loodAhadethFile();
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/ahadeth_image.png"),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 2,
          ),
          Text(
            "Ahadeth",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: MyThemeData.blackColor,
                ),
          ),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 2,
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: MyThemeData.primaryColor,
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments:allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: MyThemeData.blackColor),
                ),
              );
            },
            itemCount: allAhadeth.length,
          )),
        ],
      ),
    );
  }

  loodAhadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadeth = ahadethList[i];
        List<String> hadethLines = hadeth.trim().split("\n");
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        AhadethModel hadethModel = AhadethModel(title, content);
        allAhadeth.add(hadethModel);
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}
