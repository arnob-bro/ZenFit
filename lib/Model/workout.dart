class Workout {
  Workout({
    required this.name,

  });
  late String name;

  Workout.fromJson(Map<String, dynamic> json){

    name = json['name'] ?? '';

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['name'] = name;

    return data;
  }
}