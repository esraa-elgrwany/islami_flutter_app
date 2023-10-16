import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:islami_project/providers/sura_details_provider.dart';
import 'package:islami_project/suramodel.dart';
import 'package:provider/provider.dart';
import 'package:islami_project/providers/my_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {


  @override
  Widget build(BuildContext context) {
   var provider=Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var pro=Provider.of<SuraDetailsProvider>(context);

     return Stack(
        children: [
          Image.asset(
          provider.getBackground(),
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Scaffold(
            appBar: AppBar(
              title: Text(
                args.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>  Divider(
                        color: Theme.of(context).colorScheme.primary,
                        thickness: 2,
                        indent: 40,
                        endIndent: 40,
                      ),
                    itemBuilder: (context, index) {
                      return Center(
                          child: Text(
                       "${pro.verses[index]}(${index+1})",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ));
                    },
                    itemCount: pro.verses.length,
                  ),
                ),
              ),
            ),
          ),
        ],
      ); },
    );
  }


}
