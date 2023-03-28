import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_shop/data/data.dart';
import 'package:fruit_shop/screens/cart.dart';
import 'package:fruit_shop/screens/detail_screen.dart';
import 'package:fruit_shop/utils/utils.dart';
import 'package:fruit_shop/widgets/product_widget.dart';
import '../constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/user.png',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome back.',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: -0.3,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'Park Hyung Silk',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Cart();
                    }));
                  },
                  child: IconWidget(FontAwesomeIcons.bagShopping, true),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Get your fresh items ',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'with ',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'Hay Markets',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  width: 275,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(1, 3),
                        ),
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Search pinapple',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black26),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: kPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    FontAwesomeIcons.filter,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = index;
                          });
                        },
                        child: Container(
                          width: data[index].textLength,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: isSelected == index
                                      ? kPrimaryColor
                                      : Colors.transparent),
                            ),
                          ),
                          child: Text(data[index].name,
                              style: TextStyle(
                                  color: isSelected == index
                                      ? kPrimaryColor
                                      : Colors.black54,
                                  fontSize: 15)),
                        ),
                      ),
                    );
                  })),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.87),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data[0].products!.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: (()  {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DetailScreen(
                                product: data[0].products![index]))));
                  }),
                  child: ProductWidget(product: data[0].products![index]),
                );
              }),
            ),
          ],
        ),
      )),
    );
  }
}
