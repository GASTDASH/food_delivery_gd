import 'package:food_delivery_gd/supabase.dart';

class Account {
  Account({
    required this.email,
    required this.fullname,
    this.avatarAsset,
    this.phone,
    this.addresses,
  });

  String email;
  String fullname;
  String? avatarAsset;
  String? phone;
  List<String>? addresses;

  // factor
  void update() async {
    var res = await supabase
        .from("accounts")
        .select("fullname")
        .eq("id", supabase.auth.currentSession!.user.id)
        .single();
    String fullname = res["fullname"];

    email = supabase.auth.currentSession!.user.email!;
    this.fullname = fullname;
  }
}

Future<void> accountLogin({
  required String email,
  required String password,
}) async {
  try {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    rethrow;
  }
}

Future<void> accountSignUp({
  required String email,
  required String password,
  required String fullname,
}) async {
  try {
    await supabase.auth.signUp(
      email: email,
      password: password,
    );

    accountLogin(email: email, password: password);

    String id = supabase.auth.currentSession!.user.id;

    await supabase.from("accounts").insert(
      {
        "id": id,
        "fullname": fullname,
      },
    );
  } catch (e) {
    rethrow;
  }
}

late Account account;
