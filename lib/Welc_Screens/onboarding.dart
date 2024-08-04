// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Onboarding Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: OnboardingPage(),
//       routes: {
//         '/home': (context) => HomeScreen(),
//       },
//     );
//   }
// }

// class OnboardingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Intro(
//       pages: [
//         PageViewModel(
//           title: "Welcome to MyApp",
//           body: "This is the first page of the onboarding process.",
//           image: Center(child: Image.asset("assets/onboarding1.png", height: 175.0)),
//           decoration: const PageDecoration(
//             titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             bodyTextStyle: TextStyle(fontSize: 16),
//           ),
//         ),
//         PageViewModel(
//           title: "Explore Features",
//           body: "This is the second page of the onboarding process.",
//           image: Center(child: Image.asset("assets/onboarding2.png", height: 175.0)),
//           decoration: const PageDecoration(
//             titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             bodyTextStyle: TextStyle(fontSize: 16),
//           ),
//         ),
//         PageViewModel(
//           title: "Get Started",
//           body: "This is the third page of the onboarding process.",
//           image: Center(child: Image.asset("assets/onboarding3.png", height: 175.0)),
//           decoration: const PageDecoration(
//             titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             bodyTextStyle: TextStyle(fontSize: 16),
//           ),
//         ),
//       ],
//       onDone: () {
//         Navigator.of(context).pushReplacementNamed('/home');
//       },
//       onSkip: () {
//         Navigator.of(context).pushReplacementNamed('/home');
//       },
//       showSkipButton: true,
//       skip: const Text("Skip"),
//       next: const Icon(Icons.arrow_forward),
//       done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
//       dotsDecorator: const DotsDecorator(
//         size: Size.square(10.0),
//         activeSize: Size(22.0, 10.0),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: Text('Welcome to the Home Screen!'),
//       ),
//     );
//   }
// }
