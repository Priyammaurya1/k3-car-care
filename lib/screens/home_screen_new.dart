import 'package:flutter/material.dart';
import 'package:k3carcare/models/horizontal_scroll.dart';
import 'package:k3carcare/widgets/banner_section_store.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 234, 231),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Welcome,',
                                style: TextStyle(
                                  // fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Text(
                                "Priyam Maurya",
                                style: TextStyle(
                                  // fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              color: Colors.grey.shade400,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: -10,
                                blurRadius: 40,
                                offset: const Offset(0, 10),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search item',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                BannerSection(),

                /// Banner
                SizedBox(height: 24),
                Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(color: Colors.black54),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              bottom: 10,
                            ),
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                transform: GradientRotation(
                                  390 * 3.1415927 / 180,
                                ), // Convert degrees to radians
                                colors: [
                                  Color.fromRGBO(210, 0, 0, 1),
                                  Color.fromRGBO(252, 43, 16, 1),
                                  Color.fromRGBO(186, 172, 48, 1),
                                ],
                                stops: [0.0, 0.44, 1.0],
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Services",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/car-wash.png',
                                      ),
                                      height: 45,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              bottom: 10,
                            ),
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                transform: GradientRotation(
                                  390 * 3.1415927 / 180,
                                ), // Convert degrees to radians
                                colors: [
                                  Color.fromRGBO(0, 210, 210, 1),
                                  Color.fromRGBO(16, 185, 252, 1),
                                  Color.fromRGBO(48, 82, 186, 1),
                                ],
                                stops: [0.0, 0.44, 1.0],
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Wash",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/car-wash.png',
                                      ),
                                      height: 45,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              bottom: 10,
                            ),
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                transform: GradientRotation(
                                  390 * 3.1415927 / 180,
                                ), // Convert degrees to radians
                                colors: [
                                  Color.fromRGBO(158, 172, 0, 1),
                                  Color.fromRGBO(0, 158, 13, 1),
                                  Color.fromRGBO(38, 148, 77, 1),
                                ],
                                stops: [0.0, 0.44, 1.0],
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Batteries",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/car-wash.png',
                                      ),
                                      height: 45,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              bottom: 10,
                            ),
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                transform: GradientRotation(
                                  390 * 3.1415927 / 180,
                                ), // Convert degrees to radians
                                colors: [
                                  Color.fromRGBO(210, 0, 0, 1),
                                  Color.fromRGBO(252, 16, 16, 1),
                                  Color.fromRGBO(186, 48, 48, 1),
                                ],
                                stops: [0.0, 0.44, 1.0],
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "K3\nGold Plan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/car-wash.png',
                                      ),
                                      height: 45,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      "Store",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See More',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                HorizontalServicesList(),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 10),
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Original Spare Parts',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text("Extended Warranty with K3 Car Care", style: TextStyle(color: Colors.grey[600], fontSize: 15),),
                    ],
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
