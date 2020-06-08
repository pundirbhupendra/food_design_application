import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_design_application/constants/constants.dart';
import 'package:food_design_application/model/Category.dart';
import 'package:google_fonts/google_fonts.dart';

import 'food_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 24),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset("assets/icons/menu.svg", width: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 0)
                        ]),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 20,
                    )),
              )
            ],
          ),
          SizedBox(height: 20),
          Text('ONLINE FOOD',
              style: GoogleFonts.oswald(
                  fontSize: 24.0, fontWeight: FontWeight.w500)),
          Text('SERVICES',
              style: GoogleFonts.oswald(
                  fontSize: 24.0, fontWeight: FontWeight.w500)),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                        border: InputBorder.none,
                        fillColor: Colors.grey.withOpacity(0.5),
                        prefixIcon: Icon(Icons.search, color: Colors.grey)),
                  ))),
          SizedBox(height: 20.0),
          TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Color(0xff0F0F0B),
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.oswald(
                  fontSize: 15.0, fontWeight: FontWeight.w500),
              unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 12.0, fontWeight: FontWeight.w500),
              tabs: [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBOS')),
                Tab(child: Text('FAVORITES')),
                Tab(child: Text('P')),
              ]),
          SizedBox(
            height: size.height * 0.3,
            child: TabBarView(controller: _tabController, children: [
              _buildFeaturedTabBar(size),
              _buildCombosTabBar(),
              _buildFavoritesTabBar(),
              _buildRecommendedTabBar()
            ]),
          ),
          SizedBox(height: 15),
          ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              child: Image.network(url)),
        ],
      ),
    )));
  }

  _buildFeaturedTabBar(Size size) {
    return ListView.builder(
        itemCount: foodCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodDetails(
                            foodCategories[index].name,
                            foodCategories[index].price,
                            foodCategories[index].foodImage)));
              },
              child: Container(
                width: size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Hero(
                      tag: foodCategories[index].name,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(foodCategories[index].foodImage,
                            height: 30.0, width: 30.0),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${foodCategories[index].name}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          color: commonColors[index],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$' + '${foodCategories[index].price}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          color: commonColors[index],
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: colors[index]),
              ),
            ),
          );
        });
  }

  _buildCombosTabBar() {
    return Container();
  }

  _buildFavoritesTabBar() {
    return Container();
  }

  _buildRecommendedTabBar() {
    return Container();
  }
}
