import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'buttons/legend_popup.dart';

// Region-I
import 'provinces/region-i/ilocos_norte.dart';
import 'provinces/region-i/ilocos_sur.dart';
import 'provinces/region-i/la_union.dart';
import 'provinces/region-i/pangasinan.dart';

// CAR
import 'provinces/car/abra.dart';
import 'provinces/car/apayao.dart';
import 'provinces/car/benguet.dart';
import 'provinces/car/ifugao.dart';
import 'provinces/car/kalinga.dart';
import 'provinces/car/mountain_province.dart';

// Region II
import 'provinces/region-ii/batanes.dart';
import 'provinces/region-ii/cagayan.dart';
import 'provinces/region-ii/isabela.dart';
import 'provinces/region-ii/nueva_vizcaya.dart';
import 'provinces/region-ii/quirino.dart';

// Region III
import 'provinces/region-iii/aurora.dart';
import 'provinces/region-iii/bataan.dart';
import 'provinces/region-iii/bulacan.dart';
import 'provinces/region-iii/nueva_ecija.dart';
import 'provinces/region-iii/pampanga.dart';
import 'provinces/region-iii/tarlac.dart';
import 'provinces/region-iii/zambales.dart';

// NCR
import 'provinces/ncr/ncr.dart';

// Region IV
import 'provinces/region-iv/batangas.dart';
import 'provinces/region-iv/cavite.dart';
import 'provinces/region-iv/laguna.dart';
import 'provinces/region-iv/quezon.dart';
import 'provinces/region-iv/rizal.dart';

// Region V
import 'provinces/region-v/albay.dart';
import 'provinces/region-v/camarines_norte.dart';
import 'provinces/region-v/camarines_sur.dart';
import 'provinces/region-v/catanduanes.dart';
import 'provinces/region-v/masbate.dart';
import 'provinces/region-v/sorsogon.dart';

// Mimaropa
import 'provinces/mimaropa/marinduque.dart';
import 'provinces/mimaropa/occidental_mindoro.dart';
import 'provinces/mimaropa/oriental_mindoro.dart';
import 'provinces/mimaropa/palawan.dart';
import 'provinces/mimaropa/romblon.dart';

// Region VI
import 'provinces/region-vi/aklan.dart';
import 'provinces/region-vi/antique.dart';
import 'provinces/region-vi/capiz.dart';
import 'provinces/region-vi/guimaras.dart';
import 'provinces/region-vi/iloilo.dart';
import 'provinces/region-vi/negros_occidental.dart';

// Region VII
import 'provinces/region-vii/bohol.dart';
import 'provinces/region-vii/cebu.dart';
import 'provinces/region-vii/negros_oriental.dart';
import 'provinces/region-vii/siquijor.dart';

// Regin VIII
import 'provinces/region-viii/biliran.dart';
import 'provinces/region-viii/eastern_samar.dart';
import 'provinces/region-viii/leyte.dart';
import 'provinces/region-viii/northern_samar.dart';
import 'provinces/region-viii/samar.dart';
import 'provinces/region-viii/southern_leyte.dart';

// Region IX
import 'provinces/region-ix/zamboanga_del_norte.dart';
import 'provinces/region-ix/zamboanga_del_sur.dart';
import 'provinces/region-ix/zamboanga_sibugay.dart';

// Region-X
import 'provinces/region-x/bukidnon.dart';
import 'provinces/region-x/camiguin.dart';
import 'provinces/region-x/lanao_del_norte.dart';
import 'provinces/region-x/misamis_occidental.dart';
import 'provinces/region-x/misamis_oriental.dart';

// Region XI
import 'provinces/region-xi/davao_de_oro.dart';
import 'provinces/region-xi/davao_del_norte.dart';
import 'provinces/region-xi/davao_del_sur.dart';
import 'provinces/region-xi/davao_occidental.dart';
import 'provinces/region-xi/davao_oriental.dart';

// Region XII
import 'provinces/region-xii/cotabato.dart';
import 'provinces/region-xii/sarangani.dart';
import 'provinces/region-xii/south_cotabato.dart';
import 'provinces/region-xii/sultan_kudarat.dart';

// Region XIII
import 'provinces/region-xiii/agusan_del_norte.dart';
import 'provinces/region-xiii/agusan_del_sur.dart';
import 'provinces/region-xiii/dinagat_islands.dart';
import 'provinces/region-xiii/surigao_del_norte.dart';
import 'provinces/region-xiii/surigao_del_sur.dart';

// BARMM
import 'provinces/barmm/basilan.dart';
import 'provinces/barmm/lanao_del_sur.dart';
import 'provinces/barmm/maguindanao.dart';
import 'provinces/barmm/sulu.dart';
import 'provinces/barmm/tawi_tawi.dart';

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
  late MapZoomPanBehavior _zoomPanBehavior;

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

  // Define your legend items
  final legendItems = [
    LegendItem(color: Color(0xFF0087D1), text: 'Region I'),
    LegendItem(color: Color(0xFF356ec8), text: 'Region II'),
    LegendItem(color: Color(0xFF092e72), text: 'Region III'),
    LegendItem(color: Color(0xFF2374a8), text: 'Region IV'),
    LegendItem(color: Color(0xFF2677a6), text: 'Region V'),
    LegendItem(color: Color(0xFF2375a7), text: 'Region VI'),
    LegendItem(color: Color(0xFF053171), text: 'Region VII'),
    LegendItem(color: Color(0xFF00A9E0), text: 'Region VIII'),
    LegendItem(color: Color(0xFF092e72), text: 'Region IX'),
    LegendItem(color: Color(0xFF4da2e5), text: 'Region X'),
    LegendItem(color: Color(0xFF00A9E0), text: 'Region XI'),
    LegendItem(color: Color(0xFF2375a7), text: 'Region XII'),
    LegendItem(color: Color(0xFF1d79ab), text: 'Region XIII'),
    LegendItem(color: Color(0xFF38cfe0), text: 'Cordillera Administrative Region'),
    LegendItem(color: Color(0xFF6fafc4), text: 'National Capital Region'),
    LegendItem(color: Color(0xFF17336a), text: 'MIMAROPA Region'),
    LegendItem(color: Color(0xFF2ed4e2), text: 'Bangsamoro Autonomous Region In Muslim Mindanao'),
  ];

  // Function to show the custom popup menu at a fixed position
  void _showCustomPopupMenu(BuildContext context) async {
    // Define a fixed position for the popup menu
    double fixedXPosition = 80; // Change this value to set the desired horizontal position
    double fixedYPosition = 80;   // Change this value to set the desired vertical position

    await showMenu(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(
        fixedXPosition,
        fixedYPosition,
        fixedXPosition,
        fixedYPosition,
      ),
      items: [
        PopupMenuItem(
          child: Container(
            height: 500, // Adjust this value to set the total height of the popup menu
            width: 200, // Adjust the width to fit the text
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align the items to the start
                children: [
                  // Center the title
                  Center(
                    child: Text(
                      'Map Legend',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black, // Color of the divider
                    thickness: 1, // Thickness of the line
                  ),
                  // Generate the legend items dynamically
                  Column(
                    children: legendItems.map((item) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0), // Add some vertical padding
                        height: 50, // Set individual item height
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 15, // Width of the color box
                              height: 15, // Height of the color box
                              color: item.color, // Show the legend color box
                              margin: EdgeInsets.only(right: 12),
                            ),
                            Expanded(
                              child: Text(
                                item.text, // Show the legend text
                                overflow: TextOverflow.ellipsis, // Handle text overflow if it's too long
                                style: TextStyle(fontSize: 14), // Adjust text size
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

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

    _zoomPanBehavior = MapZoomPanBehavior(
      maxZoomLevel: 4.5, // Adjust the zoom level for the map
    );
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
      body: Stack(
        children: <Widget>[
          // Background Image covering the entire screen
          Image.asset(
            'assets/background/BG-11.png', // Path to your background image
            fit: BoxFit.cover,             // Makes the image cover the entire background
            width: double.infinity,        // Ensure image covers the width of the screen
            height: double.infinity,       // Ensure image covers the height of the screen
          ),

          // Legend Button
          Positioned(
            top: 30,
            left: 30, // Position your legend button
            child: GestureDetector(
              onTapDown: (details) {
                //_showCustomPopupMenu(context, details.globalPosition);
                _showCustomPopupMenu(context);
              },
              child: Container(
                width: 50,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    // Define your button action here
                    //_showCustomPopupMenu(context, Offset(100, 70)); // Example offset for the popup
                    _showCustomPopupMenu(context);
                  }, // Handled by GestureDetector
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Set background color to blue
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // Optional: Customize the shape
                    ),
                  ),
                  child: Text(
                    'i', // Button text
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ),


          // Philippines Maps and Other Widgets
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Column(
              children: <Widget>[
                // The entire top container and row of logos should be inside a Stack or Container, not Positioned
                Center(
                  child: Container(
                    width: 300,
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.1),
                    padding: EdgeInsets.all(0),
                    child: Stack(
                      children: [
                        Container(
                          width: 300,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF99cc33),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0, -12),
                              child: Image.asset(
                                'assets/logo/DOST_Logo.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFF99cc33),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xFF99cc33), width: 2),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/logo/2024-NSTW-BLK-09.png',
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, -12),
                              child: Image.asset(
                                'assets/logo/bagong-pilipnas-logo.png',
                                width: 55,
                                height: 55,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: SfMaps(
                        layers: [
                          MapShapeLayer(
                            source: _dataSource,
                            zoomPanBehavior: _zoomPanBehavior,
                            showDataLabels: true,
                            initialMarkersCount: 17,
                            markerBuilder: (BuildContext context, int index) {
                              return MapMarker(
                                latitude: _markerData[index].latitude,
                                longitude: _markerData[index].longitude,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_markerData[index].country == 'Region X (Northern Mindanao)') {
                                      _showProvinceDialog(context, 'Region X', region10Provinces);
                                    } else if (_markerData[index].country == 'Region XI (Davao Region)') {
                                      _showProvinceDialog(context, 'Region XI', region11Provinces);
                                    }else if(_markerData[index].country == 'Region IX (Zamboanga Peninsula)') {
                                      _showProvinceDialog(context, 'Region IX', region9Provinces);
                                    }else if(_markerData[index].country == 'Region XII (SOCCSKSARGEN)') {
                                      _showProvinceDialog(context, 'Region XII', region12Provinces);
                                    } else if(_markerData[index].country == 'Region XIII (Caraga)') {
                                      _showProvinceDialog(context, 'Region XIII', region13Provinces);
                                    } else if(_markerData[index].country == 'Bangsamoro Autonomous Region In Muslim Mindanao (BARMM)') {
                                      _showProvinceDialog(context, 'Bangsamoro Autonomous Region In Muslim Mindanao', barmmProvinces);
                                    } else if(_markerData[index].country == 'Region VIII (Eastern Visayas)') {
                                      _showProvinceDialog(context, 'Region VIII', region8Provinces);
                                    } else if(_markerData[index].country == 'Region VII (Central Visayas)') {
                                      _showProvinceDialog(context, 'Region VII', region7Provinces);
                                    } else if(_markerData[index].country == 'Region VI (Western Visayas)') {
                                      _showProvinceDialog(context, 'Region VI', region6Provinces);
                                    } else if(_markerData[index].country == 'MIMAROPA Region') {
                                      _showProvinceDialog(context, 'MIMAROPA Region', mimaropaProvinces);
                                    } else if(_markerData[index].country == 'Region V (Bicol Region)') {
                                      _showProvinceDialog(context, 'Region V', region5Provinces);
                                    } else if(_markerData[index].country == 'Region IV-A (CALABARZON)') {
                                      _showProvinceDialog(context, 'Region IV', region4Provinces);
                                    } else if(_markerData[index].country == 'National Capital Region (NCR)') {
                                      _showProvinceDialog(context, 'National Capital Region', ncrProvinces);
                                    } else if(_markerData[index].country == 'Region III (Central Luzon)') {
                                      _showProvinceDialog(context, 'Region III', region3Provinces);
                                    } else if(_markerData[index].country == 'Region II (Cagayan Valley)') {
                                      _showProvinceDialog(context, 'Region II', region2Provinces);
                                    } else if(_markerData[index].country == 'Cordillera Administrative Region (CAR)') {
                                      _showProvinceDialog(context, 'Cordillera Administrative Region', carProvinces);
                                    } else if(_markerData[index].country == 'Region I (Ilocos Region)') {
                                      _showProvinceDialog(context, 'Region I', region1Provinces);
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
                                    //size: 24,
                                  ),
                                ),
                              );
                            },
                          ),
                        ]),
                  )

                ),

                // Footer Container
                Container(
                  width: 800,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF99cc33),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Title Page',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          backgroundColor: const Color(0xFFFAFAFA), // Set the dialog background color to #FAFAFA
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Aligns the region name to the center
            children: [
              Center(
                child: Text(regionName), // Centered region name
              ),
              const SizedBox(height: 8), // Add some spacing
              const Divider(
                thickness: 2,    // Set the thickness of the divider
                color: Colors.black, // Set the divider color to black
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: provinces.map((province) {
              return Column(
                children: [
                  SizedBox(
                    width: 200,  // Set a fixed width
                    height: 50,  // Set a fixed height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, // Set button text color to black
                        backgroundColor: Colors.white, // Set button background color to white
                        shadowColor: Colors.black, // Set shadow color to black
                        elevation: 5, // Set the elevation for shadow effect
                        shape: RoundedRectangleBorder( // Adjust round corners
                          borderRadius: BorderRadius.circular(20), // Set the radius for rounded corners
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog

                        // Navigate to a specific page based on the province name

                        if (province == 'Ilocos Norte') { // Region I
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IlocosNortePage()),
                          );
                        } else if (province == 'Ilocos Sur') { // Region I
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IlocosSurPage()),
                          );
                        } else if (province == 'La Union') { // Region I
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LaUnionPage()),
                          );
                        } else if (province == 'Pangasinan') { // Region I
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PangasinanPage()),
                          );
                        } else if (province == 'Abra') { // CAR
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AbraPage()),
                          );
                        } else if (province == 'Apayao') { // CAR
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ApayaoPage()),
                          );
                        } else if (province == 'Benguet') { // CAR
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BenguetPage()),
                          );
                        } else if (province == 'Ifugao') { // CAR
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IfugaoPage()),
                          );
                        } else if (province == 'Kalinga') { // CAR
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => KalingaPage()),
                          );
                        } else if (province == 'Mountain Province') { // CAR
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MountainProvincePage()),
                          );
                        } else if (province == 'Batanes') { // Region II
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BatanesPage()),
                          );
                        } else if (province == 'Cagayan') { // Region II
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CagayanPage()),
                          );
                        } else if (province == 'Isabela') { // Region II
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IsabelaPage()),
                          );
                        } else if (province == 'Nueva Vizcaya') { // Region II
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NuevaVizcayaPage()),
                          );
                        } else if (province == 'Quirino') { // Region II
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuirinoPage()),
                          );
                        } else if (province == 'Aurora') { // Region III
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AuroraPage()),
                          );
                        } else if (province == 'Bataan') { // Region III
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BataanPage()),
                          );
                        } else if (province == 'Bulacan') { // Region III
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BulacanPage()),
                          );
                        } else if (province == 'Nueva Ecija') { // Region III
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NuevaEcijaPage()),
                          );
                        } else if (province == 'Pampanga') { // Region III
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PampangaPage()),
                          );
                        } else if (province == 'Tarlac') { // Region III
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TarlacPage()),
                          );
                        } else if (province == 'Zambales') { // Region III
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ZambalesPage()),
                          );
                        } else if (province == 'NCR') { // NCR
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NCRPage()),
                          );
                        } else if (province == 'Batangas') { // Region IV
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BatangasPage()),
                          );
                        } else if (province == 'Cavite') { // Region IV
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CavitePage()),
                          );
                        } else if (province == 'Laguna') { // Region IV
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LagunaPage()),
                          );
                        } else if (province == 'Quezon') { // Region IV
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuezonPage()),
                          );
                        } else if (province == 'Rizal') { // Region IV
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RizalPage()),
                          );
                        } else if (province == 'Albay') { // Region V
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AlbayPage()),
                          );
                        } else if (province == 'Camarines Norte') { // Region V
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CamarinesNortePage()),
                          );
                        } else if (province == 'Camarines Sur') { // Region V
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CamarinesSurPage()),
                          );
                        } else if (province == 'Catanduanes') { // Region V
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CatanduanesPage()),
                          );
                        } else if (province == 'Masbate') { // Region V
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MasbatePage()),
                          );
                        } else if (province == 'Sorsogon') { // Region V
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SorsogonPage()),
                          );
                        } else if (province == 'Marinduque') { // Mimaropa
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MarinduquePage()),
                          );
                        } else if (province == 'Occidental Mindoro') { // Mimaropa
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OccidentalMindoroPage()),
                          );
                        } else if (province == 'Oriental Mindoro') { // Mimaropa
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OrientalMindoroPage()),
                          );
                        } else if (province == 'Palawan') { // Mimaropa
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PalawanPage()),
                          );
                        } else if (province == 'Romblon') { // Mimaropa
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RomblonPage()),
                          );
                        } else if (province == 'Aklan') { // Region VI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AklanPage()),
                          );
                        } else if (province == 'Antique') { // Region VI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AntiquePage()),
                          );
                        } else if (province == 'Capiz') { // Region VI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CapizPage()),
                          );
                        } else if (province == 'Guimaras') { // Region VI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GuimarasPage()),
                          );
                        } else if (province == 'Iloilo') { // Region VI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IloiloPage()),
                          );
                        } else if (province == 'Negros Occidental') { // Region VI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NegrosOccidentalPage()),
                          );
                        } else if (province == 'Bohol') { // Region VII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BoholPage()),
                          );
                        } else if (province == 'Cebu') { // Region VII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CebuPage()),
                          );
                        } else if (province == 'Negros Oriental') { // Region VII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NegrosOrientalPage()),
                          );
                        } else if (province == 'Siquijor') { // Region VII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SiquijorPage()),
                          );
                        } else if (province == 'Biliran') { // Region VIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BiliranPage()),
                          );
                        } else if (province == 'Eastern Samar') { // Region VIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EasternSamarPage()),
                          );
                        } else if (province == 'Leyte') { // Region VIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LeytePage()),
                          );
                        } else if (province == 'Northern Samar') { // Region VIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NorthernSamarPage()),
                          );
                        } else if (province == 'Samar') { // Region VIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SamarPage()),
                          );
                        } else if (province == 'Southern Leyte') { // Region VIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SouthernLeytePage()),
                          );
                        } else if (province == 'Zamboanga del Norte') { // Region IX
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ZamboangaDelNortePage()),
                          );
                        } else if (province == 'Zamboanga del Sur') { // Region IX
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ZamboangaDelSurPage()),
                          );
                        } else if (province == 'Zamboanga Sibugay') { // Region IX
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ZamboangaSibugayPage()),
                          );
                        } else if (province == 'Lanao del Norte') { // Region X
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LanaoDelNortePage()),
                          );
                        } else if (province == 'Bukidnon') { // Region X
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BukidnonPage()),
                          );
                        } else if (province == 'Camiguin') { // Region X
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CamiguinPage()),
                          );
                        } else if (province == 'Misamis Occidental') { // Region X
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MisamisOccidentalPage()),
                          );
                        } else if (province == 'Misamis Oriental') { // Region X
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MisamisOrientalPage()),
                          );
                        } else if (province == 'Davao de Oro (Compostela Valley)') { // Region XI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DavaoDeOroPage()),
                          );
                        } else if (province == 'Davao del Norte') { // Region XI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DavaoDelNortePage()),
                          );
                        } else if (province == 'Davao del Sur') { // Region XI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DavaoDelSurPage()),
                          );
                        } else if (province == 'Davao Occidental') { // Region XI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DavaoOccidentalPage()),
                          );
                        } else if (province == 'Davao Oriental') { // Region XI
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DavaoOrientalPage()),
                          );
                        } else if (province == 'Cotabato') { // Region XII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CotabatoPage()),
                          );
                        } else if (province == 'Sarangani') { // Region XII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SaranganiPage()),
                          );
                        } else if (province == 'South Cotabato') { // Region XII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SouthCotabatoPage()),
                          );
                        } else if (province == 'Sultan Kudarat') { // Region XII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SultanKudaratPage()),
                          );
                        } else if (province == 'Agusan del Norte') { // Region XIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AgusanDelNortePage()),
                          );
                        } else if (province == 'Agusan del Sur') { // Region XIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AgusanDelSurPage()),
                          );
                        } else if (province == 'Dinagat Islands') { // Region XIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DinagatIslandsPage()),
                          );
                        } else if (province == 'Surigao del Norte') { // Region XIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SurigaoDelNortePage()),
                          );
                        } else if (province == 'Surigao del Sur') { // Region XIII
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SurigaoDelSurPage()),
                          );
                        } else if (province == 'Basilan') { // BARMM
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BasilanPage()),
                          );
                        } else if (province == 'Lanao del Sur') { // BARMM
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LanaoDelSurPage()),
                          );
                        } else if (province == 'Maguindanao') { // BARMM
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MaguindanaoPage()),
                          );
                        } else if (province == 'Sulu') { // BARMM
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SuluPage()),
                          );
                        } else if (province == 'Tawi‑Tawi') { // BARMM
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TawiTawiPage()),
                          );
                        }


                      },
                      child: Text(province),
                    ),
                  ),
                  const SizedBox(height: 10), // Add space between buttons
                ],
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // Set the "Close" button text color to black
              ),
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
