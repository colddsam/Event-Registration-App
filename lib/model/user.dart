import 'dart:convert';

class userFields {
  static final String id = 'id';
  static final String name = 'name';
  static final String email = 'email';
  static final String phone = 'phone';
  static final String tsize = 't-shirt size';
  static final String preference = 'preference';
  static final String entered = 'got Entered';
  static final String swags = 'got Swags';
  static final String breakfast = 'got Breakfast';
  static final String lunch = 'got Lunch';
  static final String Quiz = 'win Quiz';
  static final String tshirt = 'got Tshirt';

  static List<String> getFields() => [
        id,
        name,
        email,
        phone,
        tsize,
        preference,
        entered,
        swags,
        breakfast,
        lunch,
        Quiz,
        tshirt
      ];
}

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String tsize;
  final String preference;
  final bool entered;
  final bool swags;
  final bool breakfast;
  final bool lunch;
  final bool quiz;
  final bool tshirt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.preference,
    required this.entered,
    required this.swags,
    required this.breakfast,
    required this.lunch,
    required this.quiz,
    required this.tsize,
    required this.tshirt,
  });

  User copy(
          {String? id,
          String? name,
          String? email,
          String? phone,
          String? tsize,
          String? preference,
          bool? entered,
          bool? swags,
          bool? breakfast,
          bool? lunch,
          bool? quiz,
          bool? tshirt}) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          phone: phone ?? this.phone,
          preference: preference ?? this.preference,
          entered: entered ?? this.entered,
          swags: swags ?? this.swags,
          breakfast: breakfast ?? this.breakfast,
          lunch: lunch ?? this.lunch,
          quiz: quiz ?? this.quiz,
          tsize: tsize ?? this.tsize,
          tshirt: tshirt ?? this.tshirt);

  static User fromJson(Map<String, dynamic> json) => User(
        id: json[userFields.id],
        name: json[userFields.name],
        email: json[userFields.email],
        phone: json[userFields.phone],
        tsize: json[userFields.tsize],
        preference: json[userFields.preference],
        tshirt: jsonDecode(json[userFields.tshirt]),
        entered: jsonDecode(json[userFields.entered]),
        swags: jsonDecode(json[userFields.swags]),
        breakfast: jsonDecode(json[userFields.breakfast]),
        lunch: jsonDecode(json[userFields.lunch]),
        quiz: jsonDecode(json[userFields.Quiz]),
      );

  Map<String, dynamic> toJson() => {
        userFields.id: id,
        userFields.email: email,
        userFields.entered: entered,
        userFields.breakfast: breakfast,
        userFields.lunch: lunch,
        userFields.name: name,
        userFields.swags: swags,
        userFields.tsize: tsize,
        userFields.Quiz: quiz,
        userFields.preference: preference,
        userFields.phone: phone,
        userFields.tshirt: tshirt
      };
}
