import 'package:flutter/material.dart';
import 'package:fypp/constants/images.dart';

class Week1Activity extends StatelessWidget {
  final List<Map<String, String>> activities = [
    {
      'image': gratitude,
      'title': 'Start a Gratitude Journal',
    },
    {
      'image': mindfulwalking,
      'title': 'Mindful Walking',
    },
    {
      'image': mindfulwalking_1,
      'title': 'Don\'t feel rushed',
    },
    {
      'image': mindfulwalking_2,
      'title': 'How about a nature walk?',
    },
    {
      'image': mindfulwalking_3,
      'title': 'Observe your surroundings.',
    },
    {
      'image': mindfulwalking_4,
      'title': 'Feel the sensation of legs',
    },
    {
      'image': mindfulwalking_5,
      'title': 'Engage your senses',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth:  MediaQuery.of(context).size.width * 0.8,
        backgroundColor: Colors.white,
        title: Text(
          'Week 1: Grounding and Gratefulness',
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
