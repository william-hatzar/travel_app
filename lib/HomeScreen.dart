import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataClass {
  final String name;
  final String url;
  final String continent;

  DataClass({required this.name, required this.url, required this.continent});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedContinent;
  int? touchedIndex;
  List<DataClass> items = [
    DataClass(
        name: "Barcelona", url: "images/barcelona.png", continent: "Europe"),
    DataClass(
        name: "Amsterdam", url: "images/amsterdam.png", continent: "Europe"),
    DataClass(name: "Bali", url: "images/bali.png", continent: "Indonesia"),
    DataClass(name: "Dubai", url: "images/daubai.png", continent: "UAE"),
    DataClass(
        name: "New York", url: "images/new_york.png", continent: "America"),
    DataClass(name: "Palma", url: "images/palma.png", continent: "America"),
  ];

  List<DataClass> filteredItems = [];
  Set<String> uniqueContinents = Set();

  @override
  void initState() {
    super.initState();
    items.forEach((item) {
      uniqueContinents.add(item.continent);
    });
    filteredItems = List.from(items); // Initialize filteredItems with all items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset(
                  "images/ic_Hamburguer@1x.png"), // Check the image path
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage:
              AssetImage('images/User@1x.png'), // Check the image path
            ),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Find your",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.w600)),
            const Text("next holiday",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount:
                uniqueContinents.length + 1, // Add 1 for "All" filter
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContinent = null; // Reset selected continent
                          filteredItems = List.from(items); // Show all items
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: EdgeInsets.only(top: 5),
                              height: 10,
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlueAccent),
                              child: const Text("All",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17)))),
                    );
                  } else {
                    String continent = uniqueContinents.elementAt(index - 1);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContinent = continent;
                          filteredItems = items
                              .where(
                                  (item) => item.continent == selectedContinent)
                              .toList();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 10,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightBlueAccent),
                            child: Text(continent,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17))),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: filteredItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        print(items[index].name);
                      },
                      onTapDown: (_) {
                        setState(() {
                          touchedIndex = index;
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          touchedIndex = null;
                        });
                      },
                      child: SizedBox(
                        width: 150, // Adjust the width as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(filteredItems[index].url),
                            ),
                            const SizedBox(height: 10), // Add space between image and text
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,color: Colors.grey,),
                                const SizedBox(width: 8),
                                Text(
                                  filteredItems[index].name,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
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
            const Text("What would you like?", textAlign: TextAlign.start, style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600, color: Colors.black, fontSize: 25))
          ],
        ),
      ),
      );
  }
}
