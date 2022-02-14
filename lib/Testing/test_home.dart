import 'package:flutter/material.dart';

class TestHome extends StatefulWidget {
  const TestHome({Key? key}) : super(key: key);

  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  List data = [
    {
      'id': 1,
      'name': "Banla eBook",
      "price": 230,
    },
    {
      'id': 2,
      'name': "Banla eBook",
      "price": 230,
    },
    {
      'id': 3,
      'name': "Banla eBook",
      "price": 230,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Home"),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            return DataContainer(
                data[index]['id'], data[index]['name'], data[index]['price']);
          }),
    );
  }
}

class DataContainer extends StatelessWidget {
  int id;
  String name;
  int price;

  DataContainer(this.id, this.name, this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(id.toString(),
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            Text(name.toString(),
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            TextFormField()
          ],
        ),
      ),
    );
  }
}
