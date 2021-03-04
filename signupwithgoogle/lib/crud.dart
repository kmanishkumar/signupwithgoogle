import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Crud extends StatefulWidget {
  @override
  _CrudState createState() => _CrudState();
}


class _CrudState extends State<Crud> {

  // Map data;
  String data;
  addData(){
    // Map demodata ={
    //
    // };
    Map<String,dynamic> demodata = {
      "name": "manish",
      "moto": " testing"
    };
    print(demodata);
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.add(demodata);
  }

  fetchData(){
    print("fetch data");
    FirebaseFirestore.instance.collection('data').get().then((QuerySnapshot querySnapshot) => {querySnapshot.docs.forEach((doc) {
     setState(() {
       print(doc["name"]);
       // print(doc["name"]);
       data = doc["name"];
     });
       })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("crud operaton"),
            MaterialButton(
              elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                color: Colors.deepOrange,
                onPressed: fetchData,
              child: Text("Fetch data"),

            ),
            SizedBox(height: 30,),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              color: Colors.deepOrange,
              onPressed: addData,
              child: Text("Add data"),

            ),
            SizedBox(height: 30,),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              color: Colors.deepOrange,
              onPressed: (){

              },
              child: Text("Update data"),

            ),
            SizedBox(height: 30,),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              color: Colors.deepOrange,
              onPressed: (){

              },
              child: Text("Delete data"),

            ),
            Text(data.toString())

          ],
        ),
      ),
    );
  }
}
