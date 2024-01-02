class Goal{
  DateTime? date;
  String? name;
  String? description;

  Goal({
    required this.date,
    required this.name,
    required this.description
  });

  Map<String, dynamic> toJson() => {
    'date': date,
    'name': name,
    'description': description
  };

}