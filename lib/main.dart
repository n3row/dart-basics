import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YOUTUBE CLONE FOR TWITCH FIT',
      theme: ThemeData(
        brightness: Brightness.dark,
        //primarySwatch: Colors.grey,

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.white12,
          ).copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.white10,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final _indexToPageMap = [
    MainPage(),
    Text('================IN PROGRESS================'),
    Text('================IN PROGRESS================'),
    Text('================IN PROGRESS================'),
    Text('================IN PROGRESS================'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: SvgPicture.asset(
          'resources/images/twitch.svg',
          semanticsLabel: 'Twitch Logo',
          fit: BoxFit.scaleDown,
        ),
        titleSpacing: -3,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.notifications_outlined),
              tooltip: 'Show Notifications(PRIME)',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Notifications(PRIME)'),
                      ),
                      body: const Center(
                        child: Text(
                          'NONE TEXT',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              }),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'SEARCH',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('IN PROGRESS')));
            },
          ),
          IconButton(
            onPressed: _openEndDrawer,
            icon: CircleAvatar(
              radius: 30,
              backgroundImage:
                  AssetImage('resources/images/default-avatar.png'),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: Container(
            height: 45,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      child: Row(
                        children: [
                          const Icon(Icons.explore_outlined),
                          const Text('NAVIGATION'),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    VerticalDivider(
                      thickness: 1,
                    ),
                    Container(
                      child: ElevatedButton(
                          child: const Text('ALL'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                            primary: Colors.white,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: ElevatedButton(
                        child: const Text('CHARTS'),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: ElevatedButton(
                        child: const Text('Music'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            activeIcon: Icon(Icons.movie_creation),
            label: 'CLIPS(SHORTS)',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle),
              label: 'CREATE'),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: 'SUBS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: 'LIBRARY',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('MY ACCOUNT'),
            ),
            ListTile(
              title: const Text('MY CHANNEL'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('IN PROGRESS')));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('==EXAMPLE=='),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('IN PROGRESS')));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      endDrawerEnableOpenDragGesture: false,

      body: _indexToPageMap.elementAt(_selectedIndex),
    );
  }
}
