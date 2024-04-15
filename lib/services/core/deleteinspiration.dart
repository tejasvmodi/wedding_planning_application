import 'package:wedding_planning_application/repository/Inspiration/deleteinspration.dart';

class Deleteinspiration{
  final Deleteinspirationrepo del = Deleteinspirationrepo();
  Future<void> deleteinspiration(int id) async {
      await del.deleteInspiration(id);
  }
}