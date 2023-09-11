/* 
//! null chach operator null value yuzunden kaldırdık
import 'package:flutter/widgets.dart';
import 'package:psikolook_anasayfa/users/psikologUser/models/psikolog_user.dart';
import 'package:psikolook_anasayfa/users/psikologUser/service/auth_methods.dart';

class PsikologUserProvider with ChangeNotifier {
  PsikologUser? _user;
  final AuthMethods _authMethods = AuthMethods();

  PsikologUser? get getUser => _user;

  Future<void> refreshUser() async {
    PsikologUser user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
//! eklersen maine aşşağıdaki şeklinde ekle
 MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OtherUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PsikologUserProvider(),
        ),
      ],
      child:  MaterialApp .....

 */

/*
import 'package:flutter/widgets.dart';
import 'package:purple/models/user.dart';
import 'package:purple/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  bool get isLoggedIn => _user != null; // <---------- added

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}

and..
or screen widget use
if (userProvider.isLoggedIn) {
   // TODO: do what you want such as returning user's name
   return userProvider.getUser.name;
}
 */