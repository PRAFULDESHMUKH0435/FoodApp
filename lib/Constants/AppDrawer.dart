import 'package:flutter/material.dart';
import 'package:food_app/screens/about_app.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Food Recipe',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Welcome To Food Recipe",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About App'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutApp()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to Privacy Policy screen
            },
          ),
          
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact Us'),
            onTap: () {
              showTopSnackBar(
                snackBarPosition: SnackBarPosition.bottom,
                Overlay.of(context),
                CustomSnackBar.info(
                  message:
                      "For Any Issues and Enqueries Reach Us At : ###@gmail.com",
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
