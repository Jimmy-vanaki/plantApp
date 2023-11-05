import 'package:flutter/material.dart';
import 'package:plantapp/const/constants.dart';
import 'package:plantapp/model/plantAPI.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({
    super.key,
    required this.plantId,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Plant> plantItems = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // app bar
          Positioned(
            top: 40,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Constants.themeColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  // X Button
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Constants.themeColor,
                    ),
                  ),
                ),
                // Favority Buttons
                Container(
                  decoration: BoxDecoration(
                    color: Constants.themeColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: plantItems[widget.plantId].isFavorated
                      ? IconButton(
                          onPressed: () {
                            setState(
                              () {
                                plantItems[widget.plantId].isFavorated =
                                    !plantItems[widget.plantId].isFavorated;
                              },
                            );
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Constants.themeColor,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(
                              () {
                                plantItems[widget.plantId].isFavorated =
                                    !plantItems[widget.plantId].isFavorated;
                              },
                            );
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Constants.themeColor,
                          ),
                        ),
                ),
              ],
            ),
          ),
          // Plant Feature
          Positioned(
            top: 100,
            child: Container(
              height: size.height * 0.8,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 10,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                              title: "اندازه گیاه",
                              plantFeature: plantItems[widget.plantId].size),
                          PlantFeature(
                              title: "رطوبت هوا",
                              plantFeature: plantItems[widget.plantId]
                                  .humidity
                                  .toString()),
                          PlantFeature(
                              title: "دمای نگهداری",
                              plantFeature:
                                  plantItems[widget.plantId].temperature),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Plant Image
          Positioned(
            top: 100,
            left: 10,
            child: SizedBox(
              height: 350,
              child: Image.asset(
                plantItems[widget.plantId].imageURL,
              ),
            ),
          ),
          // Plant Description
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 50, right: 30, left: 30, bottom: 30),
              width: size.width,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                color: Constants.themeColor.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    plantItems[widget.plantId].plantName,
                    style: TextStyle(
                      fontFamily: 'iransans',
                      color: Constants.themeColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Constants.themeColor,
                                size: 30,
                              ),
                              Text(
                                plantItems[widget.plantId].rating.toString(),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.themeColor,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Image.asset(
                                  './Assets/images/PriceUnit-green.png',
                                  height: 22,
                                ),
                              ),
                              Text(
                                plantItems[widget.plantId].price.toString(),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.iconsColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        plantItems[widget.plantId].decription,
                        style: TextStyle(
                            color: Constants.iconsColor,
                            fontSize: 16,
                            fontFamily: 'iransans',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 40),
        width: size.width * 1,
        padding: const EdgeInsets.only(left: 40 , right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Constants.themeColor,
              child: const Icon(Icons.add_shopping_cart),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Constants.themeColor,
                ),
                child: const Text(
                  "افزودن به سبد خرید",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'iransans',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  final String title;
  final String plantFeature;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'iransans',
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.themeColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'iransans',
          ),
        ),
      ],
    );
  }
}
