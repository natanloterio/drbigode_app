import 'package:flutter/material.dart';
import 'package:myapp/pages/schedule_details.dart';

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
        return GestureDetector(
            onTap: () => openScheduleDetails(), child: CalendarEntry());
      },
    );
  }

  openScheduleDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScheduleDetails()),
    );
  }
}

class CalendarEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              child: Text("9:00"),
            ),
          ],
        ),
        Container(
          width: 330,
          height: 200,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: Color(0xffA8D4E0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ScheduleLine("Cássio"),
                      ScheduleLine("Vacina Raiva"),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.location_on),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ScheduleLine("Barão de Campos Gerais, 416"),
                                ScheduleLine("Real Parque"),
                                ScheduleLine("São Paulo"),
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
    );
  }
}

class ScheduleLine extends StatelessWidget {
  final String text;

  const ScheduleLine(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
      child: Align(alignment: Alignment.centerLeft, child: Text(text)),
    );
  }
}
