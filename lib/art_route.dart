import 'package:flutter/material.dart';
import 'art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  static int _currentIndex = 0;
  const ArtRoute({super.key, required this.art});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigating art'), actions: <Widget>[
        PopupMenuButton(
          //icon: Icon(Icons.image),
          itemBuilder: (BuildContext context) {
            return ArtUtil.menuItems.map((String item) {
              return PopupMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList();
          },
          onSelected: (String value) => changeRoute(context, value),
        )
      ]),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(art),
          fit: BoxFit.cover,
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lime[900],
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: ArtUtil.CARAVAGGIO,
            icon: Icon(Icons.art_track),
          ),
          BottomNavigationBarItem(
            label: ArtUtil.MONET,
            icon: Icon(Icons.art_track),
          ),
          BottomNavigationBarItem(
            label: ArtUtil.VANGOGH,
            icon: Icon(Icons.art_track),
          ),
        ],
        onTap: (value) {
          String artist = ArtUtil.menuItems[value];
          _currentIndex = value;
          changeRoute(context, artist);
        },
      ),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    String image = '';
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        {
          image = ArtUtil.IMG_CARAVAGGIO;
          break;
        }
      case ArtUtil.MONET:
        {
          image = ArtUtil.IMG_MONET;
          break;
        }
      case ArtUtil.VANGOGH:
        {
          image = ArtUtil.IMG_VANGOGH;
          break;
        }
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ArtRoute(art: image)));
  }
}
