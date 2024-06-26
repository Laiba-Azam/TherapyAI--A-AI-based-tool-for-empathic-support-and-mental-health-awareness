import 'package:flutter/material.dart';
import 'package:fypp/constants/images.dart';

class Week3Activity extends StatelessWidget {
  Week3Activity({super.key});
  final List<Map<String, String>> activities = [
    {
      'image': planweek31,
      'title': 'Choose a Positive Influencer:',
    },
    {
      'image': planweek32,
      'title': 'Warm Greeting and Gratitude:',
    },
    {
      'image': planweek33,
      'title': 'Specific Impact Examples:',
    },
    {
      'image': planweek34,
      'title': 'Sincere and Authentic Feelings:',
    },
    {
      'image': planweek35,
      'title': 'Appreciative Closing and Wishes:',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Week 3: Defining Values and Goals",
          style: TextStyle(
            fontFamily: "roboto",
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 16, 200, 203),
          ),
          textAlign: TextAlign.center, // Center the title
        ),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Center( // Center the card horizontally
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // 60% of the screen width
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Center the content
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        activity['title']!,
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                        textAlign: TextAlign.center, // Center the title
                      ),
                    ),
                    Image.asset(activity['image']!),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
