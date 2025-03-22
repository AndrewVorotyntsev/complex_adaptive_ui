import 'package:complex_adaptive_ui/ui/home_appbar.dart';
import 'package:complex_adaptive_ui/ui/home_body.dart';
import 'package:complex_adaptive_ui/ui/home_side_bar.dart';
import 'package:complex_adaptive_ui/utils/device_type.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth != 0) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              key: _scaffoldKey,
              appBar: HomeAppBar(scaffoldKey: _scaffoldKey),
              body: Center(child: HomeBody()),
              drawer: DeviceType.isPhone(context) ? const HomeSideBar() : null,
              floatingActionButton:
                  DeviceType.isTablet(context)
                      ? Padding(
                        padding: const EdgeInsets.all(20),
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.yellow,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          label: Text('Button'),
                        ),
                      )
                      : null,
              bottomNavigationBar:
                  DeviceType.isPhone(context)
                      ? BottomNavigationBar(
                        items: const [
                          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.favorite),
                            label: 'Favorites',
                            backgroundColor: Colors.blueAccent,
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.bookmark),
                            label: 'Bookmarks',
                            backgroundColor: Colors.blueAccent,
                          ),
                        ],
                      )
                      : null,
            ),
          );
        }
        return Container();
      },
    );
  }
}
