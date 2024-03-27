import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kulinar/widgets/ingredients_widget.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  List<Map> categories = [
    {"name": "Swimming", "isChecked": false},
    {"name": "Cycling", "isChecked": false},
    {"name": "Tennis", "isChecked": false},
    {"name": "Boxing", "isChecked": false},
    {"name": "Volleyball ", "isChecked": false},
    {"name": "Bowling ", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавление рецепта'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Фотография готового блюда',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          margin: const EdgeInsets.only(top: 120),
                          child: const Icon(
                            Icons.add_a_photo,
                            size: 50,
                          )),
                    ),
                    const Text('Добавить фото')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Описание',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.black.withOpacity(0.2),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  hintText: 'Описание',
                ),
                maxLines: null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Ингредиенты',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: 300,
              child: Column(
                children: [
                  SearchBar(
                    hintText: 'Ингредиенты',
                    shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                  ),
                  Container(
                    height: 240,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  children: categories.map((favorite) {
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
            const Divider(),
            const SizedBox(height: 10),
            Wrap(
              children: categories.map((favorite) {
                if (favorite["isChecked"] == true) {
                  return Card(
                    elevation: 3,
                    color: Colors.deepPurpleAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            favorite["name"],
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                favorite["isChecked"] = !favorite["isChecked"];
                              });
                            },
                            child: const Icon(
                              Icons.delete_forever_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              }).toList(),
            ),
             const SizedBox(height: 20),
             Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Шаги',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            Container(
              height: 50,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
