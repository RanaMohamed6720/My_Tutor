class UserModel {
  String name;
  String phone;
  String email;
  String password;
  String imageurl;
  String subject;
  String department;
  String id;

  UserModel(
      {this.name = '',
      this.phone = '',
      this.email = '',
      this.password = '',
      this.imageurl = '',
      this.subject = '',
      this.id = '',
      this.department = ''});

  // when uploading to database
  Map<String, dynamic> toMap({required UserModel user}) {
    return {
      'name': user.name,
      'phone': user.phone,
      'email': user.email,
      'password': user.password,
      'imageurl': user.imageurl,
      'subject': user.subject,
      'id': user.id,
      'department': user.department,
    };
  }

  // when fetching form database
  UserModel fromMap({required Map<String, dynamic> data}) {
    return UserModel(
      name: data['name'],
      phone: data['phone'],
      email: data['email'],
      password: data['password'],
      imageurl: data['imageurl'],
      subject: data['subject'],
      id: data['id'],
      department: data['department'],
    );
  }
}
