//  Future<void> signUp(String email, String password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       Get.snackbar("Success", "Account created successfully!");
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }

//   Future<void> signIn(String email, String password) async {
//     try {
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//       Get.snackbar("Success", "Signed in successfully!");
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }

//   Future<void> checkUser() async {
//     if (auth.currentUser != null) {
//       Get.offAll(() => CreateProfile());
//     }
//   }