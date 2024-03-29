
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  List<Map<String, dynamic>> categories = [
    {"name": "Swimming", "isChecked": false},
    {"name": "Cycling", "isChecked": false},
    {"name": "Tennis", "isChecked": false},
    {"name": "Boxing", "isChecked": false},
    {"name": "Volleyball ", "isChecked": false},
    {"name": "Bowling ", "isChecked": false},
  ];

  List<Map<String, dynamic>> filteredItems = [];

  var titleRecipe = TextEditingController();
  var descriptionRecipe = TextEditingController();

  Color textFieldColorTitle = Colors.yellow;
  Color textFieldColorDescription = Colors.yellow;

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

  DateTime time = DateTime(2016, 5, 10, 22, 35);

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
                'Название рецепта',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: 45,
              child: TextField(
                controller: titleRecipe,
                onChanged: (value) {
                  setState(() {
                    textFieldColorTitle =
                        value.isEmpty ? Colors.red : Colors.green;
                  });
                },
                cursorColor: textFieldColorTitle,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.black.withOpacity(0.2),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldColorTitle),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldColorTitle),
                  ),
                  hintText: 'Название',
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
            SizedBox(
              height: null,
              child: TextField(
                controller: descriptionRecipe,
                onChanged: (value) {
                  setState(() {
                    textFieldColorDescription =
                        value.isEmpty ? Colors.red : Colors.green;
                  });
                },
                cursorColor: textFieldColorDescription,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.black.withOpacity(0.2),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldColorDescription),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textFieldColorDescription),
                  ),
                  hintText: 'Описание',
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Время приготовления',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            InkWell(
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        color: Colors.black.withOpacity(0.2),
                        child: Center(child: Text('${time.hour} часов', style: const TextStyle(fontSize: 20))),
                      ),
                    ),
                    const VerticalDivider(width: 1, color: Colors.black),
                    Expanded(
                      child: Container(
                        height: 40,
                        color: Colors.black.withOpacity(0.2),
                        child: Center(child: Text('${time.minute} минут', style: const TextStyle(fontSize: 20))),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => showDialog(
                context: context, builder: (BuildContext context) => AlertDialog(
                    content: SizedBox(
                      height: 250,
                      width: 150,
                      child: CupertinoDatePicker(
                        initialDateTime: time,
                          mode: CupertinoDatePickerMode.time,
                          use24hFormat: true,
                        onDateTimeChanged: (DateTime newTime) {
                            setState(() => time = newTime);
                          },),
                    ),
                  )
              ) 
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
            Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      SearchBar(
                        onChanged: filterList,
                        hintText: 'Ингредиенты',
                        shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
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
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                Wrap(
                  children: filteredItems.map((favorite) {
                    if (favorite["isChecked"] == true) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  favorite["name"],
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                DropdownButton(
                                  hint: const Text('ед.из'),
                                  items: const [
                                    DropdownMenuItem<int>(
                                      value: 123,
                                      child: Text('123'),
                                    ),
                                  ],
                                  onChanged: (value) {},
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      favorite["isChecked"] =
                                          !favorite["isChecked"];
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete_forever_rounded,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    }
                    return Container();
                  }).toList(),
                ),
              ],
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
              child: Text(titleRecipe.text),
            ),
            Container(
              height: 50,
              color: Colors.green,
              child: Text(descriptionRecipe.text),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
