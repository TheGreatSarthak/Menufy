import 'package:menufyy/providers/restaurant_item.dart';
import 'package:menufyy/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool menufyy = false;
  String condition = 'search';

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> serachItem = menufyy == false
        ? []
        : Provider.of<Item>(context, listen: false)
            .searchItem(_controller.text);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            cursorColor: Colors.black,
            controller: _controller,
            onChanged: ((value) {
              if (value.isEmpty) {
                setState(() {
                  menufyy = false;
                });
              } else {
                setState(() {
                  menufyy = true;
                });
              }
            }),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        menufyy = false;
                      });
                    }),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2)),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "Search for food"),
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: serachItem.length,
              itemBuilder: ((context, index) {
                return RestaurentItem(index, condition, _controller.text);
              })),
        ),
      ],
    );
  }
}
