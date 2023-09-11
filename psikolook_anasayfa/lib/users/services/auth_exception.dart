  firebaseException(res, e) {
    if (e.code == 'email-already-in-use') {
      res = 'zaten kullanımda olan e-posta';
    } else if (e.code == 'invalid-email') {
      res = 'e-posta adresi geçerli değil';
    } else if (e.code == 'user-not-found') {
      res = 'kullanıcı bulunamadı';
    } else if (e.code == 'weak-password') {
      res = 'zayıf şifre';
    } else if (e.code == 'user-not-found') {
      res = 'kullanıcı bulunamadı';
    } else if (e.code == 'wrong-password') {
      res = 'yanlış şifre';
    }
    return res;
  }