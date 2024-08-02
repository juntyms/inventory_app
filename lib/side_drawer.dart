import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/front-view-man-posing-naturally_23-2148364875.jpg'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Junn Eric',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    '@junneric',
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('About'),
            onTap: () {
              Navigator.of(context).pop();
              // Opening Other pages
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Contact'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
