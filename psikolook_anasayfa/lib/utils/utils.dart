import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// for picking up image from gallery
pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No Image Selected');
}

// for displaying snackbars
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
Future<dynamic> showErorDialog(BuildContext context,
    String title) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 10,
      title: Center(
          child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      )),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            enableFeedback: false,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Center(
            child: Text(
              'Geri Dön',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    ),
  );
}

//showdialog
Future<dynamic> fireShowDialog(BuildContext context,
    {required String title, required String content}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 10,
      title: Center(
          child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      )),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            enableFeedback: false,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Center(
            child: Text(
              'Geri Dön',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    ),
  );
}

/* Future<List<dynamic>> open({ List<String> ?types, bool multiple = false}) async {

    final completer = Completer<List<String>>();
    InputElement uploadInput = FileUploadInputElement();

    if(types != null  && types.length > 0){
      String theTypes = types.join(',');
      uploadInput.accept = theTypes;
    }

    uploadInput.multiple = multiple;
    uploadInput.click();
    uploadInput.addEventListener('change', (e) async {
      final files = uploadInput.files;
      Iterable<Future<String>> resultsFutures = files.map((file) {
        final reader = FileReader();
        reader.readAsDataUrl(file);
        reader.onError.listen((error) => completer.completeError(error));
        return reader.onLoad.first.then((_) => reader.result as String);
      });
      final results = await Future.wait(resultsFutures);
      completer.complete(results);
    });

    document.body.append(uploadInput);
    return completer.future;
  }
if(kIsWeb) {
      DocumentPicker.open(types: ['application/pdf']).then((list) {
        processList(list);
      });
      return;
    } */
