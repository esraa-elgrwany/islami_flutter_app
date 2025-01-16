import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project/Hive_Service.dart';
import 'package:islami_project/notification/notification.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'mythemedata.dart';

class Night extends StatefulWidget {
  static const String routeName = "Night";

  const Night({super.key});

  @override
  State<Night> createState() => _NightState();
}

class _NightState extends State<Night> {
   DateTime selectedTimeNight = DateTime.now();
  bool isSwitched = false;
  final List<String> messages = [
    "أَمسينا وَأَمسي المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذا اليوم وَخَـيرَ ما بَعْـدَه ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر.",
    "اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ .",
    "رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.",
    "اللهم إِنِّـي أَمسيت أُشْـهِدُك ، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك ، وَمَلَائِكَتَكَ ، وَجَمـيعَ خَلْـقِك ، أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك ، وَأَنَّ ُ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك.",
    "اللّهُـمَّ ما اَمسي بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر.",
    "حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم.",
    "بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم.",
    "اللّهُـمَّ بِكَ أَمْسَـينا وَبِكَ أَصْـبَحْنا  ، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ النُّـشُور.",
    " أَمْسَـينا عَلَى فِطْرَةِ الإسْلاَمِ، وَعَلَى كَلِمَةِ الإِخْلاَصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ، وَعَلَى مِلَّةِ أَبِينَا إبْرَاهِيمَ حَنِيفاً مُسْلِماً وَمَا كَانَ مِنَ المُشْرِكِينَ.",
    "سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه."
  ];
  String? endItemsValue;
  String? separateItemsValue;
  final List<String> endItems = ["نص ساعة", "ساعة", 'ساعتين'];
  final List<String> separateItems = ["دقيقة", 'دقيقتين'];
  @override
  void initState() {
    super.initState();
    loadNightSettings();
  }

   Future<void> loadNightSettings() async {
     isSwitched = await HiveService.getSwitchState('nightSwitch');
     selectedTimeNight = await HiveService.getTime('nightSelectedTime') ?? DateTime.now();
     endItemsValue = await HiveService.getEndTime('nightEndItemsValue') ?? 'ساعة';
     separateItemsValue = await HiveService.getSeparateTime('nightSeparateItemsValue') ?? 'دقيقة';
     setState(() {});
   }
  @override
  Widget build(BuildContext context) {
    print(TimeOfDay.now());
    var pro = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          pro.getBackground(),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
            appBar: AppBar(
              title: Text("أذكار المساء",
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 170.h,
                  width: double.infinity,
                  margin: EdgeInsetsDirectional.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color:
                      Theme.of(context).colorScheme.primary.withOpacity(.7),
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("تفعيل الاشعارات",
                                style: Theme.of(context).textTheme.bodySmall),
                            Spacer(),
                            Switch(
                                activeColor:Theme.of(context).colorScheme.primary,
                                activeTrackColor: Colors.grey[100],
                                inactiveTrackColor:pro.isDark? Colors.grey:Colors.grey[200],
                                value:
                                isSwitched,
                                onChanged: (value) async{
                                  setState(() {
                                   isSwitched=
                                        value;
                                    if (isSwitched) {
                                      NotificationService.scheduleNotification(
                                          messages, selectedTimeNight,
                                          NotificationService.intervalBetweenNightNotifications,
                                          NotificationService.endTimeNight);
                                      print("***************${
                                          NotificationService.scheduleNotification}");
                                    }else{
                                      NotificationService.flutterLocalNotificationsPlugin.cancelAll();
                                    }
                                  });
                                  await HiveService.saveSwitchState('nightSwitch', value);
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                    " الوقت المحدد لارسال الاشعارات  ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                      fontSize: 14,
                                    )),
                                Text("${selectedTimeNight.minute}:", style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  fontSize: 16,
                                )),
                                Text(selectedTimeNight.hour==00?"12":
                                selectedTimeNight.hour>12?"${selectedTimeNight.hour-12}":
                                "${selectedTimeNight.hour}", style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  fontSize: 16,
                                )
                                ),
                                SizedBox(width: 6.w,),
                                Text(selectedTimeNight.hour==00?"AM":
                                selectedTimeNight.hour>=12?"PM":
                                "AM", style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  fontSize: 16,
                                )
                                ),
                              ],
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  pickTime();
                                },
                                child: Icon(
                                  Icons.date_range,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  size: 25,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("وقت الانتهاء:",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  fontSize: 10,
                                )),
                            DropdownButton<String>(
                              value: endItemsValue,
                              items: endItems.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) async{
                                setState(() {
                                  endItemsValue = newValue;
                                  if(newValue==endItems[0]){
                                    NotificationService.endTime=selectedTimeNight.add(Duration(minutes:30));
                                  }else if(newValue==endItems[1]){
                                    NotificationService.endTime=
                                        selectedTimeNight.add(Duration(hours:1));
                                  }else{
                                    NotificationService.endTime=
                                        selectedTimeNight.add(Duration(hours:2));
                                  }
                                });
                                await HiveService.saveEndTime('nightEndItemsValue',endItemsValue!);
                              },
                              dropdownColor: Theme.of(context).colorScheme.surface,

                              style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                              icon: Center(
                                child: Icon(Icons.arrow_drop_down,
                                    color:Theme.of(context).colorScheme.secondary),
                              ), // Dropdown icon
                            ),
                            Text("الفاصل بين الاشعارات:",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  fontSize: 10,
                                )),
                            InkWell(
                              onTap: () {},
                              child: DropdownButton<String>(
                                value: separateItemsValue,
                                items: separateItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    separateItemsValue = newValue;
                                    if (newValue==separateItems[0]){
                                      NotificationService.intervalBetweenNightNotifications
                                      =Duration(minutes: 1);
                                    }else{
                                      NotificationService.intervalBetweenNightNotifications
                                      =Duration(minutes: 2);
                                    }
                                  });
                                  await HiveService.saveSeparateTime('nightSeparateItemsValue', separateItemsValue!);
                                },
                                dropdownColor:Theme.of(context).colorScheme.surface,
                                // Background color of dropdown
                                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                                // Text style of dropdown items
                                icon: Center(
                                  child: Icon(Icons.arrow_drop_down,
                                      color:Theme.of(context).colorScheme.secondary),
                                ), // Dropdown icon
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsetsDirectional.all(12),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.7),
                          borderRadius: BorderRadiusDirectional.circular(16)),
                      child: Text(messages[index],
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                    itemCount: messages.length,
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Future<void> pickTime() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour:selectedTimeNight.hour,
        minute: selectedTimeNight.minute,
      ),
      initialEntryMode: TimePickerEntryMode.dial,
      confirmText: 'تاكيد',
      cancelText: 'الغاء',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary,
              // Confirm button color
              onSurface: Colors.black,
              onBackground: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (timeOfDay != null && timeOfDay != selectedTimeNight)
      setState(() {
        selectedTimeNight = DateTime(
          selectedTimeNight.year, // Keep the same year
          selectedTimeNight.month, // Keep the same month
          selectedTimeNight.day, // Keep the same day
          timeOfDay.hour, // Set the new hour
          timeOfDay.minute, // Set the new minute
        );
      });
    await HiveService.saveTime('nightSelectedTime', selectedTimeNight);
  }
}
