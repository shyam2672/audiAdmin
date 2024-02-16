// import 'package:flutter/material.dart';
// // import 'package:audiadmin/models/request.dart'; // Import your Request model
// import 'package:audiadmin/models/audio_file.dart'; // Import your AudioFile model
// // import 'package:audiadmin/services/api_service.dart'; // Import your API service

// class RequestDetailsPage extends StatelessWidget {
//   final Request request;

//   RequestDetailsPage({required this.request});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Request Details'),
//       ),
//       body: FutureBuilder<List<AudioFile>>(
//         // future: ApiService.fetchAudioFilesForRequest(request.id),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No audio files found for this request'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 AudioFile audioFile = snapshot.data![index];
//                 return ListTile(
//                   title: Text(audioFile.title),
//                   subtitle: Text('Class: ${audioFile.className}, Subject: ${audioFile.subjectName}'),
//                   // Add more details as needed
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
