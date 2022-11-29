import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage_Person extends StatelessWidget {
  const HomePage_Person({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/images/woman_picture.png'),
              radius: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    //color: Colors.black38,
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                  ),
                ],
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
    );
  }
}
