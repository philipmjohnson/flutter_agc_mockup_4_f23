import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'features/authentication/presentation/signin_view.dart';
import 'features/authentication/presentation/signup_view.dart';
import 'features/chapter/presentation/chapters_view.dart';
import 'features/discussion/presentation/discussions_view.dart';
import 'features/garden/presentation/add_garden_view.dart';
import 'features/garden/presentation/edit_garden_view.dart';
import 'features/garden/presentation/gardens_view.dart';
import 'features/help/presentation/help_view.dart';
import 'features/help/presentation/help_view_local.dart';
import 'features/home/presentation/home_view.dart';
import 'features/outcome/presentation/outcomes_view.dart';
import 'features/page_not_found/presentation/page_not_found_view.dart';
import 'features/sample/presentation/sample_item_details_view.dart';
import 'features/seed/presentation/seeds_view.dart';
import 'features/settings/presentation/settings_controller.dart';
import 'features/settings/presentation/settings_view.dart';
import 'features/user/presentation/users_view.dart';

/// Top-level widget that implements routing to the appropriate page.
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: FlexThemeData.light(scheme: FlexScheme.gold),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.gold),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SigninView.routeName:
                    return SigninView();
                  case SignupView.routeName:
                    return const SignupView();
                  case HomeView.routeName:
                    return const HomeView();
                  case GardensView.routeName:
                    return const GardensView();
                  case AddGardenView.routeName:
                    return AddGardenView();
                  case EditGardenView.routeName:
                    return EditGardenView();
                  case ChaptersView.routeName:
                    return const ChaptersView();
                  case OutcomesView.routeName:
                    return const OutcomesView();
                  case SeedsView.routeName:
                    return const SeedsView();
                  case UsersView.routeName:
                    return const UsersView();
                  case DiscussionsView.routeName:
                    return const DiscussionsView();
                  case HelpView.routeName:
                    return const HelpView();
                  case HelpViewLocal.routeName:
                    return const HelpViewLocal();
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  default:
                    return const PageNotFoundView();
                }
              },
            );
          },
        );
      },
    );
  }
}
