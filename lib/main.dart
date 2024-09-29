import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'buttons/legend_popup.dart';

import 'provinces/lanao_del_norte.dart';
import 'provinces/ilocos_norte.dart';

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
      maxZoomLevel: 2.5, // Adjust the zoom level for the map
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


          // Philippines Maps
          Positioned.fill(
            top: -170,
            child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: Column(
                children: <Widget>[
                  // Container for the images and circle at the top
                  Positioned(
                    //top: 0, // Adjust the top value as needed
                    left: MediaQuery.of(context).size.width / 2 - 150, // Center the container by calculating the position
                    child: Container(
                      width: 300, // Fixed width for the image container (box)
                      alignment: Alignment.center, // Centers the container horizontally
                      color: Colors.white.withOpacity(0.1), // Set background color for the box
                      padding: EdgeInsets.all(0), // Padding inside the box
                      child: Stack( // Use Stack to layer the blue rectangle behind other widgets
                        children: [
                          // Blue Rectangle Container inside the main container
                          Container(
                            width: 300, // Match the width of the main container
                            height: 80, // Adjust the height as needed
                            decoration: BoxDecoration(
                              //color: Colors.blue, // Set the background color to blue
                              color: Color(0xFF99cc33),
                              borderRadius: BorderRadius.only( // Specify which corners to round
                                bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
                                bottomRight: Radius.circular(20.0), // Adjust the radius as needed
                              ),
                            ),// Set the background color to blue
                          ),

                          // Row for the logos and circle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround, // Use spaceAround or spaceEvenly to evenly distribute space
                            children: <Widget>[
                              // First Image (DOST Logo on the left)
                              Transform.translate(
                                offset: Offset(0, -12), // Move the logo up by 5 pixels
                                child: Image.asset(
                                  'assets/logo/DOST_Logo.png',
                                  width: 50,
                                  height: 50, // Set size for the first image
                                ),
                              ),

                              // Circle in the middle with another logo inside
                              Container(
                                width: 120, // Adjust width of the circle if needed
                                height: 120, // Adjust height of the circle if needed
                                decoration: BoxDecoration(
                                  color: Color(0xFF99cc33), // Background color of the circle
                                  shape: BoxShape.circle, // Shape the container into a circle
                                  border: Border.all(color: Color(0xFF99cc33), width: 2), // Optional: Circle border
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/logo/2024-NSTW-BLK-09.png', // Path to the logo inside the circle
                                    width: 110,
                                    height: 110, // Set size for the image inside the circle
                                    fit: BoxFit.contain, // Ensures the image fits within the circle
                                  ),
                                ),
                              ),

                              // Second Image (Bagong Pilipinas Logo on the right)
                              Transform.translate(
                                offset: Offset(0, -12), // Move the logo up by 5 pixels
                                child: Image.asset(
                                  'assets/logo/bagong-pilipnas-logo.png', // Path to the second local image
                                  width: 55,
                                  height: 55, // Set size for the second image
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
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
                    ),
                    Container(
                      width: 800, // Full width of the screen
                      height: 50, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: Color(0xFF99cc33), // Background color for the new box
                        borderRadius: BorderRadius.only( // Specify which corners to round
                          topLeft: Radius.circular(50.0), // Adjust the radius as needed
                          topRight: Radius.circular(50.0), // Adjust the radius as needed
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Title Page', // Title Page
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
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
                        if (province == 'Lanao del Norte') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LanaoDelNortePage()),
                          );
                        } else if (province == 'Ilocos Norte') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IlocosNortePage()),
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
