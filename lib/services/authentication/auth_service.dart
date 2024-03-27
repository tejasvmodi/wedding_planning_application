import 'package:get/get.dart';
import 'package:wedding_planning_application/Models/data/registration_data.dart';
import 'package:wedding_planning_application/repository/authentication/authentication_repository.dart';

class AuthenticationService {
  final AuthenticationRepository authRepo = Get.find();

  Future<void> loginWithUsernameAndPassword(
      String email, String password) async {
    await authRepo.loginUserWithNameEmailAndPassword(email, password);
  }

  Future<void> registerUser(String firstName, String lastname, String email,
      String password, String couple) async {
     }

  Future<void> logOut() async {
    await authRepo.logOut();
  }
}
