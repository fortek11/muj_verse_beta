import 'package:flutter/material.dart';

class AcademicCalenderScreen extends StatelessWidget {
  static const routeName = 'academicscreen';
  const AcademicCalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 200,
          child: InteractiveViewer(
              maxScale: 5,
              minScale: 0.01,
              boundaryMargin: EdgeInsets.all(20),
              child: Image.asset('assets/academic_calender.jpg')),
        ),
      ),
    );
  }
}
