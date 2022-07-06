class Weight {
  final String id;
  final String id_user;
  final String weight;
  final String date;

  Weight({
    required this.id,
    required this.id_user,
    required this.weight,
    required this.date,
  });

  Weight.fromJson(Map<dynamic, dynamic> json)
      : id = json['id']?.toString() ?? '',
        id_user = json['id_user']?.toString() ?? '',
        weight = json['weight']?.toString() ?? '',
        date = json['date']?.toString() ?? '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_user': id_user,
        'weight': weight,
        'date': date
      };
}