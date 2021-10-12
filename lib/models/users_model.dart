final String tableUser = 'users';

class UsersField {
  static final List<String> values = [id, prenom, nom, phone, email];

  static final String id = '_id';
  static final String prenom = 'prenom';
  static final String nom = 'nom';
  static final String address = 'address';
  static final String phone = 'phone';
  static final String email = 'email';
  static final String passwords = 'passwords';
  //static final String createdAt = 'createdAt';
}

class UsersModel {
  int? id;
  String? prenom;
  String? nom;
  String? address;
  String? phone;
  String? email;
  String? passwords;
  //String? createdAt;

  UsersModel({
    this.id,
    required this.prenom,
    required this.nom,
    required this.phone,
    required this.email,
    required this.address,
    this.passwords,
    //this.createdAt,
  });

  UsersModel copy({
    int? id,
    String? prenom,
    String? nom,
    String? address,
    String? phone,
    String? email,
    String? passwords,
    //String? createdAt,
  }) =>
      UsersModel(
        id: id ?? this.id,
        prenom: prenom ?? this.prenom,
        nom: nom ?? this.nom,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        address: address ?? this.address,
        passwords: passwords ?? this.passwords,
        //createdAt: createdAt ?? this.createdAt,
      );

  static UsersModel fromJson(Map<String, Object?> json) => UsersModel(
        id: json[UsersField.id] as int?,
        prenom: json[UsersField.prenom] as String?,
        nom: json[UsersField.nom] as String?,
        phone: json[UsersField.phone] as String?,
        email: json[UsersField.email] as String?,
        address: json[UsersField.address] as String?,
      );

  Map<String, Object?> toJson() => {
        UsersField.id: id,
        UsersField.prenom: prenom,
        UsersField.nom: nom,
        UsersField.phone: phone,
        UsersField.email: email,
        UsersField.address: address,
        UsersField.passwords: passwords,
        //UsersField.createdAt: createdAt,
      };
}
