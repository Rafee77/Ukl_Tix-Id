import 'package:flutter/material.dart';

class Ticketview extends StatelessWidget {
  final List<Map<String, dynamic>> tickets = [
    {
      'title': 'Moanas',
      'image': 'assets/spot2.webp',
      'description': 'A magical adventure with Moana and her friends.',
      'rating': 4, 
    },
    {
      'title': 'Moanas',
      'image': 'assets/spot2.webp',
      'description': 'A magical adventure with Moana and her friends.',
      'rating': 5, 
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Cari Tiket',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 58, 206), 
                  border: Border.all(
                    color: Colors.yellow, 
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8.0), 
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: Image.asset(
                    ticket['image'],
                    width: 50,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    ticket['title'],
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket['description'], 
                        style: TextStyle(
                          color: Colors
                              .white70, 
                        ),
                      ),
                      SizedBox(
                          height: 4.0),
                      Row(
                        children: List.generate(
                          ticket[
                              'rating'], 
                          (index) => Icon(
                            Icons.star,
                            color: Colors.yellow, 
                            size: 16.0, 
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                  
                    print('Tapped on ${ticket['title']}');
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
