import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Welcome to My AppBar", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
                    background: Image(
                      image: AssetImage('assets/images/images2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      indicator: BoxDecoration(color: Colors.blue),
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        new Tab(icon: new Icon(Icons.audiotrack), text: "Music"),
                        new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                        new Tab(icon: new Icon(Icons.message), text: "Message"),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                Songs(),
                Galery(),
                Email()
              ],
            )),
      ),
    );
  }
}

class Songs extends StatelessWidget {
  final List music = [
    "Here's Your Prefect.mp3",
    "Doule Take.mp3",
    "Love Is Gone.mp3",
    "Roman Picisan.mp3",
    "Pangeran Cinta.mp3",
    "Satu Hati.mp3",
    "Kangen.mp3",
    "Elang.mp3",
    "Pupus",
    "Separuh Nafas.mp3",
    "Aku Milikmu.mp3",
    "Cukup Siti Nurbaya"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(music[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text('Music from ' + music[index]),
            leading: Icon(Icons.audiotrack),
          ));
        },
        itemCount: music.length,
      ),
    );
  }
}

class Galery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        children: <Widget>[
          Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/boruto.jpeg",
                    height: 350.0,
                    width: 350.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/naruto.jpg",
                    height: 350.0,
                    width: 350.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/images1.jpg",
                    height: 350.0,
                    width: 350.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/download.jpg",
                    height: 350.0,
                    width: 350.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Email extends StatelessWidget {
  final List mesage = [
    "Telkomsel",
    "BPJSKES",
    "3",
    "TSEL-APPS",
    "Nanda Awimbi",
    "Lazada",
    "Shoppe",
    "3TopUp",
    "KOMINFO",
    "DANA",
    "Kemendikbud",
    "PEDULICOVID"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(mesage[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text('There is a message from ' + mesage[index]),
            leading: Icon(Icons.message),
          ));
        },
        itemCount: mesage.length,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
