// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as badges;
import 'package:ticket_tracker/details.dart';
import 'package:ticket_tracker/edit.dart';
import 'package:ticket_tracker/model/data.dart';
import 'package:csv/csv.dart';
import 'package:ticket_tracker/newdata.dart';
import 'dart:convert';
import 'dart:async';


void main() {
  runApp(const 
    MyApp(),
  
 );
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Home(issued_id: '', raised_by: '', issue_concerns: '', type_of_concern: '', nature_of_concern: '', school: '', root_cause: '', resolution: '', date_raised: '', report: '', image: '',),
    );
  }
}
// ignore: must_be_immutable
class Home extends StatefulWidget {
  final  String issued_id, raised_by, date_raised, school, issue_concerns, type_of_concern, nature_of_concern, image, root_cause, resolution, report;
 
   const Home({ Key? key, required this.issued_id, required this.raised_by, required this.school, required this.issue_concerns, required this.type_of_concern, required this.nature_of_concern, required this.root_cause, required this.resolution, required this.date_raised, required this.report, required this.image}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <List<Data>>? data; 
   final getdata = GlobalKey<_HomeState>();

    late final double? dataRowHeight;
    // ignore: unused_field
    final ScrollController _horizontal = ScrollController(),
      // ignore: unused_field
      _vertical = ScrollController();
@override
void initState(){
  super.initState();
   getData();
   getTotalPost();
  
  
}

  // Future<List<Data>> getData() async {
  //   var url =
  //       'http://192.168.100.7/mobile/getdata.php';
  //   var response = await http.get(
  //     Uri.parse(url),
  //     // body: {
  //     //   "id": widget.id,
  //     //   "name": widget.name,
  //     //   "mobile": widget.mobile,
  //     // },
  //   );
  //   final items = json.decode(response.body).cast<Map<String, dynamic>>();
  //   List<Data> data = items.map<Data>((json) {
  //     return Data.fromJson(json);
  //   }).toList();
  //   return data;
  // }

 
Future<List<Data>> getData() async {

    var  url ="https://technicallogs.000webhostapp.com/getdata.php";
    var response =  await http.post(Uri.parse(url),
   );
     final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Data> getdata = items.map<Data>((json) {
      return Data.fromJson(json);
    }).toList();
    return getdata; 
    
  }

// ignore: unused_element

 var totalpost;
 void getTotalPost() async{

var url='https://technicallogs.000webhostapp.com/totalpost.php';

var response = await http.post(Uri.parse(url));
if(response.statusCode == 200){

 setState((){
   totalpost = response.body;
});

}
   // ignore: avoid_print
   print('$totalpost');
}




  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
         resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('eLearning Technical Logsheet'),
          centerTitle: true,
          
        ),
        
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context)=>NewData(date_raised: widget.date_raised, issue_concerns: '', issued_id: widget.issued_id,  nature_of_concern: widget.nature_of_concern, raised_by: widget.raised_by, report: widget.report, resolution: widget.resolution, root_cause: widget.root_cause, school: widget.school, type_of_concern: widget.type_of_concern, image: widget.image,)),
                (Route<dynamic> route) => false),
            // ignore: sort_child_properties_last
            child: const Icon(Icons.add),
            backgroundColor: Colors.blueAccent,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                    size: const Size(100, 70),
                    child: ClipRect(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                           splashColor: Colors.blue,
                      onTap: (){},
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
                    size: const Size(120, 70),
                    child: ClipRect(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(  
                           child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               badges.Badge(
                                badgeContent: Text('$totalpost', style: TextStyle(color: Colors.white,
                                fontSize: 10,),),
                                // ignore: sort_child_properties_last
                                child:Icon(Icons.assessment_sharp, color: Colors.blue,),
                                badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,),
                                badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                              badgeColor: Colors.red, ),
                               ),
                               Text(
                            'Total Posts',
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
        // ignore: avoid_unnecessary_containers
        body: Center(
          child: RefreshIndicator(    
              child: FutureBuilder<List<Data>>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: InteractiveViewer(
                    child: Scrollbar(
                      controller: _vertical,
                      trackVisibility: true,
                      child: Scrollbar(
                        controller: _horizontal,
                       trackVisibility: true,
                        notificationPredicate: (notif) => notif.depth == 1,
                        child: Stack(
                          children: [
                            SingleChildScrollView(  
                              controller: _vertical,
                              child: SingleChildScrollView(
                                controller: _horizontal,
                                 scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                
                                  child: DataTable(
                                    
                                   columnSpacing: 200,
                                   
                                   // ignore: deprecated_member_use
                                   dataRowHeight: 200,
                                    columns: <DataColumn>[
                                      DataColumn(
                                        label: Text(
                                          'Issue ID',
                                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Raised By',
                                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                       DataColumn(
                                        label: Text(
                                          'Date Raised',
                                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'School',
                                           style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                       DataColumn(
                                        label: Text(
                                          'Issue / Concerns',
                                           style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Type of Concern',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                       DataColumn(
                                        label: Text(
                                          'Screenshots',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                     
                                      DataColumn(
                                        label: Text(
                                          'Nature of Concern',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                       DataColumn(
                                        label: Text(
                                          'Root Cause',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                        DataColumn(
                                        label: Text(
                                          'Resolution',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                        DataColumn(
                                        label: Text(
                                          'Report',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                        DataColumn(
                                        label: Text(
                                          'View',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                        DataColumn(
                                        label: Text(
                                          'Edit',
                                           style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                        ),
                                      ),
                                    ],
                                    rows: snapshot.data!.map<DataRow>((e) {
                                      return DataRow(
                                        
                                        cells: <DataCell>[
                                          
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.issued_id}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                                          )),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.raised_by}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.date_raised}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.school}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.issue_concerns}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.type_of_concern}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
                                          DataCell(
                                  
                                      Center(
                                        child: Image.network(
                                                // ignore: prefer_adjacent_string_concatenation, unnecessary_string_interpolations
                                                "https://technicallogs.000webhostapp.com/uploads/" + "${e.image}",
                                                width: 150,
                                                height: 150,              
                                               ),
                                      ),
                                           ),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.nature_of_concern}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.root_cause}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.resolution}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          // ignore: unnecessary_string_interpolations
                                          DataCell(Text('${e.report}',
                                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),)),
                                          DataCell(Icon(Icons.visibility,
                                          color: Colors.green,),
                                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Details(data: e,)))
                                          ),
                                          DataCell(Icon(Icons.edit,
                                          color: Colors.redAccent,),
                                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Edit(data: e, raised_by: widget.raised_by, issued_id: widget.issued_id, date_raised: widget.date_raised, issue_concerns: widget.issue_concerns, nature_of_concern: widget.nature_of_concern, report: widget.report, resolution: widget.resolution, root_cause: widget.root_cause, school: widget.school, type_of_concern: widget.type_of_concern, image: widget.image,)))
                                          ),
                                          
                                        ],
                                      );
                                      
                                    }).toList(),
                                    
                                  ),
                                  

                                ),
                              ),
                              
                            ),
                            // ignore: avoid_unnecessary_containers
                          
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }else{
                return const SizedBox(
                        height: 500,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                          ),
                        ),
                      );
              }
            },
          ),
           onRefresh: () {
              setState(() {
                getData();
                
              });
              return getData();
              
            }),
          ),
        ),
      
    );
  }

}


