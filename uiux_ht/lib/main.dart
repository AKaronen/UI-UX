import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.orange),
        home: Scaffold(
            appBar: AppBar(
                title: Text("Placeholder"), backgroundColor: Colors.deepOrange),
            bottomNavigationBar: BottomAppBar(
                color: Colors.deepOrange,
                child: Container(height: 50),
                shape: const CircularNotchedRectangle()),
            body: Container(
                decoration: BoxDecoration(
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
                    gameGrid(text: "Hobby")
                  ],
                  padding: const EdgeInsets.only(top: 20),
                ))));
  }
}

class gameContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 5,
              spreadRadius: -15,
              offset: Offset(5, 0))
        ]),
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        width: 200,
        height: 100,
        child: Image.asset('assets/UNO.png'));
  }
}

class gameGrid extends StatelessWidget {
  final String text;

  gameGrid({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 30, fontFamily: "Roboto")),
              ),
              Container(
                  padding: EdgeInsets.only(right: 50),
                  child: GridView.count(
                      crossAxisCount: 5,
                      shrinkWrap: true,
                      childAspectRatio: 2,
                      children: <Widget>[
                        gameContainer(),
                        gameContainer(),
                        gameContainer(),
                        gameContainer(),
                        gameContainer()
                      ]))
            ]));
  }
}
