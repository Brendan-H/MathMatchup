import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_matchup_website/src/education_purchase/repository/admin_account_creation_or_login.dart';
import 'package:math_matchup_website/src/features/header/presentation/header.dart';
class AdminAccountPage extends ConsumerStatefulWidget {
  const AdminAccountPage({super.key});

  @override
  ConsumerState createState() => _AdminAccountPageState();
}

class _AdminAccountPageState extends ConsumerState<AdminAccountPage> {
  var obscurePassword;
  var obscureConfirmPassword;
  late TextEditingController _createEmailController;
  late TextEditingController _nameController;
  late TextEditingController _roleController;
  late TextEditingController _schoolController;
  late TextEditingController _createPasswordController;
  late TextEditingController _confirmCreatePasswordController;
  late TextEditingController _loginEmailController;
  late TextEditingController _loginPasswordController;


  @override
  void initState() {
    obscurePassword = true;
    obscureConfirmPassword = true;
    _createEmailController = TextEditingController();
    _nameController = TextEditingController();
    _roleController = TextEditingController();
    _schoolController = TextEditingController();
    _createPasswordController = TextEditingController();
    _confirmCreatePasswordController = TextEditingController();
    _loginEmailController = TextEditingController();
    _loginPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _createEmailController.dispose();
    _nameController.dispose();
    _roleController.dispose();
    _schoolController.dispose();
    _createPasswordController.dispose();
    _confirmCreatePasswordController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    super.dispose();
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
                                      controller: _createEmailController,
                                    ),
                                    const SizedBox(height: 10),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "Full Name",
                                        labelStyle: Theme.of(context).textTheme.displayMedium,
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: _nameController,
                                    ),
                                    const SizedBox(height: 10),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "School Name",
                                        labelStyle: Theme.of(context).textTheme.displayMedium,
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: _schoolController,
                                    ),
                                    const SizedBox(height: 10),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "Role in School",
                                        labelStyle: Theme.of(context).textTheme.displayMedium,
                                        hintText: "Ex. Principal, Tech Lead",
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: _schoolController,
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
                                      controller: _createPasswordController,
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
                                      controller: _confirmCreatePasswordController,
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
                                onPressed: () async {
                                  await createAdminAccount(_createEmailController.text,
                                      _nameController.text,
                                      _schoolController.text,
                                      _roleController.text,
                                      _createPasswordController.text,
                                    _confirmCreatePasswordController.text
                                  );
                                },
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
                                controller: _loginEmailController,
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
                                controller: _loginPasswordController,
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
