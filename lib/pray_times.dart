import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/pray_row.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrayTimesScreen extends StatefulWidget{
  static const String routeName="PrayTimes";
  const PrayTimesScreen({super.key});

  @override
  State<PrayTimesScreen> createState() => _PrayTimesScreenState();
}

class _PrayTimesScreenState extends State<PrayTimesScreen> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);

    final coordinates = Coordinates(30.0444, 31.2357);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(coordinates, params);

    return
      Stack(
        children: [
          Image.asset("assets/images/LPrayTime.jpg",
            fit: BoxFit.fill
            ,height: MediaQuery.of(context).size.height-200,
          color: pro.isDark?MyThemeData.darkPrimary:MyThemeData.primaryColor,),
          Scaffold(
            appBar: AppBar(
              leading: Container(
                margin: EdgeInsets.all(16),
                child: Center(
                  child: IconButton(onPressed:  () {
                  Navigator.pop(context);
                  }, icon:Icon(Icons.arrow_back_rounded,size: 30,color:
                  Theme.of(context).colorScheme.surface,) ),
                ),
              ),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16,),
                  Text("مواقيت الصلاة"
                      ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground ,
                      )
                  ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrayRow(txt: "الفجر",
                            icon: Icon(Icons.sunny_snowing),
                            time: DateFormat.jm().format(prayerTimes.fajr),),
                          PrayRow(txt: "الصبح",icon: Icon(Icons.wb_cloudy_outlined),time: DateFormat.jm().format(prayerTimes.sunrise),),
                          PrayRow(txt: "الظهر",icon: Icon(Icons.wb_sunny_rounded),time: DateFormat.jm().format(prayerTimes.dhuhr),),
                          PrayRow(txt: "العصر",icon: Icon(Icons.wb_sunny_outlined),time: DateFormat.jm().format(prayerTimes.asr),),
                          PrayRow(txt: "المغرب",icon: Icon(Icons.mode_night_outlined),time: DateFormat.jm().format(prayerTimes.maghrib),),
                          PrayRow(txt: "العشاء",icon: Icon(Icons.nights_stay_rounded),time: DateFormat.jm().format(prayerTimes.isha),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
    );
  }
}
