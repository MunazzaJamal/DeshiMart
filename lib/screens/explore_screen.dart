import 'package:deshi_mart/customs/categories.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Find Products',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items in a row
                crossAxisSpacing: 10, // Spacing between columns
                mainAxisSpacing: 10, // Spacing between rows
                childAspectRatio: 0.8, // Aspect ratio of each item
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                // Define a list of colors to assign to the grid items
                List<Color> colors = [
                  Color.fromRGBO(83, 177, 117, 0.1),
                  Color.fromRGBO(248, 164, 76, 0.1),
                  Color.fromRGBO(247, 165, 147, 0.25),
                  Color.fromRGBO(211, 176, 224, 0.25),
                  Color.fromRGBO(253, 229, 152, 0.25),
                  Color.fromRGBO(183, 223, 245, 0.25),
                  Color.fromRGBO(83, 177, 117, 0.1),
                  Color.fromRGBO(248, 164, 76, 0.1),
                  Color.fromRGBO(247, 165, 147, 0.25),
                ];

                Color fillColor = colors[index % colors.length];

                return InkWell(
                  onTap: () {
                    print('Pressed $index');
                  },
                  child: Container(
                   
                    decoration: BoxDecoration(
                      color: fillColor, // Set the background color
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color.fromARGB(255, 170, 168, 168)),
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center content horizontally
                      children: [
                        Image.asset(
                          categories[index]['img'],
                          fit: BoxFit.contain,
                          height: 150, // Limit image height to control size
                          width: 150, // Limit image width to control size
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categories[index]['cat'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))

        //
        );
  }
}
