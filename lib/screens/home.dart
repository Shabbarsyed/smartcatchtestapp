import 'package:flutter/material.dart';
import 'package:smartcatchapp/screens/all_chats_screen.dart';
import 'package:smartcatchapp/screens/chat_rooms.dart';
import 'package:smartcatchapp/widgets/side_drawer.dart';

import '../theme/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().surfaceContainerLow,
      drawer: const SideDrawer(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: false,
              child: Icon(Icons.search_rounded),
            ),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.forum_rounded),
            ),
            label: 'Forums',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.local_activity_rounded),
            ),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.account_circle_rounded),
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text("Smart Catch"),
            actions: [
              IconButton(
                icon: Icon(Icons.error),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.language),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => AllChats(),
                    ),
                  );
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
