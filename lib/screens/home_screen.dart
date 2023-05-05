import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            backgroundColor: Color.fromRGBO(1, 23, 54, 1),
            leading: const Icon(Icons.add),
            actions: const [
              Icon(Icons.exit_to_app),
            ],

            pinned: true,
            floating: false,
            snap: false,

            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://buddy.works/blog/thumbnails/flutter/flutter-cover.png',fit: BoxFit.cover,),
              centerTitle: true,
              title: const Text(
                "Sliver App Bar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ), //Text
            ),
          ),


          SliverList(
            delegate: SliverChildListDelegate(
              _buildList(40),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = [];
    for (int i = 0; i < count; i++) {
      listItems.add(
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Sliver Item ${i.toString()}',
            style: const TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
      );
    }
    return listItems;
  }
}
