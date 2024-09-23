import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MapShapeSource _dataSource;
  late List<MapModel> _mapData;

  @override
  void initState() {
    _mapData = _getMapData();
    _dataSource = MapShapeSource.asset(
      'assets/philippines.json',
      shapeDataField: 'adm1_en',
      dataCount: _mapData.length,
      primaryValueMapper: (int index) => _mapData[index].state,
      dataLabelMapper: (int index) => _mapData[index].stateCode,
      shapeColorValueMapper: (int index) => _mapData[index].color,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0,50, 0, 0),
            child: Text(
              'Philippine Map',
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: SfMaps(
                layers: [
                  MapShapeLayer(
                    source: _dataSource,
                    showDataLabels: true,
                  ),
                ],
              ),
            ),
          )
        ],
        )
    );
  }
  static List<MapModel> _getMapData(){
    return <MapModel>[
      MapModel('Region I (Ilocos Region)', '', Color(0xFF0087D1)),
      MapModel('Cordillera Administrative Region (CAR)', '', Color(0xFF38cfe0)),
      MapModel('Region II (Cagayan Valley)', '', Color(0xFF356ec8)),
      MapModel('Region III (Central Luzon)', '', Color(0xFF092e72)),
      MapModel('National Capital Region (NCR)', '', Color(0xFF6fafc4)),
      MapModel('Region IV-A (CALABARZON)', '', Color(0xFF2374a8)),
      MapModel('Region V (Bicol Region)', '', Color(0xFF2677a6)),
      MapModel('MIMAROPA Region', '', Color(0xFF17336a)),
      MapModel('Region VI (Western Visayas)', '', Color(0xFF2375a7)),
      MapModel('Region VII (Central Visayas)', '', Color(0xFF053171)),
      MapModel('Region VIII (Eastern Visayas)', '', Color(0xFF00A9E0)),
      MapModel('Region IX (Zamboanga Peninsula)', '', Color(0xFF092e72)),
      MapModel('Region X (Northern Mindanao)', '', Color(0xFF4da2e5)),
      MapModel('Region XI (Davao Region)', '', Color(0xFF00A9E0)),
      MapModel('Region XII (SOCCSKSARGEN)', '', Color(0xFF2375a7)),
      MapModel('Region XIII (Caraga)', '', Color(0xFF1d79ab)),
      MapModel('Bangsamoro Autonomous Region In Muslim Mindanao (BARMM)', '', Color(0xFF2ed4e2)),
    ];
  }
}

class MapModel {
  MapModel(this.state, this.stateCode, this.color);
  String state;
  String stateCode;
  Color color;
}