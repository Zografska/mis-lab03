import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam organiser',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyAppClass(),
    );
  }
}

class MyAppClass extends StatefulWidget {
  const MyAppClass({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppClass> {
  void addExam(String subject, String date) {
    var exam = {
      'subject': subject,
      'date': date,
    };

    setState(() {
      exams.add(exam);
    });
  }

  final subjectController = TextEditingController();
  final dateController = TextEditingController();

  List<Map<String, String>> exams = [];

  _MyAppState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exams List"),
        actions: [
          IconButton(
            onPressed: () {
              var subject = subjectController.text;
              var date = dateController.text;
              if (date == "" || subject == "") {
                //don't add if part of the input for the card is missing :)
                return;
              }
              addExam(subject, date);

              subjectController.clear();
              dateController.clear();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    'Enter subject',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Name of subject',
                    ),
                    controller: subjectController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Subject exam date',
                    ),
                    controller: dateController,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (contx, index) {
                return Card(
                  elevation: 4,
                  borderOnForeground: false,
                  shadowColor: Theme.of(contx).primaryColorDark,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          exams[index]['subject'] as String,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(contx).primaryColorDark,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          exams[index]['date'] as String,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
