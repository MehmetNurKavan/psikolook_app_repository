import 'package:flutter/material.dart';

class baslik_kartlari extends StatelessWidget {
  const baslik_kartlari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/images.jpeg"),
        ),
        title: Text("başlık kısmı"),
        subtitle: Text("alt başlık"),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class soru_kartlari extends StatelessWidget {
  const soru_kartlari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 300,
      child: Card(
        color: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topRight: Radius.circular(50))),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/images.jpeg"),
          ),
          title: Text("başlık kısmı"),
          subtitle: Text("alt başlık"),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

class konu_kartlari extends StatelessWidget {
  const konu_kartlari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(leading: Text("buraya konu başlıkları gelecek")),
    );
  }
}
