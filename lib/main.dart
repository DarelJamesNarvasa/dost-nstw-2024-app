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
  late List<MarkerModel> _markerData;

  // Define provinces for each region
  final List<String> region1Provinces = [
    'Ilocos Norte',
    'Ilocos Sur',
    'La Union',
    'Pangasinan',
  ];

  final List<String> carProvinces = [
    'Abra',
    'Apayao',
    'Benguet',
    'Ifugao',
    'Kalinga',
    'Mountain Province'
  ];

  final List<String> region2Provinces = [
    'Batanes',
    'Cagayan',
    'Isabela',
    'Nueva Vizcaya',
    'Quirino',
  ];

  final List<String> region3Provinces = [
    'Aurora',
    'Bataan',
    'Bulacan',
    'Nueva Ecija',
    'Pampanga',
    'Tarlac',
    'Zambales'
  ];

  final List<String> ncrProvinces = [
    'NCR'
  ];

  final List<String> region4Provinces = [
    'Batangas',
    'Cavite',
    'Laguna',
    'Quezon',
    'Rizal',
  ];

  final List<String> region5Provinces = [
    'Albay',
    'Camarines Norte',
    'Camarines Sur',
    'Catanduanes',
    'Masbate',
    'Sorsogon'
  ];

  final List<String> mimaropaProvinces = [
    'Marinduque',
    'Occidental Mindoro',
    'Oriental Mindoro',
    'Palawan',
    'Romblon',
  ];

  final List<String> region6Provinces = [
    'Aklan',
    'Antique',
    'Capiz',
    'Guimaras',
    'Iloilo',
    'Negros Occidental'
  ];

  final List<String> region7Provinces = [
    'Bohol',
    'Cebu',
    'Negros Oriental',
    'Siquijor',
  ];

  final List<String> region8Provinces = [
    'Biliran',
    'Eastern Samar',
    'Leyte',
    'Northern Samar',
    'Samar',
    'Southern Leyte',
  ];

  final List<String> region9Provinces = [
    'Zamboanga del Norte',
    'Zamboanga del Sur',
    'Zamboanga Sibugay',
  ];

  final List<String> region10Provinces = [
    'Bukidnon',
    'Camiguin',
    'Lanao del Norte',
    'Misamis Occidental',
    'Misamis Oriental'
  ];

  final List<String> region11Provinces = [
    'Davao de Oro (Compostela Valley)',
    'Davao del Norte',
    'Davao del Sur',
    'Davao Occidental',
    'Davao Oriental'
  ];

  final List<String> region12Provinces = [
    'Cotabato',
    'Sarangani',
    'South Cotabato',
    'Sultan Kudarat',
  ];

  final List<String> region13Provinces = [
    'Agusan del Norte',
    'Agusan del Sur',
    'Dinagat Islands',
    'Surigao del Norte',
    'Surigao del Sur'
  ];

  final List<String> barmmProvinces = [
    'Basilan',
    'Lanao del Sur',
    'Maguindanao',
    'Sulu',
    'Tawi‑Tawi'
  ];

  @override
  void initState() {
    _markerData = const <MarkerModel>[
      MarkerModel('Region I (Ilocos Region)', 18.3053757, 120.7710129),
      MarkerModel('Cordillera Administrative Region (CAR)', 17.2366341, 121.0908037),
      MarkerModel('Region II (Cagayan Valley)', 16.8391459, 122.0283238),
      MarkerModel('Region III (Central Luzon)', 15.740528, 121.0285336),
      MarkerModel('National Capital Region (NCR)', 14.777328, 121.0260313),
      MarkerModel('Region IV-A (CALABARZON)', 14.087152, 121.9049169),
      MarkerModel('Region V (Bicol Region)', 13.7597739, 123.41571),
      MarkerModel('MIMAROPA Region', 10.6305157, 119.3118561),
      MarkerModel('Region VI (Western Visayas)', 11.1306015, 122.503008),
      MarkerModel('Region VII (Central Visayas)', 9.9997346, 123.4868714),
      MarkerModel('Region VIII (Eastern Visayas)', 11.4110366, 124.9808384),
      MarkerModel('Region IX (Zamboanga Peninsula)', 7.8355014, 122.4708989),
      MarkerModel('Region X (Northern Mindanao)', 8.294969, 124.8560481),
      MarkerModel('Region XI (Davao Region)', 7.6509458, 125.8023345),
      MarkerModel('Region XII (SOCCSKSARGEN)', 6.4292329, 124.6540731),
      MarkerModel('Region XIII (Caraga)', 8.7126224, 125.7461284),
      MarkerModel('Bangsamoro Autonomous Region In Muslim Mindanao (BARMM)', 7.4136148, 124.3318986),
    ];

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
                  initialMarkersCount: 17,
                  /*
                    markerBuilder: (BuildContext context, int index) {
                      return MapMarker(
                        latitude: _markerData[index].latitude,
                        longitude: _markerData[index].longitude,
                        //iconColor: Colors.deepOrange,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                      );
                    },
                    */
                  markerBuilder: (BuildContext context, int index) {
                    return MapMarker(
                      latitude: _markerData[index].latitude,
                      longitude: _markerData[index].longitude,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_markerData[index].country == 'Region X (Northern Mindanao)') {
                            _showProvinceDialog(context, 'Region X (Northern Mindanao)', region10Provinces);
                          } else if (_markerData[index].country == 'Region XI (Davao Region)') {
                            _showProvinceDialog(context, 'Region XI (Davao Region)', region11Provinces);
                          }else if(_markerData[index].country == 'Region IX (Zamboanga Peninsula)') {
                            _showProvinceDialog(context, 'Region IX (Zamboanga Peninsula)', region9Provinces);
                          }else if(_markerData[index].country == 'Region XII (SOCCSKSARGEN)') {
                            _showProvinceDialog(context, 'Region XII (SOCCSKSARGEN)', region12Provinces);
                          } else if(_markerData[index].country == 'Region XIII (Caraga)') {
                            _showProvinceDialog(context, 'Region XIII (Caraga)', region13Provinces);
                          } else if(_markerData[index].country == 'Bangsamoro Autonomous Region In Muslim Mindanao (BARMM)') {
                            _showProvinceDialog(context, 'Bangsamoro Autonomous Region In Muslim Mindanao (BARMM)', barmmProvinces);
                          } else if(_markerData[index].country == 'Region VIII (Eastern Visayas)') {
                            _showProvinceDialog(context, 'Region VIII (Eastern Visayas)', region8Provinces);
                          } else if(_markerData[index].country == 'Region VII (Central Visayas)') {
                            _showProvinceDialog(context, 'Region VII (Central Visayas)', region7Provinces);
                          } else if(_markerData[index].country == 'Region VI (Western Visayas)') {
                            _showProvinceDialog(context, 'Region VI (Western Visayas)', region6Provinces);
                          } else if(_markerData[index].country == 'MIMAROPA Region') {
                            _showProvinceDialog(context, 'MIMAROPA Region', mimaropaProvinces);
                          } else if(_markerData[index].country == 'Region V (Bicol Region)') {
                            _showProvinceDialog(context, 'Region V (Bicol Region)', region5Provinces);
                          } else if(_markerData[index].country == 'Region IV-A (CALABARZON)') {
                            _showProvinceDialog(context, 'Region IV-A (CALABARZON)', region4Provinces);
                          } else if(_markerData[index].country == 'National Capital Region (NCR)') {
                            _showProvinceDialog(context, 'National Capital Region (NCR)', ncrProvinces);
                          } else if(_markerData[index].country == 'Region III (Central Luzon)') {
                            _showProvinceDialog(context, 'Region III (Central Luzon)', region3Provinces);
                          } else if(_markerData[index].country == 'Region II (Cagayan Valley)') {
                            _showProvinceDialog(context, 'Region II (Cagayan Valley)', region2Provinces);
                          } else if(_markerData[index].country == 'Cordillera Administrative Region (CAR)') {
                            _showProvinceDialog(context, 'Cordillera Administrative Region (CAR)', carProvinces);
                          } else if(_markerData[index].country == 'Region I (Ilocos Region)') {
                            _showProvinceDialog(context, 'Region I (Ilocos Region)', region1Provinces);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _markerData[index].country == 'Region X (Northern Mindanao)'
                              ? const Color(0xFF4da2e5)
                              : _markerData[index].country == 'Region XI (Davao Region)'
                              ? const Color(0xFF00A9E0)
                              : _markerData[index].country == 'Region IX (Zamboanga Peninsula)'
                              ? const Color(0xFF092e72)
                              : _markerData[index].country == 'Region XII (SOCCSKSARGEN)'
                              ? const Color(0xFF2375a7)
                              : _markerData[index].country == 'Region XIII (Caraga)'
                              ? const Color(0xFF1d79ab)
                              : _markerData[index].country == 'Bangsamoro Autonomous Region In Muslim Mindanao (BARMM)'
                              ? const Color(0xFF2ed4e2)
                              : _markerData[index].country == 'Region VIII (Eastern Visayas)'
                              ? const Color(0xFF00A9E0)
                              : _markerData[index].country == 'Region VII (Central Visayas)'
                              ? const Color(0xFF053171)
                              : _markerData[index].country == 'Region VI (Western Visayas)'
                              ? const Color(0xFF2375a7)
                              : _markerData[index].country == 'MIMAROPA Region'
                              ? const Color(0xFF17336a)
                              : _markerData[index].country == 'Region V (Bicol Region)'
                              ? const Color(0xFF2677a6)
                              : _markerData[index].country == 'Region IV-A (CALABARZON)'
                              ? const Color(0xFF2374a8)
                              : _markerData[index].country == 'National Capital Region (NCR)'
                              ? const Color(0xFF6fafc4)
                              : _markerData[index].country == 'Region III (Central Luzon)'
                              ? const Color(0xFF092e72)
                              : _markerData[index].country == 'Region II (Cagayan Valley)'
                              ? const Color(0xFF356ec8)
                              : _markerData[index].country == 'Cordillera Administrative Region (CAR)'
                              ? const Color(0xFF38cfe0)
                              : _markerData[index].country == 'Region I (Ilocos Region)'
                              ? Color(0xFF0087D1)
                              : const Color(0xFF4da2e5),  // Default color
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(0),  // Smaller padding for smaller button
                          minimumSize: const Size(0, 0),  // Reduce button size
                        ),
                        child: const Icon(
                          Icons.location_on,
                          //Icons.pin_drop,
                          color: Colors.white,
                          //color: Color(0xFF71b300),
                          size: 16,
                        ),
                      ),
                    );
                  },

                  /*
                    markerTooltipBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _showRegionDialog(context, _markerData[index].country);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: Text(
                            _markerData[index].country,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                    */


                ),
              ],
            ),
          ),
        )
      ],
      ),
    );
  }

  // Function to display a list of provinces for each region
  void _showProvinceDialog(BuildContext context, String regionName, List<String> provinces) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(regionName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: provinces.map((province) {
              return ElevatedButton(
                onPressed: () {
                  // Action for each province button
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You selected $province')),
                  );
                },
                child: Text(province),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Map Colors
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

class MarkerModel {
  const MarkerModel(this.country, this.latitude, this.longitude);
  final String country;
  final double latitude;
  final double longitude;
}