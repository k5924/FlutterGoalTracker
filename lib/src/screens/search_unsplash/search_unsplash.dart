import 'package:flutter/material.dart';
import "../../models/export.dart";
import "../../services/export.dart";
import "../../models/export.dart";
import "../export.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class SearchUnsplash extends StatefulWidget {
  const SearchUnsplash({Key? key,
    required this.searchTerm,
    required this.amount,
    required this.duration,
    required this.oldGoalModel,
    }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String searchTerm;
  final String amount;
  final String duration;
  final GoalModel oldGoalModel;

  @override
  State<SearchUnsplash> createState() => _SearchUnsplash();
}

class _SearchUnsplash extends State<SearchUnsplash> {

  late List<ImageModel> images;

  final UnsplashService unsplashService = UnsplashService();

  final DatabaseService databaseService = DatabaseService(db: FirebaseFirestore.instance);

  Future<void> newGoal(String imageUrl) async {
      try{
          final GoalModel goalModel = GoalModel(
            name: widget.searchTerm,
            amount: widget.amount,
            duration: widget.duration,
            imageUrl: imageUrl,
          );
          if (widget.oldGoalModel.name == ""){
            await databaseService.updateGoal(oldGoalModel: widget.oldGoalModel, newGoalModel: goalModel);
          } else {
            await databaseService.newGoal(goalModel: goalModel);
          }
      } catch (exception) {
            print(exception);
      }
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
        title: const Text("Search Unsplash"),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.searchTerm}"),
            Center(
              child: FutureBuilder(
                future: unsplashService.getPhotos(widget.searchTerm),
                builder: (context, snapshot){
                    if (snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                      if (snapshot.data.runtimeType != String){
                          images = <ImageModel>[];
                          images = snapshot.data as List<ImageModel>;
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3/2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: images.length,
                            itemBuilder: (BuildContext context, index){
                              return GestureDetector(
                                  onTap: () async {
                                    await newGoal(images[index].imageUrl);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => MyHomePage()
                                      )
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: NetworkImage(images[index].imageUrl),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                              );
                            }
                          );
                        } else {
                            return const Center(child: Text("Could not fetch images"));
                          }
                      } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                  }
              )
            )

          ],
        ),
      ),
    );
  }
}

