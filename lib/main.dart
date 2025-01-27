import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          'Animated Dialog'.toUpperCase(),
          style: const TextStyle(
            wordSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            showMyAnimatedDialog(context);
          },
          child: const Text(
            'Show My Animated Dialog',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void showMyAnimatedDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: 'animated-dialog',
    barrierDismissible: true,
    pageBuilder: (context, animation, secondaryAnimation) {
      return AlertDialog(
        backgroundColor: Colors.indigo[100],
        title: const Text('Your Title'),
        content: const Text('Your Dialog Content'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    },
  );
}


//Open Command Prompt or Terminal: Navigate to the location where you want to create your project.
//flutter create project_name



//From bottom to top
// return SlideTransition(
// position: Tween<Offset>(
// begin: const Offset(0, 1),
// end: Offset.zero,
// ).animate(animation),
// child: child,
// );

//From right to left
// return SlideTransition(
// position: Tween<Offset>(
// begin: const Offset(1, 0),
// end: Offset.zero,
// ).animate(animation),
// child: child,
// );
