import 'package:flutter/material.dart';
import 'custom_end_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Hamburger',
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String userFirstName = "Dr Babacar";

  void _openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    const drawerColor = Color(0xFF00A6C7);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF3FDFE),
        title: Text('Accueil', style: TextStyle( color: Colors.black,)),
        iconTheme: IconThemeData(color: drawerColor),
        actions: [
          Builder(
            builder:
                (context) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7F6FB),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Color(0xFF00A6C7)),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ),
                ),
          ),
        ],
      ),
      endDrawer: CustomEndDrawer(userFirstName: 'Dr Babacar'),
      body: Center(child: Text('Bienvenue dans notre app !')),
    );
  }

}
