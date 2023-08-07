import 'package:flutter/material.dart';
import 'package:todoapp/feature/calendar/presentation/pages/add_event/add_event_page.dart';
import 'package:todoapp/feature/calendar/presentation/pages/home/calendar_page.dart';

import '../../feature/calendar/presentation/pages/edit/edit_page.dart';

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

    switch (settings.name) {
      case '/editevent':
        return MaterialPageRoute(
          builder: (context) => AddEvenetPage(
            isEditPage: true,
            id: args as int,
          ),
        );
    }

    switch (settings.name) {
      case '/edit':
        return MaterialPageRoute(
            builder: (context) => EditPage(data: args as Map<String, dynamic>));
    }

    return null;
  }
}
