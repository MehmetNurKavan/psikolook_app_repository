import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/topluluk/chat_page.dart';

class ToplulukPage extends StatefulWidget {
  const ToplulukPage({Key? key}) : super(key: key);

  @override
  State<ToplulukPage> createState() => _ToplulukPageState();
}

class _ToplulukPageState extends State<ToplulukPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.2,
            backgroundColor: Colors.black, 
            iconTheme: const IconThemeData(color: Colors.white70),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Topluluk', style: TextStyle(color: Colors.white70)),
              centerTitle: true,
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Ara',
                onPressed: () {},
              ),
            ],
          ),
          //const SliverToBoxAdapter(),//hemen oraya bisey ekleyebilrisin Text fala nolur boxdecorationla
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  //color: index.isOdd ? Colors.pink[300] : Colors.pink[100],
                  height: MediaQuery.of(context).size.height * 0.153,
                  child: ListTile(
                    title: const Text('Psikolook'),
                    textColor: Colors.black87,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage()));
                    },
                  ),
                );
              },
              childCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
