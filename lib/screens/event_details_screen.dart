import 'package:flutter/material.dart';

class Event_details extends StatefulWidget {
  const Event_details({super.key});

  @override
  State<Event_details> createState() => _Event_detailsState();
}

class _Event_detailsState extends State<Event_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(),
        title: Text('Event Details'),
        actions: [
          IconButton(
              onPressed: () {
                icon:
                Icon(Icons.bookmark);
              },
              icon: Icon(Icons.bookmark_border))
        ],
      ),
      body: Stack(
        children: [
          // Add your main content here
          Center(
            child: Text('Hello, world!'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  
                  onPressed: () {
                    // Do something when the button is pressed
                  },
                  child: Text('Book Now'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      
                    ),
                    backgroundColor: Colors.deepPurpleAccent
                  ),


                )),
          ),
        ],
      ),
    );
  }
}
