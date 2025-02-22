import 'package:deshi_mart/customs/utils.dart';
import 'package:deshi_mart/screens/productDetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customTile(data) {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print('Pressed $index');
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(242, 243, 242, 1)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: DecorationImage(
                  image: AssetImage(data[index]['img']),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 10 : 15, top: index == 0 ? 40 : 15),
                child: Column(
                  children: [
                    Text(
                      data[index]['cat'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Get Upto 40% off',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget customTile2(data) {
  return SizedBox(
    height: 250,
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                print('Pressed');
                Get.to(ProductDetailScreen(product: data[index]));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 250,
                  width: 155,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 5),
                    child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      data[index]['img']), // Your image
                                  fit: BoxFit
                                      .fill, // Ensure the image covers the entire container
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(data[index]['name'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          //SizedBox(height: 5),
                          Text(data[index]['subtitle'],
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey)),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$ ${data[index]['price']}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              FloatingActionButton(
                                mini: true,
                                backgroundColor: AppColors.greenColor,
                                child: Icon(Icons.add),
                                onPressed: () {
                                  //onpressed
                                },
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ));
        }),
  );
}

