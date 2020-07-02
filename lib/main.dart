import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: new Text('Minha Agenda',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        drawer: new Drawer(
            child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text('Header'),
            ),
            new ListTile(
              title: new Text('First Menu Item'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Second Menu Item'),
              onTap: () {},
            ),
            new Divider(),
            new ListTile(
              title: new Text('About'),
              onTap: () {},
            ),
          ],
        )),
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
        return CalendarEntry();
      },
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
              //color: Color.fromARGB(255, 10, 010, 10),
              width: 95,
              child: Center(
                child: Text(
                  "Seg",
                  style: TextStyle(
                      color: Color.fromARGB(255, 120, 124, 132), fontSize: 31),
                ),
              ),
            ),
            Container(
              //color: Color.fromARGB(255, 10, 010, 10),
              width: 95,
              child: Text(
                "10",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 70),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 80,
              width: 200,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "4 visitas",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 29),
                ),
              ),
            ),
            Container(
              height: 20,
              width: 200,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Total R\$ 600,00",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
