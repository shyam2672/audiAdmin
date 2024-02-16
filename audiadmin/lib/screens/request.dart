import 'dart:convert';

import 'package:audiadmin/models/audio_file.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestsPage extends StatefulWidget {
  final String email;

  RequestsPage({required this.email});

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
   List<AudioFile>? requests;

  @override
  void initState() {
    super.initState();
    fetchRequests();
  }

  Future<void> fetchRequests() async {
    print("ffff");
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/audiofiles/audiofiles/notapproved/'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      setState(() {
        requests =
            responseData.map((data) => AudioFile.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load requests');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
      ),
      body: requests != null
          ? ListView.builder(
              itemCount: requests!.length,
              itemBuilder: (BuildContext context, int index) {
                return RequestCard(request: requests![index]);
              },
            )
          : Center(
              child:
                  CircularProgressIndicator(), // Show a loading indicator while fetching data
            ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final AudioFile request;

  RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the request details page
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => RequestDetailsPage(request: request)),
        // );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Request #${request.uid}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Subject: ${request.subjectName}',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Class: ${request.className}',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Chapter: ${request.chapterName}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement accept functionality
                    },
                    child: Text('Accept'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement reject functionality
                    },
                    child: Text('Reject'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
