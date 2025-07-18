import 'package:flutter/material.dart';

class SellerLogin extends StatelessWidget {
  const SellerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .24,
      width: screenWidth * .8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 73, 165, 239),
            const Color.fromARGB(255, 19, 3, 139),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            children: [
              Text(
                "Seller Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(height: 15),

              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: WidgetStateProperty.all(
                    BorderSide(color: Colors.white, width: 1.8),
                  ),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
