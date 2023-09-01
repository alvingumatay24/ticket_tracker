// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:async';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:ticket_tracker/main.dart';
// ignore: unused_import
import 'dart:convert';

import 'package:ticket_tracker/model/data.dart';

class Details extends StatefulWidget {
     final Data? data;
  const Details({ Key? key, required this.data }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
  
}

class _DetailsState extends State<Details> {
  List <List<Data>>? data; 
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
        centerTitle:true
      ),
         
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Builder(
              builder: (context) => SizedBox.fromSize(
                size: const Size(60, 70),
                child: ClipRect(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                       splashColor: Colors.blue,
                      onTap:  (){},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.file_download,
                            color: Colors.green,
                            size: 30,
                          ),
                          Text(
                            'Convert-Csv',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Builder(
              builder: (context) => SizedBox.fromSize(
                size: const Size(80, 70),
                child: ClipRect(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.blue,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.arrow_back,
                            color: Colors.black54,
                            size: 30,
                          ),
                          Text(
                            'Back Page',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(children: <Widget>[
        
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Issue ID : ${widget.data!.issued_id}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromRGBO(227, 231, 235, 1)),
          ),
        ),
        Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Raised By: ${widget.data!.raised_by}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),
          Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Date Raised: ${widget.data!.date_raised}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),
          Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('School : ${widget.data!.school}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),
          Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Issue/Concern: ${widget.data!.issue_concerns}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),
          Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Type of Concern: ${widget.data!.type_of_concern}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),
        Center(
          child: Card(
            child: Container(
        
                            width: 300,
                            height: 300,
                            child: Image.network(
                                // ignore: prefer_adjacent_string_concatenation, unnecessary_string_interpolations
                                "https://technicallogs.000webhostapp.com/uploads/" + "${widget.data!.image}"),
                          ),
          ),
             
        ),
          Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Nature of Concern: ${widget.data!.nature_of_concern}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),
          Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Root Cause: ${widget.data!.root_cause}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),
          Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Resolution: ${widget.data!.resolution}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),
        Center(
          child: Card(
            child: ListTile(
                iconColor: Colors.blue,
                leading: const Icon(Icons.info, size: 20.0),
                title: Text('Report: ${widget.data!.report}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                tileColor: const Color.fromARGB(255, 227, 231, 235)),
          ),
        ),

        /*--------------------*/
        const SizedBox(
          height: 20,
        ),
       
      
        
      ]),
    );
  }
}