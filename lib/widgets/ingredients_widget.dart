import 'package:flutter/material.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({super.key});

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {

  List<Map<String, dynamic>> filteredItems = [];

  

  List<Map<String, dynamic>> categories = [
    {"name": "Swimming", "isChecked": false},
    {"name": "Cycling", "isChecked": false},
    {"name": "Tennis", "isChecked": false},
    {"name": "Boxing", "isChecked": false},
    {"name": "Volleyball ", "isChecked": false},
    {"name": "Bowling ", "isChecked": false},
  ];

    @override
  void initState() {
    filteredItems = categories;
    super.initState();
  }

  void filterList(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredItems = categories
            .where((item) =>
                item["name"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredItems = categories;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
              height: 300,
              child: Column(
                children: [
                  SearchBar(
                    onChanged: filterList,
                    hintText: 'Ингредиенты',
                    shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                  ),
                  SizedBox(
                    height: 240,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  children: filteredItems.map((favorite) {
                                return CheckboxListTile(
                                    activeColor: Colors.deepPurpleAccent,
                                    checkboxShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: favorite["isChecked"],
                                    title: Text(favorite["name"]),
                                    onChanged: (val) {
                                      setState(() {
                                        favorite["isChecked"] = val;
                                      });
                                    });
                              }).toList()),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}