import 'package:flutter/material.dart';

class explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = new Image.network("http://www.gstatic.com/webp/gallery/1.jpg");
    var container = new Container(
      child: image,
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      width: 200.0,
      height: 200.0,
    );
    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -65,
            top: -50,
            child: Column(
              children: [
                Container(
                  width: 500,
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage('assets/background.jpg'),
                    minRadius: 90,
                    maxRadius: 180,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 30,
              top: 250,
              child: Container(
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 18.5,
                      ),
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(250, 250, 250, 0.95),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                height: 65,
                width: 320,
              )),
          Positioned(
            top: 270,
            left: 10,
            child: Center(
                child: new ListView.builder(
              itemBuilder: (context, index) {
                if (index == 0) {
                  //first row is horizontal scroll
                  var singleChildScrollView = SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 180,
                            child: Positioned(
                              top: 1000,
                              child: Text(
                                "Bennett University",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                          ),
                          container,
                          container,
                        ],
                      ),
                      scrollDirection: Axis.horizontal);
                  return singleChildScrollView;
                } else {
                  return new Row(
                    children: <Widget>[container, container],
                  );
                }
              },
              itemCount:
                  1, // 9 rows of AllGenresAndMoods + 1 row of PopularGenresAndMoods
            )),
          )
        ],
      ),
    ));
  }
}
