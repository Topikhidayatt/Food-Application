import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_application/json/home_page_data.dart';
import 'package:food_application/pages/detail_product_page.dart';
import 'package:food_application/themes/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchMie = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 65,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/home.svg",
                width: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/shopping-cart.svg",
                width: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/user.svg",
                width: 30,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(child: getBody()),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 16, right: 15, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: primary, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: AssetImage("assets/images/profile.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "WarInd",
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 32),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "assets/images/shopping-cart.svg",
                      width: 25,
                      color: black,
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    child: SvgPicture.asset(
                      "assets/images/hamburger.svg",
                      width: 20,
                      color: black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          Text(
            "Every Micin is",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Good For The Brain",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: size.width,
            height: 42,
            child: TextField(
              controller: searchMie,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: -5, left: 20, right: 20),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                  gapPadding: 10,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                filled: true,
                fillColor: Color(0xffF8EFDE),
                hintText: "Search Mie",
              ),
            ),
          ),
          SizedBox(height: 25),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(category.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text(
                    category[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: index == 0 ? primary : Colors.black,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: size.width * 0.1,
            children: List.generate(
              menu.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailProduct(menu[index]);
                    }));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: AssetImage(menu[index]['img']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            menu[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "IDR " + menu[index]['price'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Container(
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primary,
                                  ),
                                  child: Center(
                                    child: Icon(Icons.add,
                                        size: 23, color: Colors.white),
                                  ),
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
            ),
          ),
        ],
      ),
    );
  }
}
