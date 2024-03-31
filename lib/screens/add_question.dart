import 'package:flutter/material.dart';
import 'package:quizzer_app/reusing_widgets/form_fields.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _addQueForm = GlobalKey<FormState>();

  final _questionController = TextEditingController();
  final _optionOneController = TextEditingController();
  final _optionTwoController = TextEditingController();
  final _optionThreeController = TextEditingController();
  final _optionFourController = TextEditingController();

  final TextStyle _headStyle = const TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Question"),
        backgroundColor: Colors.black12,
      ),
      body: Form(
          key: _addQueForm,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Question",
                    style: _headStyle,
                  ),
                  TextInputField(
                      controller: _questionController,
                      hint: "Please Enter Question",
                      label: "Question",
                      name: "Question"),
                  Text(
                    "Options",
                    style: _headStyle,
                  ),
                  TextInputField(
                      controller: _optionOneController,
                      hint: "Please Enter option 1",
                      label: "Option 1",
                      name: "Option 1"),
                  TextInputField(
                      controller: _optionTwoController,
                      hint: "Please Enter option 2",
                      label: "Option 2",
                      name: "Option 2"),
                  TextInputField(
                      controller: _optionThreeController,
                      hint: "Please Enter option 3",
                      label: "Option 3",
                      name: "Option 3"),
                  TextInputField(
                      controller: _optionFourController,
                      hint: "Please Enter option 4",
                      label: "Option 4",
                      name: "Option 4"),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_addQueForm.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(content: Text('Processing Data ${_optionOneController.text.toString()}')),
                            );
                          }
                        },
                        child: const Text("Submit")),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
