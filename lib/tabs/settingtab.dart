import 'package:flutter/material.dart';
import 'package:islami_project/BottomSheets/languagebottomsheet.dart';
import 'package:islami_project/BottomSheets/themingbottomsheet.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.lang,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.secondary)),
          InkWell(
            onTap: showLangugeBottomSheet,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Text(pro.languageCode=="en"?AppLocalizations.of(context)!.eng
              :AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color:Theme.of(context).colorScheme.secondary,)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  )),
          InkWell(
            onTap: showThemingBottomSheet,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Text(pro.modeApp==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      )),
            ),
          )
        ],
      ),
    );
  }

  showLangugeBottomSheet() {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) => LanguageBottomSheet(),
    );
  }

  showThemingBottomSheet() {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) => ThemingBottomSheet(),
    );
  }
}
