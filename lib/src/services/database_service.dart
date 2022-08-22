import "package:cloud_firestore/cloud_firestore.dart";
import "../models/export.dart";

class DatabaseService{
  final FirebaseFirestore db;

  DatabaseService({required this.db});

  late CollectionReference goalsCollection = db.collection('goals');

  Future<void> newGoal({required GoalModel goalModel}) async {
    await goalsCollection.add(goalModel.toMap());
    }

  Stream<QuerySnapshot> getGoals() async {
      return goalsCollection.snapshots();
    }

  Future<String> findGoal({required GoalModel goalModel}) async {
      final QuerySnapshot query = await goalsCollection
        .where("imageUrl", isEqualTo: goalModel.imageUrl)
        .where("name", isEqualTo: goalModel.name)
        .where("amount", isEqualTo: goalModel.amount)
        .where("duration", isEqualTo: goalModel.duration)
        .get();
        final QueryDocumentSnapshot docSnap = query.docs[0];
        final DocumentReference docRef = docSnap.reference;
        return docRef.id;
    }

  Future<void> deleteGoal({required GoalModel goalModel}) async {
      final String docRefID = await findGoal(goalModel: goalModel);
      await goalsCollection.doc(docRefID).delete();
    }

  Future<void> updateGoal({required GoalModel oldGoalModel, required GoalModel newGoalModel}) async {
      final String docRefID = await findGoal(goalModel: oldGoalModel);
      await goalsCollection.doc(docRefID).update(newGoalModel.toMap());
    }
}
