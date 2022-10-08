import 'package:hive/hive.dart';

class DateClass {
  DateTime today = DateTime.now();

  late DateTime lastdayofweekback;
  late DateTime firstdayofweeknow;
  late DateTime stcalday;
  late List<DateTime> dayscalendar;
  late List<int> numbtaskcalend;
  late String dayHive;
  late int lengt;
  late Box box;

  DateClass() {
    dayscalendar = List.filled(42, DateTime.now());
    numbtaskcalend = List.filled(42, 0);
    init();
    getnumbTask();
  }

  List<DateTime> initRefresh(int year, int month) {
    lastdayofweekback = DateTime(year, month, 0);
    firstdayofweeknow = DateTime(year, month, 1);
    stcalday = DateTime(lastdayofweekback.year, lastdayofweekback.month,
        (lastdayofweekback.day - (lastdayofweekback.weekday - 1)), 23);
    for (var i = 0; i < 42; i++) {
      dayscalendar[i] = (stcalday.add(Duration(days: i)));
    }
    getnumbTask();
    return (dayscalendar);
  }

  void getnumbTask() {
    box = Hive.box('boxCalend');
    for (var i = 0; i < 42; i++) {
      lengt = 0;
      dayHive =
          '${(stcalday.add(Duration(days: i))).day}_${(stcalday.add(Duration(days: i))).month}_${(stcalday.add(Duration(days: i))).year}';
      box.get(dayHive) != null ? lengt = box.get(dayHive).length : 0;
      numbtaskcalend[i] = lengt;
    }
  }

  void init() {
    lastdayofweekback = DateTime(today.year, today.month, 0);
    firstdayofweeknow = DateTime(today.year, today.month, 1);
    stcalday = DateTime(lastdayofweekback.year, lastdayofweekback.month,
        (lastdayofweekback.day - (lastdayofweekback.weekday - 1)), 23);
    for (var i = 0; i < 42; i++) {
      dayscalendar[i] = (stcalday.add(Duration(days: i)));
    }
  }
}
