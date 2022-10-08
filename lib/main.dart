import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_manager/dateclass.dart';
import 'package:task_manager/dayui.dart';
import 'package:task_manager/konst.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('boxCalend');

  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: TaskManager(),
  ));
}

class TaskManager extends StatefulWidget {
  TaskManager({Key? key}) : super(key: key);

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  var time = DateTime.now();

  List listday = List.filled(42, DateTime);
  late List listtasks;
  DateClass datecs = DateClass();

  @override
  void initState() {
    super.initState();
    listday = datecs.dayscalendar;
    listtasks = datecs.numbtaskcalend;
  }

  @override
  Widget build(BuildContext context) {
    var appBartext = Text('${months[time.month]} ${time.year}');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              time = DateTime(time.year, time.month - 1, time.day);
              setState(() {
                appBartext = Text('${months[time.month]} ${time.year}');
                listday = datecs.initRefresh(time.year, time.month);
              });
            }),
        title: appBartext,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              time = DateTime(time.year, time.month + 1, time.day);
              setState(() {
                appBartext = Text('${months[time.month]} ${time.year}');
                datecs.initRefresh(time.year, time.month);
                listday = datecs.dayscalendar;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          //рядок із назвами днів згори
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusablaContainer(
                  cardContainer: Center(child: Text(daysUkr[0])),
                  colour: colorIconMain,
                ),
              ),
              Expanded(
                child: ReusablaContainer(
                  cardContainer: Center(child: Text(daysUkr[1])),
                  colour: colorIconMain,
                ),
              ),
              Expanded(
                child: ReusablaContainer(
                  cardContainer: Center(child: Text(daysUkr[2])),
                  colour: colorIconMain,
                ),
              ),
              Expanded(
                child: ReusablaContainer(
                  cardContainer: Center(child: Text(daysUkr[3])),
                  colour: colorIconMain,
                ),
              ),
              Expanded(
                child: ReusablaContainer(
                  cardContainer: Center(child: Text(daysUkr[4])),
                  colour: colorIconMain,
                ),
              ),
              Expanded(
                child: ReusablaContainer(
                  cardContainer: Center(child: Text(daysUkr[5])),
                  colour: colorIconMain,
                ),
              ),
              Expanded(
                child: ReusablaContainer(
                  cardContainer: Center(child: Text(daysUkr[6])),
                  colour: const Color(0xFF1D1E33),
                ),
              ),
            ],
          )),
          //рядок з першим тижднєм
          Expanded(
              child: Row(
            children: <Widget>[
              ItemTable(tday: listday[0], textnumberoftask: listtasks[0]),
              ItemTable(tday: listday[1], textnumberoftask: listtasks[1]),
              ItemTable(tday: listday[2], textnumberoftask: listtasks[2]),
              ItemTable(tday: listday[3], textnumberoftask: listtasks[3]),
              ItemTable(tday: listday[4], textnumberoftask: listtasks[4]),
              ItemTable(tday: listday[5], textnumberoftask: listtasks[5]),
              ItemTable(tday: listday[6], textnumberoftask: listtasks[6]),
            ],
          )),
          //рядок з другим тижднєм
          Expanded(
              child: Row(
            children: <Widget>[
              ItemTable(tday: listday[7], textnumberoftask: listtasks[7]),
              ItemTable(tday: listday[8], textnumberoftask: listtasks[8]),
              ItemTable(tday: listday[9], textnumberoftask: listtasks[9]),
              ItemTable(tday: listday[10], textnumberoftask: listtasks[10]),
              ItemTable(tday: listday[11], textnumberoftask: listtasks[11]),
              ItemTable(tday: listday[12], textnumberoftask: listtasks[12]),
              ItemTable(tday: listday[13], textnumberoftask: listtasks[13]),
            ],
          )),
          //рядок з третім тижднєм
          Expanded(
              child: Row(
            children: <Widget>[
              ItemTable(tday: listday[14], textnumberoftask: listtasks[14]),
              ItemTable(tday: listday[15], textnumberoftask: listtasks[15]),
              ItemTable(tday: listday[16], textnumberoftask: listtasks[16]),
              ItemTable(tday: listday[17], textnumberoftask: listtasks[17]),
              ItemTable(tday: listday[18], textnumberoftask: listtasks[18]),
              ItemTable(tday: listday[19], textnumberoftask: listtasks[19]),
              ItemTable(tday: listday[20], textnumberoftask: listtasks[20]),
            ],
          )),
          //рядок з четвертим тижднєм
          Expanded(
              child: Row(
            children: <Widget>[
              ItemTable(tday: listday[21], textnumberoftask: listtasks[21]),
              ItemTable(tday: listday[22], textnumberoftask: listtasks[22]),
              ItemTable(tday: listday[23], textnumberoftask: listtasks[23]),
              ItemTable(tday: listday[24], textnumberoftask: listtasks[24]),
              ItemTable(tday: listday[25], textnumberoftask: listtasks[25]),
              ItemTable(tday: listday[26], textnumberoftask: listtasks[26]),
              ItemTable(tday: listday[27], textnumberoftask: listtasks[27]),
            ],
          )),
          //рядок з пятим тижднєм
          Expanded(
              child: Row(
            children: <Widget>[
              ItemTable(tday: listday[28], textnumberoftask: listtasks[28]),
              ItemTable(tday: listday[29], textnumberoftask: listtasks[29]),
              ItemTable(tday: listday[30], textnumberoftask: listtasks[30]),
              ItemTable(tday: listday[31], textnumberoftask: listtasks[31]),
              ItemTable(tday: listday[32], textnumberoftask: listtasks[32]),
              ItemTable(tday: listday[33], textnumberoftask: listtasks[33]),
              ItemTable(tday: listday[34], textnumberoftask: listtasks[34]),
            ],
          )),
          //рядок з шостим тижднєм
          Expanded(
              child: Row(
            children: <Widget>[
              ItemTable(tday: listday[35], textnumberoftask: listtasks[35]),
              ItemTable(tday: listday[36], textnumberoftask: listtasks[36]),
              ItemTable(tday: listday[37], textnumberoftask: listtasks[37]),
              ItemTable(tday: listday[38], textnumberoftask: listtasks[38]),
              ItemTable(tday: listday[39], textnumberoftask: listtasks[39]),
              ItemTable(tday: listday[40], textnumberoftask: listtasks[40]),
              ItemTable(tday: listday[41], textnumberoftask: listtasks[41]),
            ],
          )),
        ],
      ),
    );
  }
}

class ItemTable extends StatefulWidget {
  final DateTime tday;
  int textnumberoftask;

  ItemTable({super.key, required this.tday, required this.textnumberoftask});

  @override
  State<ItemTable> createState() => _ItemTableState();
}

class _ItemTableState extends State<ItemTable> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          int val = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DayScreen(
                      time: widget.tday,
                    )),
          );
          if (val != widget.textnumberoftask) {
            setState(() {
              widget.textnumberoftask = val;
            });
          }
        },
        child: ReusablaContainer(
          colour: compareDate(widget.tday) ? colorIconNow : colorIcon,
          cardContainer: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: Text(
                    widget.tday.day.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        widget.textnumberoftask == 0
                            ? ''
                            : widget.textnumberoftask.toString(),
                        style: const TextStyle(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool compareDate(DateTime time) {
  bool result = false;
  DateTime now = DateTime.now();
  if (now.year == time.year && now.month == time.month && now.day == time.day) {
    result = true;
  }
  return result;
}

class ReusablaContainer extends StatelessWidget {
  final Color colour;
  final Widget cardContainer;

  const ReusablaContainer(
      {super.key, required this.colour, required this.cardContainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
      child: cardContainer,
    );
  }
}
