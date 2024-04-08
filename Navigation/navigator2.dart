import 'package:flutter/material.dart';

void main() {
  runApp(CourseApp());
}

class Course {
  String code;
  String title;
  String description;
  Course({required this.code, required this.title, this.description = ""});
}

class CourseListScreen extends StatelessWidget {
  const CourseListScreen(
      {super.key, required this.courses, required this.onTapped});

  final List<Course> courses;
  final ValueChanged<Course> onTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses List"),
      ),
      body: ListView(
        children: [
          for (var course in courses)
            ListTile(
              title: Text(course.title),
              subtitle: Text(course.code),
              onTap: () => onTapped(course),
            )
        ],
      ),
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  final Course course;
  const CourseDetailsScreen({super.key, required this.course});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: Center(
        child: Column(
          children: [
            Text(course.title),
            Text(course.code),
            Text(course.description),
          ],
        ),
      ),
    );
  }
}

class CourseApp extends StatefulWidget {
  @override
  State<CourseApp> createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {
  Course? _selectedCourse;

  List<Course> courses = [
    Course(
        code: "SiTE-001",
        title: "Introduction To Programming",
        description: "Computer Organization, Architecture, Programming"),
    Course(
        code: "SiTE-002",
        title: "Introduction To AI",
        description: "Computer Organization, Architecture, Programming"),
    Course(
        code: "SiTE-003",
        title: "Fundamentals of Networking",
        description: "Computer Organization, Architecture, Programming")
  ];

  void _tabHandler(Course course) {
    setState(() {
      _selectedCourse = course;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
          pages: [
            MaterialPage(
              key: const ValueKey('CourseListScreen'),
              child: CourseListScreen(
                courses: courses,
                onTapped: _tabHandler,
              ),
            ),
            if (_selectedCourse != null)
              MaterialPage(
                  key: ValueKey(_selectedCourse),
                  child: CourseDetailsScreen(
                    course: _selectedCourse!,
                  ))
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            setState(() {
              _selectedCourse = null;
            });
            return true;
          }),
    );
  }
}
