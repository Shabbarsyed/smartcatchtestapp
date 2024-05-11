import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:intl/intl.dart';

import '../theme/theme.dart';
import '../widgets/side_drawer.dart';
import 'chat_rooms.dart';

class AllChats extends StatefulWidget {
  const AllChats({Key? key}) : super(key: key);

  @override
  State<AllChats> createState() => _AllChatsState();
}

class _AllChatsState extends State<AllChats> {
  String formatDate(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final formatter = DateFormat('MMM d, y');
    return formatter.format(date);
  }

  Widget buildItem(BuildContext context, types.User user) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MaterialTheme.lightScheme().surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () => {_handlePressed(user, context)},
        title: Row(
          children: [
            Text(
              user.firstName!,
              style: TextStyle(
                color: MaterialTheme.lightScheme().primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(' '),
            Text(
              user.lastName!,
              style: TextStyle(
                color: MaterialTheme.lightScheme().primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            const Text('Last Seen: '),
            Text(formatDate(user.lastSeen!)),
          ],
        ),
      ),
    );
  }

  // Create a user with an ID of UID if you don't use `FirebaseChatCore.instance.users()` stream
  void _handlePressed(types.User otherUser, BuildContext context) async {
    final room = await FirebaseChatCore.instance.createRoom(otherUser);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatRooms(),
      ),
    );
    // Navigate to the Chat screen
  }

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;

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
            title: Text("All Chats"),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return StreamBuilder<List<types.User>>(
                  stream: FirebaseChatCore.instance.users(),
                  initialData: const [],
                  builder: (context, snapshot) {
                    return Column(
                      children: snapshot.data!.map((user) {
                        return buildItem(context, user);
                      }).toList(),
                    );
                  },
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
