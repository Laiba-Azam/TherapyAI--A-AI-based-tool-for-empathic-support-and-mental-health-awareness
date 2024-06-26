import 'package:flutter/material.dart';
import 'package:fypp/constants/images.dart';

class Week2Activity extends StatelessWidget {
  Week2Activity({super.key});
  final List<Map<String, String>> activities = [
    {
      'image': planweek21,
      'title': 'Observe Thoughts Without Attachment:',
    },
    {
      'image': planweek23,
      'title': 'Sit with Uncomfortable Emotions:',
    },
    {
      'image': planweek22,
      'title': 'Practice Self-Compassion:',
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
          "Week 2: Understanding Thoughts and Feelings",
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
