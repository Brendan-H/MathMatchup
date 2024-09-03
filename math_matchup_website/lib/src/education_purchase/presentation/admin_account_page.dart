import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup_website/src/features/header/presentation/header.dart';
class AdminAccountPage extends ConsumerStatefulWidget {
  const AdminAccountPage({super.key});

  @override
  ConsumerState createState() => _AdminAccountPageState();
}

class _AdminAccountPageState extends ConsumerState<AdminAccountPage> {
  var obscurePassword;
  var obscureConfirmPassword;

  @override
  void initState() {
    obscurePassword = true;
    obscureConfirmPassword = true;
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          const Header(),
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: Text(
                    "Home",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        width: width * .45,
                        height: height * .625,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                          child: Column(
                            children: [
                              Text(
                                "Create Account",
                                style: Theme.of(context).textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Create your organization\'s main administrator account",
                                style: Theme.of(context).textTheme.displayMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: ListView(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        labelStyle: Theme.of(context).textTheme.displayMedium,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "Full Name",
                                        labelStyle: Theme.of(context).textTheme.displayMedium,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "School Name",
                                        labelStyle: Theme.of(context).textTheme.displayMedium,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextField(
                                      obscureText: obscurePassword,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: Theme.of(context).textTheme.displayMedium,
                                        border: OutlineInputBorder(),
                                        icon: IconButton(
                                          icon: Icon(
                                            obscurePassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              obscurePassword = !obscurePassword;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextField(
                                      obscureText: obscureConfirmPassword,
                                      decoration: InputDecoration(
                                        labelText: "Confirm Password",
                                        labelStyle: Theme.of(context).textTheme.displayMedium,
                                        border: OutlineInputBorder(),
                                        icon: IconButton(
                                          icon: Icon(
                                            obscureConfirmPassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              obscureConfirmPassword = !obscureConfirmPassword;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor, // background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // border shape
                                  ),
                                  minimumSize: Size(width * .3, 50), // button width and height
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Create Account",
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: width * .05),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        width: width * .45,
                        height: height * .625,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: Theme.of(context).textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Login to your organization\'s main administrator account",
                                style: Theme.of(context).textTheme.displayMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: Theme.of(context).textTheme.displayMedium,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                obscureText: obscurePassword,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: Theme.of(context).textTheme.displayMedium,
                                  border: OutlineInputBorder(),
                                  icon: IconButton(
                                    icon: Icon(
                                      obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ]
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
