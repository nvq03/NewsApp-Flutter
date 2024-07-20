class Users {
  String? username;
  String? email;
  String? password;
  
  Users({this.username, this.email, this.password});

  factory Users.fromJson(Map<String,dynamic> json){
    return Users(
      username: json['username'],
      email: json['email'],
      password: json['password'],

    );
  }

  Map<String, dynamic> toJson(){
    return {
       'username': username,
       'email': email,
       'password': password
    };
  }

}