import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String organiser_name;
  final String organiser_icon;
  final String venue_name;
  final String venue_city;
  final String venue_country;
  final String date_time;

  EventDetailsScreen({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.organiser_name,
    required this.organiser_icon,
    required this.venue_name,
    required this.venue_city,
    required this.venue_country,
    required this.date_time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(color: Colors.black54),
        title: Text('Event Details',style: TextStyle(color: Colors.black54)),
        actions: [
          IconButton(
              onPressed: () {
             
              },
              icon: Icon(Icons.bookmark_border, color: Colors.black54))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Book Now'),
            ),
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(organiser_icon),
                          radius: 10,
                        ),
                        SizedBox(width: 5),
                        Text(
                          organiser_name,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.blue, size: 20),
                        SizedBox(width: 5),
                        Text(
                          date_time,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blue, size: 20),
                        SizedBox(width: 5),
                        Text(
                          '$venue_name, $venue_city, $venue_country',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'About Event',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
