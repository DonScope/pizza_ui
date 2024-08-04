import 'package:flutter/material.dart';
import 'package:pizza_ui/Screens/class.dart';
import 'package:pizza_ui/Screens/data.dart';
import 'package:pizza_ui/Screens/details.dart';

class menuScreen extends StatefulWidget {
  const menuScreen({super.key});

  @override
  State<menuScreen> createState() => _menuScreenState();
}

class _menuScreenState extends State<menuScreen> {
  List<dynamic> ic = [
    Icons.trending_up,
    Icons.whatshot,
    Icons.emoji_food_beverage,
    Icons.new_releases,
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: size.height * 0.35,
              decoration: BoxDecoration(color: Colors.white24, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 4),
                ),
              ]),
              child: ListView(children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text("Explore Menu",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Spacer(),
                    Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: size.width,
                  height: size.height * 0.15,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: Container(
                            width: size.width * 0.30,
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: size.height * 0.10,
                                    decoration: BoxDecoration(
                                      border: current == index
                                          ? Border.all(color: Colors.red)
                                          : Border.all(
                                              color: Colors.transparent),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("${menu_images[index]}"),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    menu[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: current == index
                                            ? Colors.red
                                            : Colors.black.withOpacity(0.7),
                                        fontWeight: current == index
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        width: size.width,
                                        height: size.height * 0.005,
                                        decoration: BoxDecoration(
                                          color: current == index
                                              ? Colors.red
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: menu_images.length),
                ),
                SizedBox(height: 20),
                Container(
                  height: size.height * 0.05,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: ic.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 212, 212, 212),
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(ic[index]),
                            Text(Filter[index]),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ),
            SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height * 0.6,
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: List.generate(
                    food_images.length,
                    (index) => InkWell(
                      onTap: () {
                        MenuItem menuItem = MenuItem(
                          image: food_images[index],
                          title: food_title[index],
                          description: food_d[index],
                          price: food_p[index],
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MenuItemPageWidget(menuItem: menuItem),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 320,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food_title[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              food_d[index],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 10),
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(food_images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      food_p[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "+ Add",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
