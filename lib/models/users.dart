class Users {
  int? _id;
  String? _prenom;
  String? _nom;
  String? _address;
  String? _phone;
  String? _email;
  String? _passwords;
  String? _createdAt;

  Users(
    this._prenom,
    this._nom,
    this._phone,
    this._email,
    this._address,
    this._passwords,
    this._createdAt,
  );

  Users.withId(
    this._id,
    this._prenom,
    this._nom,
    this._phone,
    this._email,
    this._address,
    this._passwords,
    this._createdAt,
  );

  //int get id=>_id!;

  int get id {
    return _id!;
  }

  String get prenom {
    return _prenom!;
  }

  String get nom {
    return _nom!;
  }

  String get phone {
    return _phone!;
  }

  String get address {
    return _address!;
  }

  String get email {
    return _email!;
  }

  String get passwords {
    return _passwords!;
  }

  String get createdAt {
    return _createdAt!;
  }

  set prenom(String newPrenom) {
    if (newPrenom.length <= 200) {
      this._prenom = newPrenom;
    }
  }

  set nom(String newNom) {
    if (newNom.length <= 200) {
      this._prenom = newNom;
    }
  }

  set phone(String newphone) {
    if (newphone.length <= 200) {
      this._phone = newphone;
    }
  }

  set email(String newemail) {
    if (newemail.length <= 200) {
      this._email = newemail;
    }
  }

  set address(String newaddress) {
    if (newaddress.length <= 200) {
      this._address = newaddress;
    }
  }

  set passwords(String newpasswords) {
    if (newpasswords.length <= 200) {
      this._passwords = newpasswords;
    }
  }

  set createdAt(String newcreatedAt) {
    if (newcreatedAt.length <= 200) {
      this._createdAt = newcreatedAt;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['prenom'] = _prenom;
    map['nom'] = _nom;
    map['address'] = _address;
    map['phone'] = _phone;
    map['email'] = _email;
    map['passwords'] = _passwords;
    map['createdAt'] = _createdAt;
    return map;
  }

  Users.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._prenom = map['prenom'];
    this._nom = map['nom'];
    this._address = map['address'];
    this._phone = map['phone'];
    this._email = map['email'];
    this._passwords = map['passwords'];
    this._createdAt = map['createdAt'];
  }
}
