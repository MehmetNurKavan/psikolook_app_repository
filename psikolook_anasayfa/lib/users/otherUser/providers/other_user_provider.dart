import 'package:flutter/widgets.dart';
import 'package:psikolook_anasayfa/users/otherUser/models/other_user.dart';
import 'package:psikolook_anasayfa/users/otherUser/service/other_auth_methods.dart';

class OtherUserProvider with ChangeNotifier {
  OtherUser? _user;
  final OtherAuthMethods _authMethods = OtherAuthMethods();

  OtherUser get getUser => _user!;

  Future<void> refreshUser() async {
    OtherUser user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
