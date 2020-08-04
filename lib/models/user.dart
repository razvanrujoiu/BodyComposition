class User {
  final String uuid;
  final String name;
  final String surname;
  final String email;
  final double age;
  final double height;
  final double weight;

  User(this.uuid, this.name, this.surname, this.email, this.age, this.height,
      this.weight);

  User.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'],
        name = json['name'],
        surname = json['surname'],
        email = json['email'],
        age = json['age'],
        height = json['height'],
        weight = json['weight'];

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'name': name,
        'surname': surname,
        'email': email,
        'age': age,
        'height': height,
        'weight': weight
      };
}
