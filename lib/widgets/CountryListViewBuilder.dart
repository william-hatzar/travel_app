import 'package:flutter/material.dart';
import 'package:travel_app/DestinationSummary.dart';

import '../models/TripModel.dart';

class CountryListViewBuilder extends StatefulWidget {
  final List<TripModel> filteredItems;
  const CountryListViewBuilder({Key? key, required this.filteredItems}) : super(key: key);

  @override
  State<CountryListViewBuilder> createState() => _CountryListViewBuilderState();
}

class _CountryListViewBuilderState extends State<CountryListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: widget.filteredItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationSummary(
                      name: widget.filteredItems[index].name,
                      headerImage: widget.filteredItems[index].headerImage,
                      location: widget.filteredItems[index].country,
                      infoText: widget.filteredItems[index].infoText,
                      rating: widget.filteredItems[index].rating,
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: 150, // Adjust the width as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // shadow color
                            spreadRadius: 2, // spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(widget.filteredItems[index].url),
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Add space between image and text
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.filteredItems[index].name,
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
    );
  }
}
