import 'package:flutter/material.dart';

class Sellersignup extends StatefulWidget {
  const Sellersignup({super.key});

  @override
  State<Sellersignup> createState() => _SellersignupState();
}

class _SellersignupState extends State<Sellersignup> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              // border: BoxBorder.all(color: Colors.grey),
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 02,
                  blurRadius: 05,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            height: screenHeight * .5,
            width: screenWidth * .7,
            // color: const Color.fromARGB(255, 244, 243, 243),
            child: Column(
              children: [
                SizedBox(height: 17),
                Text(
                  "Seller SignUp",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                _buildTextField("Store Name"),
                _buildTextField("Place"),
                _buildTextField("Email"),
                _buildTextField("Phone"),
                const SizedBox(height: 15),
                OutlinedButton(
                  
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: const Color.fromARGB(255, 168, 168, 168)),
        ),
      ),
    );
  }
}
