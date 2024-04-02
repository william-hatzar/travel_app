import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/constants/Constants.dart';
import 'package:travel_app/models/FlightsModel.dart';
import 'package:travel_app/models/TripModel.dart';
import 'package:travel_app/models/TripModelSink.dart';
import 'package:travel_app/widgets/BottomNavBar.dart';
import 'package:travel_app/widgets/CountryFilterButtons.dart';
import 'package:travel_app/widgets/CountryListViewBuilder.dart';
import 'package:travel_app/widgets/FlightsListBuilder.dart';
import 'package:travel_app/widgets/Subheading.dart';
import 'package:travel_app/widgets/TitleWidget.dart';

import 'models/FlightModelSink.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCountry;
  int? touchedIndex;
  List<Widget> stars = [];

  List<TripModel> filteredItems = [];
  List<FlightModel> flightItems = [];
  Set<String> uniqueCountries = Set();

  @override
  void initState() {
    super.initState();
    items.forEach((item) {
      uniqueCountries.add(item.country);
    });
    filteredItems = List.from(items);
    flightItems = List.from(flights); // Initialize filteredItems with all items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(hamburgerAsset), // Check the image path
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage(userAsset), // Check the image path
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
              TitleWidget(title: dashboard),
              const SizedBox(height: 5),
              SubheadingWidget(title: yourFlights),
              const SizedBox(height: 15),
              FlightsListViewBuilder(flightItems: flightItems),
              const SizedBox(height: 8),
              SubheadingWidget(title: explorePlaces),
              const SizedBox(height: 20),
              CountryFilterButtons(
                uniqueCountries: uniqueCountries,
                filteredItems: filteredItems,
                updateFilteredItems: (List<TripModel> items) {
                  setState(() {
                    filteredItems = items;
                  });
                },
                selectedCountry: selectedCountry,
                updateSelectedCountry: (String? country) {
                  setState(() {
                    selectedCountry = country;
                  });
                },
              ),
              const SizedBox(height: 20),
              CountryListViewBuilder(filteredItems: filteredItems)
            ],
          ),
        ),
        bottomNavigationBar: bottomNavBar());
  }
}
