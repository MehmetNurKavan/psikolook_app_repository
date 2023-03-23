import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/blog/blog_share.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologHomePageNesxts/psikolog_home.dart';
import 'package:psikolook_anasayfa/view/home/psikologHome/psikologprofil/psikolog_profil.dart';

import '../view/home/psikologHome/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const psikolog_page(),
  const SearchScreen(),
  const BlogShare(),
  const Text('notifications'),
  PsikologProfil(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
