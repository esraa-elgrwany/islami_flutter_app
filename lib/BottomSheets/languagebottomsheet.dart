import 'package:flutter/material.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.eng,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color:
                  Theme.of(context).colorScheme.secondary
                 ),
                ),
                Spacer(),
                (provider.languageCode == "en")
                    ? Icon(Icons.done,
                        size: 25, color: MyThemeData.primaryColor)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.surface,
            thickness: 2,
            indent: 40,
            endIndent: 40,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color:  Theme.of(context).colorScheme.secondary
                 ),
                ),
                Spacer(),
                (provider.languageCode == "en")
                    ? SizedBox.shrink()
                    : Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.surface,
                        size: 25,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
