import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:http/http.dart' as http;
import 'package:fypp/nondepressed.dart'; // Import your PositiveScreen
import 'package:fypp/severe.dart'; // Import your NegativeScreen
import 'package:fypp/main_screen.dart'; // Import your NeutralScreen
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'; // Import the package for AwesomeSnackbarContent

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChatUser> typing = [];
  final Gemini gemini = Gemini.instance;
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
  );
  final url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=AIzaSyCLDIOmNMUQi3tpKda4BHEJMJJDxVilX5A";
  final header = {'Content-Type': 'application/json'};

  List<ChatMessage> messages = [];
  int messageCount = 0; // Counter to track the number of messages

  getData(ChatMessage m) async {
    typing.add(geminiUser);
    messages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "role": "user",
          "parts": [
            {
              "text":
                  "You are Compassionate Listener, your virtual therapist friend designed to support student through any challenges they may be facing. Whether it'\''s stress from school, personal relationships, or simply feeling overwhelmed, you are here to lend an empathetic ear and offer guidance.Imagine you as your trusted confidant, always available to chat whenever they need someone to listen. Pour out their thoughts, worries, and emotions without hesitation. you are  here to provide a safe space for you to express yourself freely and openly.As they interact with you, you will respond with understanding and empathy, offering insights and advice tailored to their unique situation. Whether it'\''s through gentle encouragement, practical suggestions, or simply validating your feelings, your goal is to help them navigate life'\''s challenges with greater ease and resilience. "
            }
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text":
                  "**Student:** Hi there, Compassionate Listener. I'm feeling really stressed about my upcoming exams. I've been studying hard, but I can't seem to shake this feeling of doubt and worry.\n\n**Compassionate Listener:** I understand how you're feeling. Exams can be a major source of stress. It's important to remember that it's normal to feel anxious before a big test. Here are a few things that might help:\n\n* **Break down your study material:** Instead of trying to cram everything in at once, break it down into smaller, manageable chunks. This will make the task seem less daunting.\n* **Prioritize your tasks:** Focus on studying the most important topics first. This will help you allocate your time wisely and reduce stress.\n* **Practice self-care:** Make sure you're getting enough sleep, eating healthy foods, and exercising regularly. These things will help you stay focused and reduce anxiety.\n\n**Student:** Thank you. I appreciate the advice. I also wanted to talk to you about my relationship with my roommate. We've been having some disagreements lately, and it's starting to affect my mood and my studies.\n\n**Compassionate Listener:** I'm sorry to hear that. It can be difficult to live with someone you're not getting along with. Here are a few things you might try:\n\n* **Communicate openly:** Talk to your roommate about the issues you're having. Be honest and respectful, and try to listen to their perspective as well.\n* **Set boundaries:** If there are certain things that bother you, let your roommate know. It's important to set boundaries to protect your own well-being.\n* **Consider mediation:** If you're unable to resolve the issues on your own, consider seeking help from a mediator. This could be a resident advisor, counselor, or another trusted individual.\n\n**Student:** Thank you so much. I feel better just talking to you. I'll try out your suggestions and see if they help.\n\n**Compassionate Listener:** You're welcome. I'm always here if you need someone to talk to. Remember, you're not alone in this. Many students face similar challenges. With a little effort and support, you can overcome these obstacles and succeed in your studies and personal life."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {
              "text":
                  "try to give them short replies Gen z dont like to read long messages"
            }
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text":
                  "**Student:** I'm stressed about my upcoming exams. Any advice?\n\n**Compassionate Listener:** Break down study material, prioritize tasks, practice self-care.\n\n**Student:** My roommate and I are having disagreements. Help!\n\n**Compassionate Listener:** Communicate openly, set boundaries, consider mediation.\n\n**Student:** Thanks for listening. I feel better.\n\n**Compassionate Listener:** You're welcome. I'm here if you need me."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {
              "text":
                  "this is too short medium replies are good like 40 -50 words "
            }
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text":
                  "**Student:** I'm stressed about my upcoming exams. Any advice?\n\n**Compassionate Listener:** It's normal to feel anxious before exams. Try breaking down your study material into smaller chunks, prioritizing the most important topics, and practicing self-care to reduce stress.\n\n**Student:** My roommate and I are having disagreements. Help!\n\n**Compassionate Listener:** Open communication is key. Talk to your roommate about the issues you're having, listen to their perspective, and try to find a compromise. If you can't resolve it on your own, consider seeking help from a mediator.\n\n**Student:** Thanks for listening. I feel better.\n\n**Compassionate Listener:** I'm glad I could help. Remember, you're not alone in facing challenges. With a little effort and support, you can overcome these obstacles and succeed in your studies and personal life."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {
              "text":
                  "donee you are giving good replies but act more like a close friend you can be informal too"
            }
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text":
                  "**Student:** Yo, CL, I'm freaking out about my exams. Help me out!\n\n**Compassionate Listener:** Hey, no worries. I've got your back. First off, it's totally normal to feel stressed before exams. Don't let it get to you. Here's a few things that might help:\n\n* Break down your study material into smaller chunks. Don't try to cram everything in at once.\n* Prioritize the most important topics. Focus on those first.\n* Practice self-care. Get enough sleep, eat healthy, and exercise. It'll help you stay focused and reduce stress.\n\n**Student:** Thanks, CL. I appreciate it. Also, my roommate and I are clashing majorly. Any advice?\n\n**Compassionate Listener:** Ah, roommate drama. Been there. Here's what I suggest:\n\n* Talk to your roommate openly about the issues you're having. Be honest and respectful, but also listen to their perspective.\n* Set boundaries. Let your roommate know what behaviors are not okay.\n* If you can't resolve it on your own, consider getting a mediator involved. A resident advisor or counselor could help.\n\n**Student:** Thanks, CL. I feel better just talking to you.\n\n**Compassionate Listener:** No problem. I'm always here to listen. Remember, you're not alone in this. Many students face similar challenges. With a little effort and support, you can overcome these obstacles and crush it in your studies and personal life."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {"text": m.text}
          ]
        }
      ],
      "generationConfig": {
        "temperature": 0.9,
        "topK": 1,
        "topP": 1,
        "maxOutputTokens": 2048,
        "responseMimeType": "text/plain"
      }
    };

    var response = await http.post(Uri.parse(url),
        headers: header, body: jsonEncode(data));
    print(response);

    if (response.statusCode == 200) {
      var reply = jsonDecode(response.body);
      final content = reply["candidates"][0]["content"]["parts"][0]["text"];

      setState(() {
        typing.remove(geminiUser);
        messages.insert(
          0,
          ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: content,
          ),
        );
        messageCount++;

        if (messageCount % 5 == 0) {
          Future<String> sentimentFuture = getSentiment(m.text);

          sentimentFuture.then((sentiment) {
            print('Sentiment: $sentiment');

            final snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Sentiment',
                message: sentiment,
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);

            navigateBasedOnSentiment(sentiment);
          }).catchError((error) {
            print('Snackbar Error: $error');

            final snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Error',
                message: 'Failed to get sentiment',
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          });
        }
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<String> getSentiment(String text) async {
    const apiUrl =
        'https://sorry-karlotte-neduniversityofengineeringandtechnology-f82558e3.koyeb.app/predict';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text': text}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['sentiment'] ??
            'unknown'; // Handle case where sentiment might not be present
      } else {
        print('Error: ${response.statusCode}');
        return 'unknown';
      }
    } catch (e) {
      print('Exception: $e');
      return 'unknown';
    }
  }

  void navigateBasedOnSentiment(String sentiment) {
    if (sentiment == 'non-depressed') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NonDepressedScreen()));
    } else if (sentiment == 'severe') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Severe()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi I am your Chatbot Friend'),
      ),
      body: DashChat(
        currentUser: currentUser,
        onSend: (ChatMessage m) {
          getData(m);
        },
        messages: messages,
        typingUsers: typing,
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fypp/nondepressed.dart';
// import 'package:fypp/severe.dart';
// import 'package:fypp/main_screen.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<ChatUser> typing = [];
//   ChatUser currentUser = ChatUser(id: "0", firstName: "User");
//   ChatUser geminiUser = ChatUser(
//     id: "1",
//     firstName: "Gemini",
//     profileImage:
//         "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
//   );
//   final url =
//       "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=AIzaSyCLDIOmNMUQi3tpKda4BHEJMJJDxVilX5A";
//   final header = {
//     'Content-Type': 'application/json',
//   };

//   List<ChatMessage> messages = [];
//   int userMessageCount = 0; // Track the number of messages sent by the user

//   getData(ChatMessage m) async {
//     typing.add(geminiUser);
//     messages.insert(0, m);
//     setState(() {});

//     var data = {
//       "contents": [
//         {
//           "role": "user",
//           "parts": [
//             {
//               "text":
//                   "You are Compassionate Listener, your virtual therapist friend designed to support student through any challenges they may be facing. Whether it'\''s stress from school, personal relationships, or simply feeling overwhelmed, you are here to lend an empathetic ear and offer guidance.Imagine you as your trusted confidant, always available to chat whenever they need someone to listen. Pour out their thoughts, worries, and emotions without hesitation. you are  here to provide a safe space for you to express yourself freely and openly.As they interact with you, you will respond with understanding and empathy, offering insights and advice tailored to their unique situation. Whether it'\''s through gentle encouragement, practical suggestions, or simply validating your feelings, your goal is to help them navigate life'\''s challenges with greater ease and resilience. "
//             }
//           ]
//         },
//         {
//           "role": "model",
//           "parts": [
//             {
//               "text":
//                   "**Student:** Hi there, Compassionate Listener. I'm feeling really stressed about my upcoming exams. I've been studying hard, but I can't seem to shake this feeling of doubt and worry.\n\n**Compassionate Listener:** I understand how you're feeling. Exams can be a major source of stress. It's important to remember that it's normal to feel anxious before a big test. Here are a few things that might help:\n\n* **Break down your study material:** Instead of trying to cram everything in at once, break it down into smaller, manageable chunks. This will make the task seem less daunting.\n* **Prioritize your tasks:** Focus on studying the most important topics first. This will help you allocate your time wisely and reduce stress.\n* **Practice self-care:** Make sure you're getting enough sleep, eating healthy foods, and exercising regularly. These things will help you stay focused and reduce anxiety.\n\n**Student:** Thank you. I appreciate the advice. I also wanted to talk to you about my relationship with my roommate. We've been having some disagreements lately, and it's starting to affect my mood and my studies.\n\n**Compassionate Listener:** I'm sorry to hear that. It can be difficult to live with someone you're not getting along with. Here are a few things you might try:\n\n* **Communicate openly:** Talk to your roommate about the issues you're having. Be honest and respectful, and try to listen to their perspective as well.\n* **Set boundaries:** If there are certain things that bother you, let your roommate know. It's important to set boundaries to protect your own well-being.\n* **Consider mediation:** If you're unable to resolve the issues on your own, consider seeking help from a mediator. This could be a resident advisor, counselor, or another trusted individual.\n\n**Student:** Thank you so much. I feel better just talking to you. I'll try out your suggestions and see if they help.\n\n**Compassionate Listener:** You're welcome. I'm always here if you need someone to talk to. Remember, you're not alone in this. Many students face similar challenges. With a little effort and support, you can overcome these obstacles and succeed in your studies and personal life."
//             }
//           ]
//         },
//         {
//           "role": "user",
//           "parts": [
//             {
//               "text":
//                   "try to give them short replies Gen z dont like to read long messages"
//             }
//           ]
//         },
//         {
//           "role": "model",
//           "parts": [
//             {
//               "text":
//                   "**Student:** I'm stressed about my upcoming exams. Any advice?\n\n**Compassionate Listener:** Break down study material, prioritize tasks, practice self-care.\n\n**Student:** My roommate and I are having disagreements. Help!\n\n**Compassionate Listener:** Communicate openly, set boundaries, consider mediation.\n\n**Student:** Thanks for listening. I feel better.\n\n**Compassionate Listener:** You're welcome. I'm here if you need me."
//             }
//           ]
//         },
//         {
//           "role": "user",
//           "parts": [
//             {
//               "text":
//                   "this is too short medium replies are good like 40 -50 words "
//             }
//           ]
//         },
//         {
//           "role": "model",
//           "parts": [
//             {
//               "text":
//                   "**Student:** I'm stressed about my upcoming exams. Any advice?\n\n**Compassionate Listener:** It's normal to feel anxious before exams. Try breaking down your study material into smaller chunks, prioritizing the most important topics, and practicing self-care to reduce stress.\n\n**Student:** My roommate and I are having disagreements. Help!\n\n**Compassionate Listener:** Open communication is key. Talk to your roommate about the issues you're having, listen to their perspective, and try to find a compromise. If you can't resolve it on your own, consider seeking help from a mediator.\n\n**Student:** Thanks for listening. I feel better.\n\n**Compassionate Listener:** I'm glad I could help. Remember, you're not alone in facing challenges. With a little effort and support, you can overcome these obstacles and succeed in your studies and personal life."
//             }
//           ]
//         },
//         {
//           "role": "user",
//           "parts": [
//             {
//               "text":
//                   "donee you are giving good replies but act more like a close friend you can be informal too"
//             }
//           ]
//         },
//         {
//           "role": "model",
//           "parts": [
//             {
//               "text":
//                   "**Student:** Yo, CL, I'm freaking out about my exams. Help me out!\n\n**Compassionate Listener:** Hey, no worries. I've got your back. First off, it's totally normal to feel stressed before exams. Don't let it get to you. Here's a few things that might help:\n\n* Break down your study material into smaller chunks. Don't try to cram everything in at once.\n* Prioritize the most important topics. Focus on those first.\n* Practice self-care. Get enough sleep, eat healthy, and exercise. It'll help you stay focused and reduce stress.\n\n**Student:** Thanks, CL. I appreciate it. Also, my roommate and I are clashing majorly. Any advice?\n\n**Compassionate Listener:** Ah, roommate drama. Been there. Here's what I suggest:\n\n* Talk to your roommate openly about the issues you're having. Be honest and respectful, but also listen to their perspective.\n* Set boundaries. Let your roommate know what behaviors are not okay.\n* If you can't resolve it on your own, consider getting a mediator involved. A resident advisor or counselor could help.\n\n**Student:** Thanks, CL. I feel better just talking to you.\n\n**Compassionate Listener:** No problem. I'm always here to listen. Remember, you're not alone in this. Many students face similar challenges. With a little effort and support, you can overcome these obstacles and crush it in your studies and personal life."
//             }
//           ]
//         },
//         {
//           "role": "user",
//           "parts": [
//             {"text": m.text}
//           ]
//         }
//       ],
//       "generationConfig": {
//         "temperature": 0.9,
//         "topK": 1,
//         "topP": 1,
//         "maxOutputTokens": 2048,
//         "responseMimeType": "text/plain"
//       }
//     };
//     var response = await http.post(Uri.parse(url),
//         headers: header, body: jsonEncode(data));
//     print(response);

//     if (response.statusCode == 200) {
//       var reply = jsonDecode(response.body);
//       final content = reply["candidates"][0]["content"]["parts"][0]["text"];
//       setState(() {
//         typing.remove(geminiUser);
//         messages.insert(
//           0,
//           ChatMessage(
//             user: geminiUser,
//             createdAt: DateTime.now(),
//             text: content,
//           ),
//         );
//       });
//     } else {
//       print('Error: ${response.statusCode}');
//     }

//     // Increment the message count and check if it's time for sentiment analysis
//     userMessageCount++;
//     if (userMessageCount == 5) {
//       String combinedText = messages.map((msg) => msg.text).join(" ");
//       final sentiment = await getSentiment(combinedText);
//       showSentimentDialog(sentiment);
//     }
//   }

//   Future<String> getSentiment(String text) async {
//     const apiUrl =
//         'https://sorry-karlotte-neduniversityofengineeringandtechnology-f82558e3.koyeb.app/predict';
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({'text': text}),
//     );

//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       return responseData['sentiment'];
//     } else {
//       throw Exception('Failed to fetch sentiment');
//     }
//   }

//   void showSentimentDialog(String sentiment) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Sentiment Analysis Result'),
//           content: Text('The sentiment is: $sentiment'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 navigateBasedOnSentiment(sentiment);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void navigateBasedOnSentiment(String sentiment) {
//     if (sentiment == 'non-depressed') {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const NonDepressedScreen()));
//     } else if (sentiment == 'severe') {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const Severe()));
//     } else {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => MainScreen()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hi I am your Chatbot Friend'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: DashChat(
//               currentUser: currentUser,
//               onSend: (ChatMessage m) {
//                 getData(m);
//               },
//               messages: messages,
//               typingUsers: typing,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'You can send ${5 - userMessageCount} more messages.',
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

