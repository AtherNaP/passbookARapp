import 'package:flutter/material.dart';
import 'package:passbookapps/model/profile.dart';
// import 'package:passbookapps/screen/components/view.dart';

class view_detail extends StatelessWidget {
  _view_detailState createState() => _view_detailState();
  final Location location;

  view_detail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[300],
        centerTitle: true,
        title: Text(
          location.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.network(location.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                location.name.toString(),
                style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                location.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => viewbody()),
            //     );
            //     print(location.name);
            //   },
            //   child: Text(location.name),
            //   style: ButtonStyle(
            //     textStyle: MaterialStateProperty.all(
            //       const TextStyle(fontSize: 23),
            //     ),
            //   ),
            // ),
          ])),
    );
  }
}

class _view_detailState {}
