import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internet_folks/screens/model/conference.dart';

import 'event_details_screen.dart';

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
                      return GestureDetector(
                             onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetailsScreen(
                             description:   conferenceList[index].description ??
                                                    '', imageUrl:   conferenceList[index].bannerImage ??
                                                    '', title:   conferenceList[index].title??
                                                    '', organiser_icon:  conferenceList[index].organiserIcon??
                                                    '', organiser_name:  conferenceList[index].organiserName??
                                                    '', venue_city:  conferenceList[index].venueCity??
                                                    '', venue_country:  conferenceList[index].venueCountry??
                                                    '', venue_name:  conferenceList[index].venueName??
                                                    '', date_time: conferenceList[index].dateTime??
                                                    ''
                                                    
                            ),
                          ),
                        );
                      },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      child: Image.network(
                                        conferenceList[index].bannerImage ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            conferenceList[index].dateTime ?? '',
                                            style: TextStyle(
                                                color: Colors.blue, fontSize: 10),
                                          ),
                                          SizedBox(height: 8.0),
                                          Text(
                                            conferenceList[index].title ?? '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          SizedBox(height: 12.0),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on,
                                                  color: Colors.black45),
                                              Text(
                                                conferenceList[index].venueName ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 8),
                                              ),
                                               Text(',',
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 8)),
                                              Text(
                                                conferenceList[index].venueCity ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 8),
                                              ),
                                              Text(',',
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 8)),
                                              Text(
                                                conferenceList[index]
                                                        .venueCountry ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 8),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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

  Data(
      {this.id,
      this.title,
      this.description,
      this.bannerImage,
      this.dateTime,
      this.organiserName,
      this.organiserIcon,
      this.venueName,
      this.venueCity,
      this.venueCountry});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    bannerImage = json['banner_image'];
    dateTime = json['date_time'];
    organiserName = json['organiser_name'];
    organiserIcon = json['organiser_icon'];
    venueName = json['venue_name'];
    venueCity = json['venue_city'];
    venueCountry = json['venue_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['banner_image'] = this.bannerImage;
    data['date_time'] = this.dateTime;
    data['organiser_name'] = this.organiserName;
    data['organiser_icon'] = this.organiserIcon;
    data['venue_name'] = this.venueName;
    data['venue_city'] = this.venueCity;
    data['venue_country'] = this.venueCountry;
    return data;
  }
}
