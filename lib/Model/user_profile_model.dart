class UserProfileModel {
  final String? bloodGroup;
  final String? email;
  final String? password;
  final String? username;

  UserProfileModel(
      {this.password = '',
      this.email = '',
      this.bloodGroup = '',
      this.username = ''});
}
