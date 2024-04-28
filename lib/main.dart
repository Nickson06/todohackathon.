import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedbackScreen(),
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State
 {
// Declare a TextEditingController
final TextEditingController _feedbackController = TextEditingController();

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Feedback & Support'),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'We value your feedback!',
style: TextStyle(
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 16.0),
Text(
'Please share your thoughts, report issues, or suggest improvements:',
style: TextStyle(fontSize: 16.0),
),
const SizedBox(height: 16.0),
TextField(
controller: _feedbackController,
decoration: InputDecoration(
hintText: 'Enter your feedback...',
border: OutlineInputBorder(),
),
maxLines: 5,
),
const SizedBox(height: 16.0),
ElevatedButton(
onPressed: () {
// Get the entered feedback from the text field
String feedback = _feedbackController.text;
            // Print the feedback to the console (for demonstration purposes)
            print('Feedback submitted: $feedback');

            // Show a confirmation message to the user
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Feedback Submitted'),
                  content: Text('Thank you for your feedback!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );

            // Clear the text field after submission
            _feedbackController.clear();
          },
          child: Text('Submit Feedback'),
        ),
      ],
    ),
  ),
);
}

@override
void dispose() {
// Dispose of the TextEditingController when not needed
_feedbackController.dispose();
super.dispose();
}
}

This code includes the complete `FeedbackScreen` widget with the functionality to handle the submission of feedback. You can use it as a standalone Dart file or integrate it into your Flutter project as needed. Let me know if you have any questions or need further assistance!
