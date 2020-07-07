import 'package:flutter/material.dart';
import 'package:myapp/pages/schedule_confirmed_details.dart';
import 'package:myapp/pages/schedule_pending_details.dart';

class DaySchedule extends StatefulWidget {
  @override
  _DaySchedule createState() => new _DaySchedule();
}

class _DaySchedule extends State<DaySchedule> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: new Text('Meus Compromissos',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: buildListView(),
          ),
        ));
  }

  buildListView() {
    return ListView.builder(
      itemCount: 13,
      itemBuilder: (context, index) {
        return CalendarEntry(
            time: index,
            isConfirmed: index.isEven,
            onTapEvent: () => openScheduleDetails(index.isEven));
      },
    );
  }

  openScheduleDetails(bool isConfirmed) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => !isConfirmed
              ? SchedulePendingDetails()
              : ScheduleConfirmedDetails()),
    );
  }
}

class CalendarEntry extends StatelessWidget {
  final int time;
  final bool isConfirmed;
  final Function onTapEvent;

  const CalendarEntry(
      {Key key, this.time, this.isConfirmed = false, this.onTapEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapEvent,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 40,
                child: Text("${time + 8}:00"),
              ),
            ],
          ),
          Container(
            width: 330,
            height: 180,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: this.isConfirmed
                          ? Color(0xffa8d4e0)
                          : Color(0x00ffffff),
                      border: Border.all(
                        color: Color(0xffA8D4E0),
                        width: 1,
                      )),
                  //color: Color(0xffA8D4E0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ScheduleLine(
                          "Cássio",
                          isConfirmed: isConfirmed,
                        ),
                        ScheduleLine(
                          "Vacina Raiva",
                          isConfirmed: isConfirmed,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_on,
                                  color: isConfirmed
                                      ? Color(0xff000000)
                                      : Color(0xffa8d4e0),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ScheduleLine(
                                    "Barão de Campos Gerais, 416",
                                    isConfirmed: isConfirmed,
                                  ),
                                  ScheduleLine(
                                    "Real Parque",
                                    isConfirmed: isConfirmed,
                                  ),
                                  ScheduleLine(
                                    "São Paulo",
                                    isConfirmed: isConfirmed,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleLine extends StatelessWidget {
  final String text;

  final bool isConfirmed;

  const ScheduleLine(this.text, {Key key, this.isConfirmed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
                color: isConfirmed ? Color(0xff000000) : Color(0xffa8d4e0)),
          )),
    );
  }
}
