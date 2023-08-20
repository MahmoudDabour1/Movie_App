import 'package:flutter/material.dart';
import 'package:movies_with_clean/bottom_bar/widgets/item_bottom_bar_widget.dart';

import '../movies/presentation/screens/movie_screen.dart';
import '../search/presentation/screens/search_screen.dart';
import '../tvs/presentation/screens/tv_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;

  List<String> title = [
    'Movies',
    'Tv',
    'Search',
  ];

  List<IconData> icons = [
    Icons.movie,
    Icons.tv,
    Icons.search,
  ];

  final pages = [
    const MoviesScreen(),
    const TvScreen(),
    const SearchView(title: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomAppBar(
          child: Row(
            children: List.generate(
              title.length,
              (index) => ItemBottomBar(
                isSelected: index == currentIndex,
                text: title[index],
                icon: icons[index],
                onPress: () {
                  currentIndex = index;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
