import 'package:flutter/material.dart';
import 'package:quizionare/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listQuiz;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getListQuiz() {
    listQuiz = getListDataQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listQuiz.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.question_answer),
              title: Text(listQuiz[index].question),
            ),
          );
        },
      ),
    );
  }
}
