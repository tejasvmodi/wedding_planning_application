import 'package:get/get.dart';
import 'package:wedding_planning_application/models/data/registration_data.dart';
import 'package:wedding_planning_application/repository/authentication/authentication_repository.dart';

class AuthenticationService {
  final AuthenticationRepository authRepo = Get.find();

  Future<void> loginWithUsernameAndPassword(
      String email, String password) async {
    await authRepo.loginUserWithNameEmailAndPassword(email, password);
  }

  Future<void> registerUser(String firstName, String lastname, String email,
      String password, String couple) async {
        await authRepo.registerUser(Registrationdata(firstName:firstName , lastName: lastname, email: email, password: password, couple: couple, ));
     }

  Future<void> logOut() async {
    await authRepo.logOut();
  }
}
