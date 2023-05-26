import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> myList = [
    "Batman",
    "Superman",
    "IronMan",
    "The Atom",
    "Black Panther",
    
  ];

  TextEditingController charController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            floating: true,
            expandedHeight: 200,
            centerTitle: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Super heroes',
                style: TextStyle(color: Colors.white54),
              ),
              expandedTitleScale: 3,
              background: Image(
                image: NetworkImage(
                  'https://images5.alphacoders.com/131/thumbbig-1311166.webp',
                ),
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                debugPrint('pressed');
                  showModalBottomSheet(
                    backgroundColor: Colors.black,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 500,
                        child: Column(
                          children: [
                            myTextFormFiled(myController: charController),
                            const SizedBox(
                              height: 40,
                            ),
                            myButton(value: charController.text.trim()),
                          ],
                        ),
                      );
                    },
                  );
              },
              icon: const Icon(Icons.add),
            ),
            
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return myWidget(myList[index]);
              },
              childCount: myList.length,
            ),
          ),
        ],
      ),
    );
  }

  myWidget(char) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)
          ),
          height: 150,
          width: 150,
          child: Center(
            child: Text(char.toString(),style: TextStyle(color: Colors.white),),
          ),
        ),
      );

  myTextFormFiled({
    required myController,
  }) =>
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none
              ),
              controller: myController,
              cursorColor: Colors.red,
            ),
          ),
        ),
      );

  myButton({required String value}) => ElevatedButton(
        onPressed: () {
          if(value.isNotEmpty) {
            myList.add(value);
            setState(() {
              myList;
            });
            Navigator.of(context).pop();
            charController.clear();
          }
        },
        style:ElevatedButton.styleFrom(
          backgroundColor: Colors.red
        ),
        child: const Text('add your character'),
      );
}
