import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';

class HomePage_Person extends StatefulWidget {
  const HomePage_Person({Key? key}) : super(key: key);

  @override
  State<HomePage_Person> createState() => _HomePage_PersonState();
}

class _HomePage_PersonState extends State<HomePage_Person> {
  Uint8List? _image;
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  // for picking up image from gallery
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No Image Selected');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: backGroundColor
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                        backgroundColor: Colors.white,
                      )
                    : const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            const AssetImage('assets/images/default-usr.png'),
                        radius: 64,
                      ),
              ],
            ),
            Positioned(
              bottom: -10,
              left: 80,
              child: IconButton(
                onPressed: selectImage,
                icon: const Icon(Icons.add_a_photo),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Column(
              children: [
                Text(
                  'Sedef Taşın',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    leading: Text('Telefon :'),
                    title: Text(''),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    leading: Text('E-posta :'),
                    title: Text(''),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    leading: Text('Yaş :'),
                    title: Text(''),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    leading: Text('Cinsiyet :'),
                    title: Text(''),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    leading: Text('Meslek :'),
                    title: Text(''),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    leading: Text('Okul :'),
                    title: Text(''),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    leading: Text('Bölüm :'),
                    title: Text(''),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    leading: Text('Sınıf :'),
                    title: Text(''),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),);
  }
}
