part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  static DocumentReference userDoc;

  static Future<void> updateUser(Users users) async {
    userCollection.doc(users.uid).set({
      'uid': users.uid,
      'email': users.email,
      'name': users.name,
      'profilepicture': users.profilePicture ?? ""
    });
  }
}

String username = "";
String email = "";

class GetUserData {
  static Future<void> getCurrentUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    DocumentReference users =
        FirebaseFirestore.instance.collection("Users").doc(uid);
    DocumentSnapshot snapshot = await users.get();
    email = snapshot.data()["email"];
    username = snapshot.data()["name"];
    return;
  }
}
