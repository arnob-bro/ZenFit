class ExerciseVar {
  ExerciseVar({
    required this.sets,
    required this.reps,
    required this.name,

  });
  late int sets;
  late int reps;
  late String name;

  ExerciseVar.fromJson(Map<String, dynamic> json){

    name = json['name'] ?? '';
    reps = json['reps'] ?? '';
    sets = json['sets'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sets'] = sets;
    data['reps'] = reps;
    data['name'] = name;

    return data;
  }
}