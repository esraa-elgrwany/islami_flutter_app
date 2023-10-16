import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/ahadethmodel.dart';
import 'package:islami_project/hadethdetails.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatefulWidget{
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    loodAhadethFile();
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/ahadeth_image.png"),
          Divider(
            color: pro.modeApp==ThemeMode.light?MyThemeData.primaryColor:
            MyThemeData.yellow,
            thickness: 2,
          ),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: pro.modeApp==ThemeMode.light?MyThemeData.blackColor:
              Colors.white,
            ),
          ),
          Divider(
            color: pro.modeApp==ThemeMode.light?MyThemeData.primaryColor:
            MyThemeData.yellow,
            thickness: 2,
          ),
          Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: pro.modeApp==ThemeMode.light?MyThemeData.primaryColor:
                  MyThemeData.yellow,
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
                          ?.copyWith(color: pro.modeApp==ThemeMode.light?MyThemeData.blackColor:
                      Colors.white,),
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
        setState(() {
        });
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}
