import 'package:flutter/widgets.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/psikolog_user.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';

class PsikologUserProvider with ChangeNotifier {
  PsikologUser? _user;
  final AuthMethods _authMethods = AuthMethods();

  PsikologUser get getUser => _user!;

  Future<void> refreshUser() async {
    PsikologUser user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
