import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fypp/constants/images.dart';
import 'package:fypp/signup/signup_screen.dart';

class Week3Activity extends StatelessWidget {
  final databaseRef = FirebaseDatabase.instance.ref('user_feedback');

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
    TextEditingController feedbackController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Center(
                  // Center the card horizontally
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.8, // 60% of the screen width
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Center the content
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              activity['title']!,
                              style: const TextStyle(
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
            const SizedBox(height: 50.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Have You Completed Week 3? We Love your feedback!',
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                hintText: 'Enter your feedback',
                controller: feedbackController,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  onNext: () {
                    if (feedbackController.text.isEmpty) {
                      return;
                    } else {
                      try {
                        databaseRef.push().set({
                          'feedback': feedbackController.text,
                          'user': FirebaseAuth.instance.currentUser!.email,
                          'week': 'Week 3',
                        }).then((_) {
                          feedbackController.clear();
                          var snackBar = const SnackBar(
                            content: Text('Feedback submitted successfully!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      } catch (e) {
                        print('error is thiiiiiiiiiiiiiiiiis $e');
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        // );
                      }
                    }
                  },
                  text: 'Submit',
                  color: const Color.fromARGB(113, 217, 14, 14),
                  googleButton: false,
                  textColor: Colors.white),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
