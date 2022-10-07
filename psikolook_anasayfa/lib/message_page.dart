import 'dart:io';

import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black54),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Mesajlar', style: TextStyle(color: Colors.black)),
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
                  color: index.isOdd ? Colors.pink[300] : Colors.pink[100],
                  height: MediaQuery.of(context).size.height * 0.153,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                    title: Text('Psikolook'),
                    subtitle: Text(
                      'Hi!!!!',
                    ),
                    textColor: Colors.white,
                    trailing: Column(
                      children: [
                        Expanded(child: Text('1 min')),
                        Expanded(
                          child: FloatingActionButton.small(
                            backgroundColor: Colors.pink,
                            onPressed: () {},
                            tooltip: 'Mesaj sayısı',
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
