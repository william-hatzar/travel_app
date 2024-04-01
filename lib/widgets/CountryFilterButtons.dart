import 'package:flutter/material.dart';
import '../models/TripModel.dart';
import '../models/TripModelSink.dart';

class CountryFilterButtons extends StatefulWidget {
  final Set<String> uniqueCountries;
  final List<TripModel> filteredItems;
  final Function(List<TripModel>) updateFilteredItems;
  final String? selectedCountry;
  final Function(String?) updateSelectedCountry; // Add this line

  const CountryFilterButtons({
    Key? key,
    required this.uniqueCountries,
    required this.filteredItems,
    required this.updateFilteredItems,
    required this.selectedCountry,
    required this.updateSelectedCountry, // Update constructor
  }) : super(key: key);

  @override
  State<CountryFilterButtons> createState() => _CountryFilterButtonsState();
}

class _CountryFilterButtonsState extends State<CountryFilterButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: widget.uniqueCountries.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.updateSelectedCountry(null); // Update selectedCountry
                  widget.updateFilteredItems(List.from(items));
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 8, top: 8, bottom: 8),
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 10,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff63D1D9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    "All",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            );
          } else {
            String continent = widget.uniqueCountries.elementAt(index - 1);
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.updateSelectedCountry(continent); // Update selectedCountry
                  widget.updateFilteredItems(items.where((item) => item.country == continent).toList());
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  height: 10,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff63D1D9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    continent,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
