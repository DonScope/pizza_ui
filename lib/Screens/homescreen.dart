import 'package:flutter/material.dart';
import 'data.dart';
import 'class.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<dynamic> ic = [
    Icons.delivery_dining,
    Icons.directions_car,
    Icons.shopping_bag,
    Icons.restaurant,
  ];

  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.red,
    Colors.red,
    Colors.yellow,
    Colors.red,
  ];

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.menu),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SELECT LOCATION",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Al Mashtal",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_circle_down_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  width: size.width * 0.15,
                  height: size.height * 0.06,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: size.width,
              height: size.height * 0.13,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: size.width * 0.06),
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: Container(
                      width: size.width * 0.20,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: current == index
                                  ? Border.all(color: Colors.red)
                                  : Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white12,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              child: Icon(
                                ic[index],
                                color: Colors.black,
                                size: 35,
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            tabs[index].trimRight(),
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Stack(
                            children: [
                              Container(
                                width: size.width * 0.10,
                                height: size.height * 0.005,
                                decoration: BoxDecoration(
                                  color: current == index
                                      ? Colors.red
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                          Divider()
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              width: size.width,
              height: size.height * 0.2,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: img.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: reusable(img[index]));
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: size.width,
              height: size.height * 0.5,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Explore Menu 🍕",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black),
                          onPressed: () {
                            Navigator.pushNamed(context, "Explore");
                          },
                          child: Row(
                            children: [
                              Text("View All "),
                              Icon(Icons.exit_to_app)
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: 25),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6),
                      itemCount: menu.length,
                      itemBuilder: (context, i) {
                        current = i;
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                width: 120,
                                height: 110,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 4.0,
                                  ),
                                ),
                                child: CircleAvatar(
                                  maxRadius: 60,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("${menu_images[i]}"),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "${menu[i]}",
                                style: TextStyle(
                                    color: current == 0
                                        ? Colors.red
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Container(
                                width: size.width,
                                height: 3,
                                decoration: BoxDecoration(color: colors[i]),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  reusable(String image) {
    return Container(
      child: Image.asset(image),
    );
  }
}
