import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/presentation/providers/auth_provider.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/screens/guides/guides_page.dart';
import 'package:skill_core/presentation/screens/tests/tests_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.my_library_books),
      label: 'Guides',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'Tests'),
  ];

  final List<Widget> bottomNavBarPages = [GuidesPage(), TestsPage()];
  int currentPage = 0;

  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (prev, next) {
      next.when(
        data: (state) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          context.go(welcomeRoute);
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text((error as AuthState).errorMessage!)),
          );
        },
        loading: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Center(child: CircularProgressIndicator())),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.push(settingsRoute);
            },
            icon: Icon(Icons.account_circle_rounded, size: 40),
          ),
        ],
      ),
      body: IndexedStack(index: currentPage, children: bottomNavBarPages),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItems,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
