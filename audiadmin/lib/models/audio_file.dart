// import 'dart:ffi';

class AudioFile {
   String? subjectName;
   int? uid;
   String? className;
   String? chapterName;
   String? audioFile;
   String? pdfFile;

  AudioFile({
    required this.subjectName,
    required this.uid,
    required this.className,
    required this.chapterName,
    required this.audioFile,
    required this.pdfFile,
  });

  // Create a factory method to convert JSON to AudioFile object
  factory AudioFile.fromJson(Map<String, dynamic> json) {
    return AudioFile(
      subjectName: json['Subject'],
      uid: json['id'],
      className: json['Class'],
      chapterName: json['ChapterName'],
      audioFile: json['AudioFile'],
      pdfFile: json['PDF'],
    );
  }
}
