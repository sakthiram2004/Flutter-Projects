import 'package:flutter/material.dart';
import 'package:jiomart/screens/Categories/ShopCategory/CategoriesList.dart';
import 'package:jiomart/screens/Categories/ShopCategory/categorylist.dart';

class CategoryMainPage extends StatefulWidget {
  const CategoryMainPage({super.key});

  @override
  State<CategoryMainPage> createState() => _CategoryMainPageState();
}

class _CategoryMainPageState extends State<CategoryMainPage> {
  ListDesign ld = ListDesign();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 35.0,
            ),
            Text(
              "Categories",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 180.0,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
              size: 35.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              Icons.shopping_basket_outlined,
              color: Colors.white,
              size: 35.0,
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SingleChildScrollView(
                
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 150.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        //----------------call
                        CategoryList(
                            "assets/categories/glocery.png", "Groceries"),
                        SizedBox(
                          height: 20.0,
                        ),
                        CategoryList("assets/categories/electronices.png",
                            "Electronice"),
                        SizedBox(
                          height: 20.0,
                        ),
                        CategoryList(
                            "assets/categories/fashion.png", "Fashions"),
                        SizedBox(
                          height: 20.0,
                        ),
                        CategoryList(
                            "assets/categories/furniture.png", "Furnitures"),
                        SizedBox(
                          height: 20.0,
                        ),
                        CategoryList("assets/categories/homeappliences.png",
                            "Home Appliences"),
                        SizedBox(
                          height: 20.0,
                        ),
                        CategoryList("assets/categories/sports.png", "Sports"),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                thickness: 1,
              ),
              Container(
                  child: Column(
                children: [
                  ld.listTitle("Groceries"),
                  ld.catdesign("Fruits & Vegetables"),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
