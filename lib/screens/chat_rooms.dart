import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:smartcatchapp/theme/theme.dart';

import '../widgets/side_drawer.dart';
import 'all_chats_screen.dart';
import 'chat_screen.dart';

class ChatRooms extends StatefulWidget {
  const ChatRooms({Key? key}) : super(key: key);

  @override
  State<ChatRooms> createState() => _ChatRoomsState();
}

class _ChatRoomsState extends State<ChatRooms> {
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
            title: Text("Chat Rooms"),
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
                return StreamBuilder<List<types.Room>>(
                  stream: FirebaseChatCore.instance.rooms(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Return a loader widget while data is loading
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(50),
                          child: CircularProgressIndicator(),
                        ), // Loader example
                      );
                    } else if (snapshot.hasError) {
                      // Handle error state if needed
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text('Error: ${snapshot.error}'),
                        ), // Error message example
                      );
                    } else {
                      // Data is available, build the list of rooms
                      final room = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                room: room,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Card(
                            elevation: 0,
                            color:
                                MaterialTheme.lightScheme().surfaceContainerLow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color:
                                    MaterialTheme.lightScheme().outlineVariant,
                                width: 2, // Set the width of the border
                              ),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              title: Text(
                                room.name ?? '',
                                style: TextStyle(
                                  color: MaterialTheme.lightScheme()
                                      .onSurfaceVariant,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
              childCount: 1, // Set the number of children to 1
            ),
          ),
        ],
      ),
    );
  }
}
