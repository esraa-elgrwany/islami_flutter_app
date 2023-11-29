import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:islami_project/providers/sura_details_provider.dart';
import 'package:islami_project/suradetails.dart';
import 'package:islami_project/suramodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  static List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider()..loadAllFiles(),
        builder: (context, child) {
          var provider = Provider.of<SuraDetailsProvider>(context);
          return Center(
            child: Column(
              children: [
                Image.asset("assets/images/quran_image.png"),
                Expanded(
                  child: Column(
                    children: [
                      Divider(
                        color: pro.modeApp == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.yellow,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.suraName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: pro.modeApp == ThemeMode.light
                                          ? MyThemeData.blackColor
                                          : Colors.white,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: 2.w,
                            height: 28.h,
                            child: VerticalDivider(
                              color: pro.modeApp == ThemeMode.light
                                  ? MyThemeData.primaryColor
                                  : MyThemeData.yellow,
                              thickness: 2,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.verses,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: pro.modeApp == ThemeMode.light
                                          ? MyThemeData.blackColor
                                          : Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: pro.modeApp == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.yellow,
                        thickness: 2,
                      ),
                      Expanded(
                          child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: pro.modeApp == ThemeMode.light
                              ? MyThemeData.primaryColor
                              : MyThemeData.yellow,
                          thickness: 1,
                          indent: 40,
                          endIndent: 40,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SuraDetails.routeName,
                                  arguments: SuraModel(suraName[index], index));
                            },
                            child: Center(
                                child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      suraName[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color:
                                                pro.modeApp == ThemeMode.light
                                                    ? MyThemeData.blackColor
                                                    : Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 28,
                                  child: VerticalDivider(
                                    color: pro.modeApp == ThemeMode.light
                                        ? MyThemeData.primaryColor
                                        : MyThemeData.yellow,
                                    thickness: 2,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child:provider.versesLength.length<15?
                                    CircularProgressIndicator(
                                      color: Theme.of(context).colorScheme.surface,
                                    )
                                        : Text(
                                      "${provider.versesLength[index]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color:
                                                pro.modeApp == ThemeMode.light
                                                    ? MyThemeData.blackColor
                                                    : Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          );
                        },
                        itemCount: suraName.length,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
