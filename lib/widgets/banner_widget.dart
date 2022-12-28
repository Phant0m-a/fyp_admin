
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/firebase_services.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  Services _services = Services();


    return StreamBuilder<QuerySnapshot>(
        stream: _services.banners.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(),);
      }

      return Container(
        width: MediaQuery.of(context).size.width,

        height:300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Card(
                        elevation: 10,
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(4),
                            // child: Image.asset('assets/apple-logo.png',width: 400,fit: BoxFit.fill,)),
                            // child: Image.network('https://www.digitalcombatsimulator.com/upload/iblock/9c1/dcs-world-ajs-37-12-viggen-flight-simulator.jpg',width: 400,fit: BoxFit.fill,)),
                          child: Image.network(document['image'],width: 400,fit: BoxFit.fill,)),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.delete, color: Colors.red,),
                      ),),
                    )
                  ],
                ),
              ),
            );
            //   ListTile(
            //   title: Text(data['full_name']),
            //   subtitle: Text(data['company']),
            // );
          }).toList(),
        ),
      );
  });
}}


// future dialog but
void _showDialog(BuildContext context, String message, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(title),
        content: new Text(message),
        actions: <Widget>[
          MaterialButton(
            child: new Text("Try Again"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
