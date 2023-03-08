import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  final snap;
  const BlogPage({super.key, this.snap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(
          Icons.close,
          size: 40,
          shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 40.0)],
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 235, 240),
              Color.fromARGB(255, 255, 249, 246),
              Color.fromARGB(255, 255, 254, 248),
              Color.fromARGB(255, 255, 254, 248),
            ],
          )),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        snap['blogsUrl'].toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 35.0, bottom: 35.0, left: 25.0, right: 25.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Yazan: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF5CE1E6),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            snap['username'].toString(),
                            //user.username,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              snap['description'].toString(),
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text(
                          '${snap['blogTime']} dkk',
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black45,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      snap['blogText'].toString(),
                      style:
                          const TextStyle(fontSize: 22, color: Colors.black54),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
