import 'package:auth_blocks/auth_blocks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_list/nav_list.dart';
import 'package:navigation/injection.dart';

bool isLoggedIn() {
  return (di<CheckLoggedInUseCase>().call()).foldRight(false, (r, _) => r);
}

String? authRedirect(BuildContext context, GoRouterState state) {
  if (!isLoggedIn()) return AuthNav.login.fullpath;
  return null;
}

String? guestRedirect(BuildContext context, GoRouterState state) {
  if (isLoggedIn()) return HomeNav.home.fullpath;
  return null;
}
