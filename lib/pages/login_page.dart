import 'package:flutter/material.dart';
import 'package:widgethub/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  Image.asset('assets/images/login.png', fit: BoxFit.fill),

                  const SizedBox(height: 20),

                  Text(
                    'Welcome $username to the Login Page',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       print('Login button pressed');
                  //       Navigator.pushNamed(context, MYRoutes.homeRoute);
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       padding: const EdgeInsets.symmetric(vertical: 14),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //     ),
                  //     child: const Text('Login'),
                  //   ),
                  // ),
                  AnimatedContainer(
                    width: changeButton ? 150 : double.infinity,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(
                        changeButton ? 50 : 8,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            changeButton = true;
                          });
                          print('Login button pressed');
                          await Future.delayed(
                            const Duration(milliseconds: 300),
                          );
                          // Navigate to the home page after the animation
                          Navigator.pushNamed(context, MYRoutes.homeRoute);
                        },
                        borderRadius: BorderRadius.circular(
                          changeButton ? 50 : 8,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Center(
                            child: changeButton
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.blue),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('assets/images/login.png', fit: BoxFit.fill),
//               const SizedBox(height: 20),
//               const Text(
//                 'Welcome to the Login Page',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),

//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 20,
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Username',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 20,
//                     ),
//                     child: TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add your login logic here
//                   print('Login button pressed');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 12,
//                     horizontal: 24,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 child: const Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//     // return const Material(child: Center(child: Text('Login')));
//   }
// }
