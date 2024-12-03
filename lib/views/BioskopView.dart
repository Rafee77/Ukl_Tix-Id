import 'package:flutter/material.dart';

class Bioskopview extends StatelessWidget {
  final List<Map<String, dynamic>> bioskops = [
    {
      'name': 'Cinepolis',
      'location': 'Jl. Jendral Sudirman No.1',
      'icon': Icons.local_movies,
    },
    {
      'name': 'XXI Mall',
      'location': 'Jl. Jendral Sudirman No.10',
      'icon': Icons.local_movies,
    },
    {
      'name': 'CGV Blitz',
      'location': 'Jl. Thamrin No.5',
      'icon': Icons.local_movies,
    },
    {
      'name': 'Bioskop 21',
      'location': 'Jl. Kebon Sirih No.7',
      'icon': Icons.local_movies,
    },
    // Add more bioskops as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Cari Bioskop',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        // Banner Section
        Container(
          height: 120, // Set the height of the banner
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/ss2.png'), // Replace with your banner image path
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
          ),
        ),
        SizedBox(height: 8), // Space between the banner and the list
        Expanded(
          child: ListView.builder(
            itemCount: bioskops.length,
            itemBuilder: (context, index) {
              final bioskop = bioskops[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 4.0, horizontal: 8.0), // Margin between items
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow), // Border color
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  color: Color.fromARGB(255, 4, 14, 207), // Background color
                ),
                child: ListTile(
                  leading: Icon(
                    bioskop['icon'],
                    color: Colors.yellow, // Set icon color to yellow
                  ),
                  title: Text(
                    bioskop['name'],
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
                      fontWeight: FontWeight.bold, // Set text to bold
                    ),
                  ),
                  subtitle: Text(
                    bioskop['location'],
                    style: TextStyle(
                      color: Colors.white, // Set subtitle text color to white
                      fontWeight: FontWeight.bold, // Set subtitle text to bold
                    ),
                  ),
                  onTap: () {
                    // You can add functionality here when a bioskop is tapped
                    print('Tapped on ${bioskop['name']}');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
