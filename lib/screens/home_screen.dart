import 'package:flutter/material.dart';
import 'package:quizzer_app/screens/add_question.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<dynamic, dynamic>> _questionTypes = [
    {"type": "MCQ"},
    {"type": "True / False"}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            child: const Text('Add Questions'),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Center(
                              child: Text(
                            "Question Type",
                            style: TextStyle(
                                fontSize: 34.0, fontFamily: "RobotoMono"),
                          )),
                          Divider(
                            endIndent: MediaQuery.of(context).size.width * 0.1,
                            indent: MediaQuery.of(context).size.width * 0.1,
                            height: 12.0,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.8,
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20.0,
                                  crossAxisSpacing: 15.0,
                                  children: List.generate(_questionTypes.length,
                                      (index) {
                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddQuestion()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black87,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          color: Colors.green.shade300
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                                  _questionTypes[index]["type"],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.0,
                                                  color: Colors.white
                                                ),
                                              ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
