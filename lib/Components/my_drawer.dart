import 'package:ecommerace_app/Pages/home_page.dart';
import 'package:ecommerace_app/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut().then((_) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home_outlined,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text('H O M E'),
                  onTap: () {
                    // Pop Drawer
                    Navigator.pop(context);

                    // Navigate to Home page
                    Navigator.pushNamed(context, '/homepage');
                  },
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: const Text('C A T E G O R I E S '),
                    leading: const Icon(Icons.category_outlined),
                    children: [
                      ListTile(
                        title: const Text('Men'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(initialCategory: 'MEN'),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('Women'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(initialCategory: 'WOMEN'),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('Kids'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(initialCategory: 'KIDS'),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('Beauty'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(initialCategory: 'Beauty'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_outline,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text('P R O F I L E'),
                  onTap: () {
                    // Pop Drawer
                    Navigator.pop(context);

                    // Navigate to Profile page
                    Navigator.pushNamed(context, '/ProfilePage');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border_outlined,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text('W I S H L I S T'),
                  onTap: () {
                    // Pop Drawer
                    Navigator.pop(context);

                    // Navigate to Profile page
                    Navigator.pushNamed(context, '/WishListPage');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text('S E T T I N G S'),
                  onTap: () {
                    // Pop Drawer
                    Navigator.pop(context);

                    // Navigate to Profile page
                    Navigator.pushNamed(context, '/SettingsPage');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_center_outlined,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text('H E L P'),
                  onTap: () {
                    // Pop Drawer
                    Navigator.pop(context);

                    // Navigate to Profile page
                    Navigator.pushNamed(context, '/HelpPage');
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                leading: Icon(Icons.logout_rounded,
                    color: Theme.of(context).colorScheme.inversePrimary),
                title: const Text('Logout'),
                onTap: () {
                  logout(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
