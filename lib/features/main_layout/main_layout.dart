import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app/features/main_layout/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/features/main_layout/tabs/home/home_tab.dart';
import 'package:evently_app/features/main_layout/tabs/map/map_tab.dart';
import 'package:evently_app/features/main_layout/tabs/porfile/profile_tab.dart';
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];
  int selectedIndex = 0;
  late AppLocalizations appLocalizations = AppLocalizations.of(context)!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFad(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFad(){
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, RoutesManager.createEvent);
      },
      child: Icon(Icons.add),
    );
  }

  BottomAppBar _buildBottomNavigationBar() {
    return BottomAppBar(
      notchMargin: 5,
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: appLocalizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 1 ? Icons.location_on : Icons.location_on_outlined,
            ),
            label: appLocalizations.map,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 2 ? Icons.favorite : Icons.favorite_border,
            ),
            label: appLocalizations.favourite,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 3 ? Icons.person : Icons.person_2_outlined,
            ),
            label: appLocalizations.profile,
          ),
        ],
      ),
    );
  }

  void _onTap(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}