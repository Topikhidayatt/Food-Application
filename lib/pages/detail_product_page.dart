import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_application/json/home_page_data.dart';
import 'package:food_application/themes/colors.dart';

class DetailProduct extends StatefulWidget {
  final Map<String, dynamic> detail;

  DetailProduct(this.detail);
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      padding: EdgeInsets.only(right: 40, left: 40),
      width: size.width,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.black.withOpacity(0.3), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "IDR " +  widget.detail['price'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: 163,
            height: 56,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: Hero(
                  tag: 'detail',
                  child: Image(
                    image: AssetImage(widget.detail['img']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  width: double.infinity,
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.white.withOpacity(0.6)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Icon(Icons.arrow_back,
                                  size: 20, color: Colors.white),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.white.withOpacity(0.6)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Icon(Icons.favorite_border,
                                  size: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            width: 90,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset("assets/images/stars.svg"),
                                SizedBox(width: 10),
                                Text(widget.detail['rate'],
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          Container(
                            width: 138,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 40,
                                    height: 40,
                                    color: Colors.black,
                                    child: Center(
                                        child: SvgPicture.asset(
                                      "assets/images/minus.svg",
                                      color: Colors.white,
                                      width: 10,
                                    )),
                                  ),
                                ),
                                Text("2",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    width: 43,
                                    height: 42,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/images/plus.svg",
                                        color: Colors.white,
                                        width: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.detail['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Indomie dengan rasa yang pas dan pedas yang nampol bikin ketagihan di tampol",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff667178),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Toping",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Stack(
                          children: [
                            Container(
                              width: 166,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/toping_1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: IconButton(
                                onPressed: () {},
                                icon: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.bottomRight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: primary,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/plus.svg",
                                      color: Colors.white,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Stack(
                          children: [
                            Container(
                              width: 166,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/toping_2.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: IconButton(
                                onPressed: () {},
                                icon: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.bottomRight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: primary,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/plus.svg",
                                      color: Colors.white,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Stack(
                          children: [
                            Container(
                              width: 166,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/toping_3.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: IconButton(
                                onPressed: () {},
                                icon: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.bottomRight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: primary,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/plus.svg",
                                      color: Colors.white,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Stack(
                          children: [
                            Container(
                              width: 166,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/toping_1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: IconButton(
                                onPressed: () {},
                                icon: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.bottomRight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: primary,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/plus.svg",
                                      color: Colors.white,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Similar Product",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
          ),
        ],
      ),
    );
  }
}
