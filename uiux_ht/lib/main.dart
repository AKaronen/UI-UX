import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.orange),
        home: Scaffold(
            appBar: AppBar(
                actions: [
                  IconButton(
                      iconSize: 40,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      onPressed: () => {},
                      icon: const Icon(Icons.search, color: Colors.white)),
                  PopupMenuButton(
                      shape: Border.all(color: Colors.white),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      offset: const Offset(65, 65),
                      color: Colors.orange.withOpacity(0.9),
                      tooltip: "Friends and Groups",
                      iconSize: 40,
                      icon: Icon(Icons.group),
                      itemBuilder: (context) => [FriendsList()]),
                  IconButton(
                      iconSize: 40,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      onPressed: () => {},
                      icon: const Icon(Icons.person, color: Colors.white)),
                ],
                title: const Text("Placeholder"),
                backgroundColor: Colors.deepOrange),
            body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.5,
                        image: AssetImage("/background.png"),
                        fit: BoxFit.cover)),
                child: ListView(
                  children: <Widget>[
                    gameGrid(text: "Favourites"),
                    gameGrid(text: "Recommended"),
                    gameGrid(text: "New"),
                    gameGrid(text: "Most Popular"),
                    gameGrid(text: "Casual"),
                    gameGrid(text: "Hobby"),
                    BottomAppBar(
                        color: Colors.deepOrange,
                        child: Container(
                          height: 100,
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 500, left: 500, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            alignment: Alignment.center,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  textContainer(text: "FAQ".toUpperCase()),
                                  textContainer(
                                      text: "Customer Service".toUpperCase()),
                                  textContainer(
                                      text: "Support Us".toUpperCase()),
                                  textContainer(text: "Cookies".toUpperCase()),
                                  textContainer(
                                      text: "Privacy Policy".toUpperCase())
                                ]),
                          ),
                        ),
                        shape: const CircularNotchedRectangle())
                  ],
                  padding: const EdgeInsets.only(top: 20),
                ))));
  }
}

class gameContainer extends StatelessWidget {
  const gameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 5,
              spreadRadius: -15,
              offset: const Offset(5, 0))
        ]),
        padding: const EdgeInsets.all(20),
        width: 370,
        height: 200,
        child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image.asset('assets/UNO.png', fit: BoxFit.fill)));
  }
}

class textContainer extends StatelessWidget {
  String text;
  textContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 5, bottom: 5),
        alignment: Alignment.center,
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold)));
  }
}

class gameGrid extends StatelessWidget {
  String text;

  gameGrid({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 30, fontFamily: "Roboto")),
              ),
              Row(children: <Widget>[
                const gameContainer(),
                const gameContainer(),
                const gameContainer(),
                const gameContainer(),
                const gameContainer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: const Color.fromARGB(100, 57, 59, 59),
                        fixedSize: const Size.fromRadius(20)),
                    child: const Icon(Icons.arrow_forward),
                    onPressed: () => {print("click!")})
              ])
            ]));
  }
}

const double palloKoko = 5;

PopupMenuItem FriendsList() {
  return PopupMenuItem(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(color: Colors.orange.withOpacity(0.0)),
        child: Column(children: <Widget>[
          const Text(
            '   Groups and Friends',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              height: 2,
              fontSize: 16,
            ),
          ),
          Row(children: const [
            Text(' '),
            Icon(
              Icons.arrow_drop_up_sharp,
              size: 24,
            ),
            Text(
              'Friends: (3 / 20)',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            )
          ]),
          const Text(
            'In Game: (1)',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto",
              fontSize: 13,
            ),
          ),
          Row(children: const [
            Text('     '),
            Icon(
              Icons.circle_rounded,
              size: palloKoko,
            ),
            Text(
              '  ExampleFriend1 - (Catan)',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 11,
              ),
            )
          ]),
          const Text('', style: TextStyle(fontSize: 5)),
          const Text(
            'Online: (2)',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto",
              fontSize: 13,
            ),
          ),
          Row(children: const [
            Text('     '),
            Icon(
              Icons.circle_rounded,
              size: palloKoko,
            ),
            Text(
              '  ExampleFriend2',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 11,
              ),
            )
          ]),
          Row(children: const [
            Text('     '),
            Icon(
              Icons.circle_rounded,
              size: palloKoko,
            ),
            Text(
              '  ExampleFriend3',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 11,
              ),
            )
          ]),
          const Text('', style: TextStyle(fontSize: 5)),
          Row(children: const [
            Text(' '),
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 20,
            ),
            Text(
              'Offline: (18)',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 13,
              ),
            )
          ]),
          const Text('', style: TextStyle(fontSize: 6)),
          Row(children: const [
            Text(' '),
            Icon(
              Icons.arrow_drop_up_sharp,
              size: 24,
            ),
            Text(
              'Groups:',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            )
          ]),
          const Text('', style: TextStyle(fontSize: 5)),
          Row(children: const [
            Text(' '),
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 20,
            ),
            Text(
              'CatanColonialists: (5 / 57)',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 13,
              ),
            )
          ]),
          const Text('', style: TextStyle(fontSize: 5)),
          Row(children: const [
            Text(' '),
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 20,
            ),
            Text(
              'UnoReverse: (480 / 1377)',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 13,
              ),
            )
          ]),
          const Text('', style: TextStyle(fontSize: 5)),
          Row(children: const [
            Text(' '),
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 20,
            ),
            Text(
              'MorrisMasters: (3 / 13)',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 13,
              ),
            )
          ]),
          const Text(''),
          ElevatedButton(
              onPressed: () {},
              child: const Text('Send a friend request'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red.shade900),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )))),
          const Text(''),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Create a Group'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red.shade900),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),
            ),
          ),
          const Text(''),
        ]),
      ));
}
