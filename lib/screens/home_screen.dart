import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Constants/AppDrawer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription<List<ConnectivityResult>> subscription;
  String internetStatus = "Checking internet connection...";
  bool isinternetconnected = true;

  void checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      if (connectivityResult == ConnectivityResult.none) {
        internetStatus = "No internet available. Turn on internet.";
        isinternetconnected = false;
      } else {
        internetStatus = "Internet connected!";
      }
    });
  }

  @override
  void initState() {
    checkInternet();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      setState(() {
        if (result == ConnectivityResult.none) {
          internetStatus = "No internet available. Turn on internet.";
        } else {
          internetStatus = "Internet connected!";
        }
      });
      print("Internet Status Is $internetStatus");
      if (!isinternetconnected) {
        showTopSnackBar(
          snackBarPosition: SnackBarPosition.bottom,
          Overlay.of(context),
          const CustomSnackBar.info(
            backgroundColor: Colors.red,
            message: "No Internt Connection , Turn On Internet",
          ),
        );
      }
    });
  }

  final List<Map<String, String>> foodItems = [
    {
      "name": "Pizza",
      "image":
          "assets/images/pizza.png",
      "type": "Italian",
      "description":
          "Pizza is a savory dish from Italy with a round, flat base of leavened dough topped with tomatoes, cheese, and often other ingredients.",
      "process":
          "• Prepare dough\n• Spread tomato sauce\n• Add toppings and cheese\n• Bake at 220°C for 12-15 minutes",
      "youtubeUrl": "https://youtu.be/sv3TXMSv6Lw?si=AiHZs1ocXKyiW7Bx"
    },
    {
      "name": "Sushi",
      "image":
          "assets/images/sushi.png",
      "type": "Japanese",
      "description":
          "Sushi is a traditional Japanese dish of vinegared rice served with seafood, vegetables, and occasionally tropical fruits.",
      "process":
          "• Cook sushi rice\n• Add rice vinegar mixture\n• Spread rice on nori\n• Add fillings and roll\n• Slice into pieces",
      "youtubeUrl": "https://youtu.be/ovX3X3vjywI?si=nLaS8W8qyqsxHM0U"
    },
    {
      "name": "Burger",
      "image":
          "assets/images/burger.png",
      "type": "American",
      "description":
          "A burger consists of a patty of ground meat, typically beef, placed inside a sliced bread roll or bun.",
      "process":
          "• Prepare patty\n• Grill patty\n• Assemble with lettuce, tomato, cheese, and sauces",
      "youtubeUrl": "https://www.youtube.com/watch?v=BIG1h2vG-Qg"
    },
    {
      "name": "Dosa",
      "image":
          "assets/images/dosa.png",
      "type": "Indian",
      "description":
          "Dosa is a thin, crispy pancake made from fermented rice and urad dal batter, typically served with chutneys and sambar.",
      "process":
          "• Soak rice and urad dal\n• Grind and ferment batter\n• Spread batter on a hot pan\n• Cook until golden brown",
      "youtubeUrl": "https://www.youtube.com/watch?v=KPFAAjONfmk"
    },
    {
      "name": "Tacos",
      "image":
          "assets/images/tacos.png",
      "type": "Mexican",
      "description":
          "Tacos are a traditional Mexican dish consisting of a folded or rolled tortilla filled with various ingredients.",
      "process":
          "• Prepare tortillas\n• Cook meat and vegetables\n• Assemble with toppings\n• Serve with salsa and lime",
      "youtubeUrl": "https://www.youtube.com/watch?v=ALeF0GUCSSk"
    },
    
    {
      "name": "Pasta",
      "image":
          "assets/images/pasta.png",
      "type": "Italian",
      "description":
          "Pasta is a staple Italian dish made from wheat flour dough, boiled and typically served with a sauce.",
      "process":
          "• Boil pasta\n• Prepare sauce\n• Toss pasta in sauce\n• Garnish with herbs and cheese",
      "youtubeUrl": "https://www.youtube.com/watch?v=UjDfZDsKz2M"
    },
    {
      "name": "Spring Rolls",
      "image":
          "assets/images/springroll.png",
      "type": "Chinese",
      "description":
          "Spring Rolls are a Chinese appetizer made by wrapping a mixture of vegetables and/or meat in a thin pastry and deep-frying.",
      "process":
          "• Prepare filling\n• Wrap in spring roll sheets\n• Deep-fry until golden brown",
      "youtubeUrl": "https://www.youtube.com/watch?v=wNB05Zc4TqA"
    },
    {
      "name": "Falafel",
      "image":
          "assets/images/falafel.jpg",
      "type": "Middle Eastern",
      "description":
          "Falafel is a deep-fried ball or patty made from ground chickpeas, herbs, and spices.",
      "process":
          "• Soak and grind chickpeas\n• Mix with spices\n• Shape into balls\n• Fry until crispy",
      "youtubeUrl": "https://www.youtube.com/watch?v=NZcWedPKysk"
    },
    {
      "name": "Ramen",
      "image":
          "assets/images/ramen.png",
      "type": "Japanese",
      "description":
          "Ramen is a Japanese noodle soup dish consisting of wheat noodles in a meat or fish-based broth, topped with various ingredients.",
      "process":
          "• Prepare broth\n• Boil noodles\n• Assemble with toppings\n• Serve hot",
      "youtubeUrl": "https://www.youtube.com/watch?v=AUEtmjeFgrI"
    },
    {
      "name": "Butter Chicken",
      "image":
          "assets/images/butterchicken.png",
      "type": "Indian",
      "description":
          "Butter Chicken is a creamy and mildly spiced curry made with marinated chicken cooked in a tomato-based sauce.",
      "process":
          "• Marinate chicken\n• Cook chicken\n• Prepare creamy sauce\n• Simmer chicken in sauce",
      "youtubeUrl": "https://www.youtube.com/watch?v=a03U45jFxOI"
    },
    {
      "name": "Biryani",
      "image":
          "assets/images/biryani.png",
      "type": "Indian",
      "description":
          "Biryani is a flavorful rice dish cooked with aromatic spices, marinated meat, and sometimes vegetables.",
      "process":
          "• Marinate meat\n• Cook rice\n• Layer meat and rice\n• Cook on low heat",
      "youtubeUrl": "https://www.youtube.com/watch?v=95BCU1n268w"
    },
    {
      "name": "Paella",
      "image":
          "assets/images/paella.png",
      "type": "Spanish",
      "description":
          "Paella is a Spanish rice dish made with seafood, chicken, or vegetables, seasoned with saffron.",
      "process":
          "• Sauté meat and vegetables\n• Add rice and broth\n• Simmer with saffron",
      "youtubeUrl": "https://www.youtube.com/watch?v=z90wDOfNPbI"
    },
    {
      "name": "Pho",
      "image":
          "assets/images/pho.jpg",
      "type": "Vietnamese",
      "description":
          "Pho is a Vietnamese soup consisting of broth, rice noodles, herbs, and meat, usually beef or chicken.",
      "process": "• Prepare broth\n• Cook noodles\n• Assemble with toppings",
      "youtubeUrl": "https://www.youtube.com/watch?v=WlosNFMCnE4"
    },
    {
      "name": "Shawarma",
      "image":
          "assets/images/shawarma.png",
      "type": "Middle Eastern",
      "description":
          "Shawarma is a Middle Eastern dish consisting of meat, cooked on a vertical rotisserie, served in a wrap or pita bread.",
      "process":
          "• Marinate meat\n• Cook on rotisserie\n• Serve in pita with toppings",
      "youtubeUrl": "https://www.youtube.com/watch?v=HeFS2us8F0E"
    },
    {
      "name": "Tandoori Chicken",
      "image":
          "assets/images/tandoorichicken.png",
      "type": "Indian",
      "description":
          "Tandoori Chicken is marinated in yogurt and spices, then roasted in a tandoor (clay oven).",
      "process":
          "• Marinate chicken\n• Roast in oven or tandoor\n• Serve with chutney",
      "youtubeUrl": "https://www.youtube.com/watch?v=-CKvt1KNU74"
    },
    {
      "name": "Pad Thai",
      "image":
          "assets/images/padthai.png",
      "type": "Thai",
      "description":
          "Pad Thai is a stir-fried rice noodle dish commonly served as street food in Thailand.",
      "process":
          "• Cook noodles\n• Stir-fry with sauce, tofu, and shrimp\n• Garnish with peanuts",
      "youtubeUrl": "https://www.youtube.com/watch?v=b7YnoRFuZ9o"
    },
    {
      "name": "Kebab",
      "image":
          "assets/images/kebab.png",
      "type": "Middle Eastern",
      "description":
          "Kebabs are skewered and grilled pieces of meat or vegetables, popular in Middle Eastern cuisine.",
      "process": "• Marinate meat or vegetables\n• Skewer and grill",
      "youtubeUrl": "https://www.youtube.com/watch?v=Yb3VIvpTvPw"
    },
    {
      "name": "Moussaka",
      "image":
          "assets/images/moussaka.png",
      "type": "Greek",
      "description":
          "Moussaka is a Greek baked dish made with layers of eggplant, ground meat, and béchamel sauce.",
      "process":
          "• Cook meat sauce\n• Fry eggplant slices\n• Layer with béchamel\n• Bake until golden",
      "youtubeUrl": "https://www.youtube.com/watch?v=8U_29i9Qp5U"
    },
    {
      "name": "Pav Bhaji",
      "image":
          "assets/images/pavbhaji.png",
      "type": "Indian",
      "description":
          "Pav Bhaji is a spiced vegetable mash served with buttered bread rolls.",
      "process":
          "• Cook and mash vegetables\n• Mix with spices\n• Serve with buttered pav",
      "youtubeUrl": "https://www.youtube.com/watch?v=p4wolRQ_9m4"
    },
    {
      "name": "Dim Sum",
      "image":
          "assets/images/dimsum.png",
      "type": "Chinese",
      "description":
          "Dim Sum refers to a variety of Chinese small dishes served in steamer baskets or on small plates.",
      "process":
          "• Prepare fillings\n• Wrap in dumpling dough\n• Steam until cooked",
      "youtubeUrl": "https://www.youtube.com/watch?v=JQjZ-_CWIFg"
    },
    {
      "name": "Chow Mein",
      "image":
          "assets/images/chowmin.jpg",
      "type": "Chinese",
      "description":
          "Chow Mein is a popular Chinese dish made with stir-fried noodles, vegetables, and meat or tofu.",
      "process":
          "• Cook noodles\n• Stir-fry vegetables and protein\n• Toss noodles in sauce",
      "youtubeUrl": "https://www.youtube.com/watch?v=gbygXUDbf2Q"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Food Recipes",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      drawer: const AppDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: foodItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          final food = foodItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    name: food["name"]!,
                    image: food["image"]!,
                    description: food["description"]!,
                    process: food["process"]!,
                    youtubeUrl: food['youtubeUrl']!,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Hero(
                    tag: food["name"]!,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset(
                        food["image"]!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stacktrace) {
                          return Image.asset(
                            'assets/images/errorimage.png', // Path to your default image
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          food["name"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          food["type"]!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
