import 'package:flutter/material.dart';
import "../export.dart";
import "../../models/export.dart";

class CreateGoal extends StatefulWidget {
  const CreateGoal({Key? key, required this.oldGoalModel}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final GoalModel oldGoalModel;


  @override
  State<CreateGoal> createState() => _CreateGoal();
}

class _CreateGoal extends State<CreateGoal> {
  final TextEditingController goalController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
      goalController.dispose();
      amountController.dispose();
      durationController.dispose();
      super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Goal"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            iconSize: 24.0,
            color: Colors.grey,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: goalController,
                  validator: (value){
                    if (value == null || value.isEmpty){
                        return "Please enter a name for your goal";
                    }
                    return null;
                  },
                  onSaved: (goalName) {
                    goalController.text = goalName!;
                  },
                  decoration: const InputDecoration(
                    hintText: "What are you saving towards?",
                  ),
                ),
                TextFormField(
                  controller: amountController,
                  validator: (value){
                    if (value == null || value.isEmpty){
                        return "Please enter an amount";
                    } 
                    if (!RegExp(r'^[0-9]\d*(\.\d+)?$').hasMatch(value)){
                        return "Enter a valid amount";
                    }
                    return null;
                  },
                  onSaved: (amount) {
                    amountController.text = amount!;
                  },
                  decoration: const InputDecoration(
                    hintText: "How much do you want to save?",
                  ),
                ),
                TextFormField(
                  controller: durationController,
                  validator: (value){
                    if (value == null || value.isEmpty){
                        return "Please enter an amount of months";
                    }
                    if (!RegExp(r'^[0-9]\d*(\.\d+)?$').hasMatch(value)){
                        return "Enter a valid duration";
                    }
                    return null;
                  },
                  onSaved: (duration) {
                    durationController.text = duration!;
                  },
                  decoration: const InputDecoration(
                    hintText: "How many months are you saving for?",
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                      if (_formKey.currentState!.validate()){
                          FocusScope.of(context).unfocus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return SearchUnsplash(
                                searchTerm: goalController.text,
                                amount: amountController.text,
                                duration: durationController.text,
                                oldGoalModel: widget.oldGoalModel,
                              );
                            }),
                          );
                      }
                  },
                  child: const Text("Next"),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}

