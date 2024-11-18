import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String process;
  final String youtubeUrl;

  const DetailsScreen({super.key, 
    required this.name,
    required this.image,
    required this.description,
    required this.process,
    required this.youtubeUrl,
  });

  @override
  Widget build(BuildContext context) {
    final String videoId = YoutubePlayer.convertUrlToId(youtubeUrl) ?? "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            showTopSnackBar(
                snackBarPosition: SnackBarPosition.bottom,
                Overlay.of(context),
                const CustomSnackBar.info(
                  message:
                      "Report For This Food Has Been Submitted",
                ),
              );
          }, icon: Icon(Icons.report)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: name,
                child: Image.network(
                  image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stacktrace) {
                            return Image.asset(
                              'assets/images/errorimage.png', // Path to your default image
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Watch Tutorial:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // YouTube Player Widget
              if (videoId.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videoId,
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                )
              else
                 Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                      "No video tutorial available.",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "How to Make $name:",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  process,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
