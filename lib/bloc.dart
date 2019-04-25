import 'dart:async';

// Bloc Class for Drawer Navigation
class NavigationDrawerBloc {
  final navigationController = StreamController();
  NavigationProvider navigationProvider = new NavigationProvider();

  Stream get getNavigation => navigationController.stream;

  void updateNavigation(String navigation) {
    navigationProvider.updateNavigation(navigation);
    navigationController.sink.add(navigationProvider.currentNavigation);
  }

  void dispose() {
    navigationController.close();
  }
}

final bloc1 = NavigationDrawerBloc();

// Provider class for the Bloc
class NavigationProvider {
  String currentNavigation = "Home";

  void updateNavigation(String navigation) {
    currentNavigation = navigation;
  }
}
