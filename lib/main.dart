import 'dart:math';
import 'package:flutter/material.dart';
import 'package:new_ecom/SellerSignup.dart';
// import 'package:new_ecom/SellerSignup.dart';
import 'package:new_ecom/buyerlogin.dart';
import 'package:new_ecom/buyerofferspage.dart';
import 'package:new_ecom/sellerlogin.dart'; // Make sure this exists

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showBuyer = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 140),

              // Flip animation between BuyerLogin and SellerLogin
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (child, animation) {
                  final rotateAnim = Tween(
                    begin: pi,
                    end: 0.0,
                  ).animate(animation);
                  return AnimatedBuilder(
                    animation: rotateAnim,
                    child: child,
                    builder: (context, child) {
                      final isUnder = (child!.key == const ValueKey('seller'));
                      var tilt = (animation.value - 0.5).abs() - 0.5;
                      tilt *= isUnder ? -0.003 : 0.003;
                      final value = isUnder
                          ? min(rotateAnim.value, pi / 2)
                          : rotateAnim.value;
                      return Transform(
                        transform: Matrix4.rotationY(value)
                          ..setEntry(3, 0, tilt),
                        alignment: Alignment.center,
                        child: child,
                      );
                    },
                  );
                },
                child: _showBuyer
                    ? const Buyerlogin(key: ValueKey('buyer'))
                    : const SellerLogin(key: ValueKey('seller')),
              ),

              const SizedBox(height: 30),

              // Toggle button
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showBuyer = !_showBuyer;
                  });
                },
                child: Container(
                  height: screenHeight * .05,
                  width: screenWidth * .6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 11, 55, 198),
                        Color.fromARGB(255, 42, 116, 255),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _showBuyer
                          ? "Switch to Seller Login >>>"
                          : "Switch to Buyer Login >>>",
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 300),
              // const Text("Check latest Offers Around You"),
              const SizedBox(height: 10),
              // const Text("New here? Sign Up With Our Seller Program"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Buyerofferspage()),
                  );
                },
                child: Text(
                  "Check latest Offers Around You",
                  style: TextStyle(color: Color.fromARGB(255, 11, 55, 198)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sellersignup()),
                  );
                },
                child: Text(
                  "New here? Sign Up With Our Seller Program",
                  style: TextStyle(color: Color.fromARGB(255, 11, 55, 198)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
