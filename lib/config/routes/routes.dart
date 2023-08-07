import 'package:flutter/material.dart';
import 'package:todoapp/feature/calendar/presentation/pages/add_event/add_event_page.dart';
import 'package:todoapp/feature/calendar/presentation/pages/home/calendar_page.dart';

class RouterController {
  static final RouterController _inherentce = RouterController._init();

  static RouterController get inherentce => _inherentce;

  RouterController._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/main':
        return MaterialPageRoute(builder: (context) => const CalendarPage());
    }

    switch (settings.name) {
      case '/addevent':
        return MaterialPageRoute(builder: (context) => const AddEvenetPage());
    }

    return null;
  }
}
