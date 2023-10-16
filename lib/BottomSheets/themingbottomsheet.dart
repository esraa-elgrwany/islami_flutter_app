import 'package:flutter/material.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemingBottomSheet extends StatelessWidget{
  const ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeMode(ThemeMode.light);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color:
                  provider.modeApp==ThemeMode.light?
                  MyThemeData.primaryColor:
                  Colors.white
                  ),
                ),
                Spacer(),
                (provider.modeApp==ThemeMode.
                light)
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
              provider.changeMode(ThemeMode.dark);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: provider.modeApp==ThemeMode.dark?
                  MyThemeData.yellow:
                  MyThemeData.blackColor
                  ),
                ),
                Spacer(),
                (provider.modeApp==ThemeMode.light)
                    ? SizedBox.shrink()
                    : Icon(
                  Icons.done,
                  color: MyThemeData.yellow,
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
