class GoalModel {
  final String name;
  final String amount;
  final String duration;
  final String imageUrl;

  GoalModel({
    required this.name, 
    required this.amount, 
    required this.duration, 
    required this.imageUrl
  });

  Map<String, dynamic> toMap(){
      return{
          'name': name,
          'amount': amount,
          'duration': duration,
          'imageUrl': imageUrl,
        };
    }
}
