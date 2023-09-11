import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/otherHome/psikolook/profil_read.dart';

class BlogPage extends StatelessWidget {
  final snap;
  const BlogPage({Key? key, this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(
          Icons.close,
          size: 40,
          shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 30.0)],
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.decal,
                colors: backGroundColor)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        snap['blogUrl'].toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/flowers.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Yazan: ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: blueColorAccent,
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfilRead(uid: snap['uid']))),
                                child: snap['photoUrl'] != null
                                    ? snap['photoUrl'] != ''
                                        ? CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage(
                                              snap['photoUrl'].toString(),
                                            ),
                                          )
                                        : const CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                'assets/images/default-usr.png'),
                                          )
                                    : const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            'assets/images/default-usr.png'),
                                      ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfilRead(uid: snap['uid']))),
                                  child: Text(
                                    snap['username'].toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Text(
                                '${snap['blogTime']} dkk',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black45,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            child: Expanded(
                              child: Text(
                                snap['description'].toString(),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 30.0, left: 20.0, right: 20.0),
                    child: Text(
                      snap['blogText'].toString(),
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
