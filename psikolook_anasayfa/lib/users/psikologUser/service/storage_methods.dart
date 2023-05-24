import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // adding image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    // creating location to our firebase storage

    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    // putting in uint8list format -> Upload task like a future but not future
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> upLoadPdftoStorage(Uint8List _pdfFile) async {
    if (_pdfFile != null) {
      UploadTask? task = StorageMethods.uploadBytesforPdf(_pdfFile);
      if (task != null) {
        TaskSnapshot snapshot = await task.whenComplete(
          () {},
        );
        String pdfUrl = await snapshot.ref.getDownloadURL();
        print('Download-link: $pdfUrl');
        return pdfUrl;
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

/*   // adding pdf to firebase storage
  Future<String?> uploadPdfToStorage(
      String childName, File pdfFile, bool isPost) async {
    try {
      Reference ref = _storage
          .ref()
          .child(childName)
          .child(_auth.currentUser!.uid)
          .child('pdfs/${DateTime.now().millisecondsSinceEpoch}'); //!Dikkat
      if (isPost) {
        String id = const Uuid().v1();
        ref = ref.child(id);
      }
      UploadTask uploadTask =
          ref.putFile(pdfFile, SettableMetadata(contentType: 'pdf'));
      TaskSnapshot snapshot = await uploadTask;
      String url = await snapshot.ref.getDownloadURL();

      print("url:$url");
      return url;
    } catch (e) {
      return null;
    }
  } */

  //  adding pdf to firebase storage
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytesforPdf(Uint8List data) {
    try {
      String name = DateTime.now().millisecondsSinceEpoch.toString();
      var pdfFile =
          FirebaseStorage.instance.ref().child('pdf').child("$name/.pdf");
      return pdfFile.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
