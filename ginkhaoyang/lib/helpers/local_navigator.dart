import 'package:flutter/cupertino.dart';
import 'package:ginkhaoyang/constants/controllers.dart';
import 'package:ginkhaoyang/routing/router.dart';
import 'package:ginkhaoyang/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: homePageRoute,
    );