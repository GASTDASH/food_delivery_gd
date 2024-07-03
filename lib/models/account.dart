class Account {
  Account({
    required this.email,
    required this.password,
    required this.fullname,
    this.avatarAsset,
    required this.phone,
    this.addresses,
  });

  final String email;
  final String password;
  final String fullname;
  final String? avatarAsset;
  final String? phone;
  final List<String>? addresses;

  //
  // login
}

Account myAccount = Account(
  email: "gastdash@gmail.com",
  password: "1234qwer",
  fullname: "Alexey Shcherbakov",
  phone: "+79169906864",
);
