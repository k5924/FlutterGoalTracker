import "package:cloud_firestore/cloud_firestore.dart";
import "../models/export.dart";

class DatabaseService{
  final FirebaseFirestore db;

  DatabaseService({required this.db});

  late CollectionReference goalsCollection = db.collection('goals');

  Future<void> newGoal({required GoalModel goalModel}) async {
    await goalsCollection.add(goalModel.toMap());
    }
}
