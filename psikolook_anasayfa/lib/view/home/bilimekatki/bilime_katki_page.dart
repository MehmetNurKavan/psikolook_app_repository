import 'package:flutter/material.dart';

class BilimeKatkiPage extends StatefulWidget {
  const BilimeKatkiPage({super.key});

  @override
  State<BilimeKatkiPage> createState() => _BilimeKatkiPageState();
}

class _BilimeKatkiPageState extends State<BilimeKatkiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            colors: [
              Color.fromARGB(255, 255, 204, 204),
              Color.fromARGB(255, 250, 234, 240),
              Color.fromARGB(255, 247, 230, 243),
              Color.fromARGB(255, 247, 230, 243),
              Color.fromARGB(255, 219, 233, 234),
              Color.fromARGB(255, 192, 222, 228),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.2,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black54),
              flexibleSpace: const FlexibleSpaceBar(
                title:
                    Text('Bilime Katkı', style: TextStyle(color: Colors.black)),
                centerTitle: true,
              ),
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
                      textColor: Colors.black45,
                      trailing: FloatingActionButton.small(
                        backgroundColor: Colors.pink,
                        onPressed: () {},
                        tooltip: 'Mesaj sayısı',
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                },
                childCount: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
