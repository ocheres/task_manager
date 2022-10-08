import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_manager/konst.dart';

class DayScreen extends StatefulWidget {
  DateTime time;

  DayScreen({super.key, required this.time});

  @override
  State<DayScreen> createState() => _DayScreenState(time: time);
}

class _DayScreenState extends State<DayScreen> {
  DateTime time;

  late String dayHive;

  _DayScreenState({required this.time});

  List<String> hoursTask = <String>[];

  late TextEditingController _controller;
  late Box box;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    dayHive = '${time.day}_${time.month}_${time.year}';
    // print(dayHive);
    checkList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> checkList() async {
    box = await Hive.openBox('boxCalend');
    // box.clear();
    if (box.isEmpty) {
      // print('object');
    } else {
      // print(box.get(dayHive));
      setState(() {
        box.get(dayHive) != null ? hoursTask = box.get(dayHive) : hoursTask;
      });
    }
  }

  Future<void> addItemToList(String hour, String text) async {
    setState(() {
      if (text.isNotEmpty) {
        hoursTask.insert(0, '$hour $text');
        (hoursTask..sort()).reversed.toList();
      }
    });
  }

  String dropdownValue = '${DateTime.now().hour}:00';
  String task = '';

  Future showAlertDialog() => showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(dialogItem),
              actions: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(dialogQuest),
                        const SizedBox(
                          width: 10.0,
                        ),
                        DropdownButton(
                            value: dropdownValue,
                            items: hours.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            })
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Введіть завдання',
                        ),
                        onChanged: (value) {
                          task = value;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Відмінити'),
                        ),
                        TextButton(
                            onPressed: () {
                              _controller.clear();
                              addItemToList(dropdownValue, task);
                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('Додати')),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                box.put(dayHive, hoursTask);
                Navigator.pop(context, hoursTask.length);
              }),
          title: Text(
              '${widget.time.day} ${monthsp[widget.time.month]} ${widget.time.year} року'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: hoursTask.length,
                    itemBuilder: (BuildContext context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            hoursTask.removeAt(index);
                          });
                        },
                        background: Container(color: Colors.red),
                        child: ListTile(
                          title: Text(hoursTask[index]),
                        ),
                      );
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorIconNow,
          onPressed: () {
            showAlertDialog();
          },
          child: const Icon(
            Icons.add,
            color: colorIconMain,
          ),
        ));
  }
}
