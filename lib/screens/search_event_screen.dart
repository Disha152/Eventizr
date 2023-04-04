import 'package:flutter/material.dart';

class Search_events extends StatefulWidget {
  const Search_events({super.key});

  @override
  State<Search_events> createState() => _Search_eventsState();
}

class _Search_eventsState extends State<Search_events> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Type event here',
                prefixIcon: Icon(Icons.search, color: Colors.blue),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
