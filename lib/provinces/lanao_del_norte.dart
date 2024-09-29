import 'package:flutter/material.dart';
import 'package:flutter_maps/project-videos/region-x-lanaodel-norte-project-list/regionx_lanaodelnorte_project1.dart';
import 'package:flutter_maps/project-videos/region-x-lanaodel-norte-project-list/regionx_lanaodelnorte_project2.dart';

class LanaoDelNortePage extends StatefulWidget {
  @override
  _LanaoDelNortePageState createState() => _LanaoDelNortePageState();
}

class _LanaoDelNortePageState extends State<LanaoDelNortePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Set the height of the AppBar
        child: AppBar(
          backgroundColor: Color(0xFF99cc33),
          title: Center( // Center the title
            child: const Text(
              'Lanao del Norte',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding( // Add padding to the body
        padding: const EdgeInsets.symmetric(horizontal: 50.0), // Set horizontal padding
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align items at the top
            children: [
              const SizedBox(height: 20), // Space between app bar and the text
              Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: const Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 24, // You can adjust the font size as needed
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
              ),
              const SizedBox(height: 10), // Space between "Projects" text and buttons
              Expanded(
                child: ListView(
                  children: [
                    _projectButton('Project 1'),
                    const SizedBox(height: 10), // Space between buttons
                    _projectButton('Project 2'),
                    const SizedBox(height: 10), // Space between buttons
                    _projectButton('Project 3'),
                    const SizedBox(height: 10), // Space between buttons
                    _projectButton('Project 4'),
                    const SizedBox(height: 10), // Space between buttons
                    _projectButton('Project 5'),
                    const SizedBox(height: 10), // Space between buttons
                    _projectButton('Project 6'),
                    const SizedBox(height: 10), // Space between buttons
                    _projectButton('Project 7'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _projectButton(String projectName) {
    return Row(
      children: [
        Expanded(
          child: Material(
            elevation: 5, // Adjust the elevation to increase or decrease shadow
            borderRadius: BorderRadius.circular(20), // Match the button's border radius
            child: ElevatedButton(
              onPressed: () {
                // Navigate to a specific page based on the project name
                if (projectName == 'Project 1') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegionxLanaodelnorteProject1Page(videoPath: 'assets/videos/1_minute_DOST-X.mp4')),
                  );
                } else if (projectName == 'Project 2') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegionxLanaodelnorteProject2Page(videoPath: 'assets/videos/1_minute_DOST-X.mp4')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 90), // Set width and height of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Set rounded corners
                ),
                //backgroundColor: Color(0xFFFAFAFA), // Background color of the button
                backgroundColor: Colors.white,
                shadowColor: Colors.black.withOpacity(0.1), // Shadow color (optional)
              ),
              child: Align(
                alignment: Alignment.centerLeft, // Align text to the left inside the button
                child: Text(
                  projectName,
                  style: const TextStyle(
                    color: Colors.black, // Set text color to black
                    fontSize: 16, // Adjust the font size here
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