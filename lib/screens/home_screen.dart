import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantapp/const/constants.dart';
import 'package:plantapp/model/plantAPI.dart';
import 'package:plantapp/screens/detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;
  List<Plant> _PlantItems = Plant.plantList;

  final List<String> _plantTypes = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل‌کار |',
    '| گل باغچه‌ایی |',
    '| گل سمی |',
  ];

  @override
  Widget build(BuildContext context) {
    Size emulatorSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // SEARCH BOX
              Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                width: emulatorSize.width * 0.9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Constants.themeColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.mic),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          hintText: "جستجو...",
                          border: InputBorder.none,
                        ),
                        cursorColor: Constants.iconsColor,
                        cursorWidth: 1,
                      )),
                    ),
                    const Icon(Icons.search),
                  ],
                ),
              ),
              // CATEGORY
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 30,
                width: emulatorSize.width * 0.9,
                child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantTypes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          _plantTypes[index],
                          style: TextStyle(
                            // fontFamily: 'IRANSans.ttf',
                            fontSize: 17,
                            fontWeight: selectedCategory == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: selectedCategory == index
                                ? Constants.themeColor
                                : Constants.itemColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Product one
              const SizedBox(height: 20),
              SizedBox(
                height: emulatorSize.height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _PlantItems.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: DetailPage(
                              plantId: _PlantItems[index].plantId,
                            ),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        // padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: Constants.themeColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: _PlantItems[index].isFavorated
                                    ? IconButton(
                                        color: Constants.themeColor,
                                        icon: const Icon(Icons.favorite),
                                        onPressed: () {
                                          setState(() {
                                            _PlantItems[index].isFavorated =
                                                !_PlantItems[index].isFavorated;
                                          });
                                        },
                                      )
                                    : IconButton(
                                        color: Constants.themeColor,
                                        icon: const Icon(Icons.favorite_border),
                                        onPressed: () {
                                          setState(
                                            () {
                                              _PlantItems[index].isFavorated =
                                                  !_PlantItems[index]
                                                      .isFavorated;
                                            },
                                          );
                                        },
                                      ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              left: 50,
                              right: 50,
                              bottom: 50,
                              child: Image.asset(_PlantItems[index].imageURL),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 25,
                              child: Text(
                                _PlantItems[index].category,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'iransans',
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 5,
                              child: Text(
                                _PlantItems[index].plantName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'iransans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                                left: 10,
                                bottom: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    r'$' + _PlantItems[index].price.toString(),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topEnd,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                child: const Text(
                  "گیاهان جدید",
                  style: TextStyle(
                    fontFamily: 'iransans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // ProDuct 2
              Container(
                height: emulatorSize.height * 0.3,
                clipBehavior: Clip.none,
                child: ListView.builder(
                  itemCount: _PlantItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                    plantId: _PlantItems[index].plantId),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        width: emulatorSize.width,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Constants.themeColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Image.asset(
                                    './Assets/images/PriceUnit-green.png',
                                    height: 15,
                                  ),
                                ),
                                Text(
                                  _PlantItems[index].price.toString(),
                                  style: TextStyle(
                                    color: Constants.themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'iransans',
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Constants.themeColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  bottom: 0,
                                  child: Image.asset(
                                    _PlantItems[index].imageURL,
                                    height: 70,
                                  ),
                                ),
                                Positioned(
                                  right: 70,
                                  bottom: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        textAlign: TextAlign.right,
                                        _PlantItems[index].category,
                                        style: TextStyle(
                                          color: Constants.iconsColor,
                                          fontFamily: 'iransans',
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        _PlantItems[index].plantName,
                                        style: TextStyle(
                                          color: Constants.iconsColor,
                                          fontFamily: 'iransans',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
