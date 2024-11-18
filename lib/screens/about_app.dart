import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "About App",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              child: const Center(
                  child: Text(
                'Food Recipe is your ultimate guide to exploring delicious recipes from around the world! Whether you\'re a seasoned cook or a beginner, this app offers a variety of food recipes with step-by-step instructions and instructional videos to help you make the perfect dish every time.\n\n'
                'Key Features:\n'
                'Splash Screen with Animation: The app begins with a beautifully animated splash screen, showcasing the app\'s name along with a tempting food image, setting the mood for your culinary adventure.\n\n'
                'Home Screen with Food Cards: The home screen features a clean, user-friendly interface with cards for different food recipes. Each card displays an image of the dish along with its title. Browse through a diverse collection of food categories such as Indian, Continental, Chinese, Italian, and more.\n\n'
                'Details Screen with Recipe Information: Once you click on a food card, you are redirected to the details screen. Here, you’ll find:\n'
                '- Food Name & Image: The title of the recipe along with a high-quality image of the dish.\n'
                '- Food Description: A detailed description of the dish, its origin, and its flavors.\n'
                '- How-to Video: Watch an informative video demonstrating the process of making the dish, helping you learn faster.\n'
                '- Food Making Procedure: A detailed, easy-to-follow recipe with step-by-step instructions to guide you through the cooking process.\n\n'
                'Internet Connectivity Check: The app checks your internet connection status on the home screen, ensuring you are connected before browsing or watching recipe videos.\n\n'
                'App Benefits:\n'
                '- Variety of Cuisines: Explore a wide range of global cuisines with detailed recipes and instructions.\n'
                '- Interactive & Engaging: With videos and clear procedures, learning to cook your favorite dishes becomes fun and easy.\n'
                '- Smooth User Experience: The clean layout and intuitive navigation ensure that finding and making recipes is a breeze.\n\n'
                'Whether you\'re cooking at home, looking for new ideas, or just exploring the culinary world, Food Recipe is the perfect app to make your cooking experience enjoyable and informative!',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              )),
            )
          ],
        ));
  }
}
