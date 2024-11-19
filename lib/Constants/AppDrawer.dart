import 'package:flutter/material.dart';
import 'package:food_app/screens/about_app.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  final Uri _url =
      Uri.parse('https://www.freeprivacypolicy.com/live/d271b0c4-6cde-4013-a113-9368f37cb6ff');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

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
                  'Food Recipes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Welcome To Food Recipes",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About App'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const AboutApp()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              _launchUrl();
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact Us'),
            onTap: () {
              showTopSnackBar(
                snackBarPosition: SnackBarPosition.bottom,
                Overlay.of(context),
                const CustomSnackBar.info(
                  message:
                      "For Any Issues and Enqueries Reach Us At : darshilbavisya@gmail.com",
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
