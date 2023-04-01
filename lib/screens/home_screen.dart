



import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> conferenceList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        setState(() {
          conferenceList = List<Data>.from(
            data['content']['data'].map((item) => Data.fromJson(item)),
          );
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'search');
                },
                icon: Icon(
                  Icons.search_sharp,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Events',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: conferenceList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: conferenceList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                conferenceList[index].title ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                conferenceList[index].description ?? "",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class Conference {
  List<Data> data;
  bool status;

  Conference({required this.data, required this.status});

  factory Conference.fromJson(Map<String, dynamic> json) {
    return Conference(
      data:
          List<Data>.from(json['content']['data'].map((x) => Data.fromJson(x))),
      status: json['status'],
    );
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? bannerImage;
  String? dateTime;
  String? organiserName;
  String? organiserIcon;
  String? venueName;
  String? venueCity;
  String? venueCountry;

  Data({
    this.id,
    this.title,
    this.description,
    this.bannerImage,
    this.dateTime,
    this.organiserName,
    this.organiserIcon,
    this.venueName,
    this.venueCity,
    this.venueCountry,
  });

  static Data fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      bannerImage: json['bannerImage'],
      dateTime: json['dateTime'],
      organiserName: json['organiserName'],
      organiserIcon: json['organiserIcon'],
      venueName: json['venueName'],
      venueCity: json['venueCity'],
      venueCountry: json['venueCountry'],
    );
  }
}
