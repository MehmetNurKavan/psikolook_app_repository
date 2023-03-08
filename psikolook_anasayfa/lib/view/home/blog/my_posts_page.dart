import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/blog/utils/customColors.dart';
import 'package:psikolook_anasayfa/view/home/blog/utils/customTextStyle.dart';
import 'package:psikolook_anasayfa/view/home/blog/post_share.dart';
import 'package:psikolook_anasayfa/view/shimmer/skeleton.dart';
import 'package:psikolook_anasayfa/widget/post_card.dart';

class MyPostsPage extends StatefulWidget {
  final String uid;
  const MyPostsPage({super.key, required this.uid});

  @override
  State<MyPostsPage> createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 236, 241),
              Color.fromARGB(255, 254, 243, 244),
              Color.fromARGB(255, 255, 248, 245),
              Color.fromARGB(255, 255, 252, 247),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 81.7,
            ),
            barField(),
            const SizedBox(
              height: 81.7,
            ),
            //snapCardField(),
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('posts')
                  .where('uid', isEqualTo: widget.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: NewsCardSkelton(),
                  );
                } else if (snapshot.hasData != null) {
                  return shareCard();
                }
                return GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 5,
                    childAspectRatio: 2 / 3,
                  ),
                  itemBuilder: (context, index) {
                    /* DocumentSnapshot snap =
                        (snapshot.data! as dynamic).docs[index]; */
                        //!
                    return Container(
                      child: PostCard(
                        snap: snapshot.data?.docs[index].data() ??'', //!dikkat
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            hearthIcon(),
          ],
        ),
      ),
    );
  }

// yana dogru kayan kartları içeriyor...
  Padding snapCardField() {
    return Padding(
      padding: const EdgeInsets.only(left: 27.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              shareCard(),
              const SizedBox(
                width: 18,
              ),
              shareCard(),
              const SizedBox(
                width: 18,
              ),
              shareCard(),
            ],
          )),
    );
  }

//close icon içeriyor
  Row barField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        closeIconButton(),
      ],
    );
  }

  Container shareCard() {
    return Container(
      width: 340,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(39)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Icon(Icons.person,
                    color: CustomColors.hearthColor, size: 34),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const Text(
                      "Psikolook",
                      style: textStyle.userNameTextStyle,
                    ),
                    const Text(
                      "1 hours ago",
                      style: textStyle.onlineTextStyle,
                    )
                  ],
                ),
                const SizedBox(width: 120),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_sharp))
              ],
            ),
          ),
          const Text(
            textAlign: TextAlign.center,
            "Henüz hiç paylaşımın yok,\nhadi paylaşım yaparak kalplere dokun",
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Container hearthIcon() {
    return Container(
      height: 71,
      width: 71,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.5), color: Colors.white),
      child: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PostShare()));
        },
        icon: Image.asset('assets/images/heart.png'),
      ),
    );
  }

  Padding closeIconButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 45),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
        color: Colors.black,
        iconSize: 35,
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(39)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.person, color: Colors.grey, size: 34),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Skeleton(width: 75),
                    const SizedBox(height: 10),
                    const Skeleton(width: 100),
                  ],
                ),
                const ListTile(
                  
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_sharp))
              ],
            ),
          ),
          Skeleton(width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
