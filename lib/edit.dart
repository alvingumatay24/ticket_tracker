// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ticket_tracker/main.dart';
import 'package:ticket_tracker/model/data.dart';


// ignore: must_be_immutable
class Edit extends StatefulWidget {
   final Data? data;
  final  String issued_id, raised_by, date_raised, school, issue_concerns, type_of_concern, nature_of_concern, image, root_cause, resolution, report;
    
  
 
  // ignore: prefer_const_constructors_in_immutables
  Edit({ Key? key, required this.issued_id, required this.raised_by, required this.date_raised, required this.school, required this.issue_concerns, required this.type_of_concern, required this.nature_of_concern, required this.root_cause, required this.resolution, required this.report, this.data, required this.image, }): super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  File? image;
  final picker = ImagePicker();
  choiceImage()async{
    // ignore: deprecated_member_use
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage!.path);
    });
  }
 


    GlobalKey<FormState> FormKey = GlobalKey<FormState>();
    // ignore: prefer_final_fields, unused_field
     GlobalKey<FormState> _iFormKey = GlobalKey<FormState>();
    // ignore: prefer_final_fields
    GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
     final List<Map<String, dynamic>> _items = [
    {
      'value': 'schools division office',
      'label': 'Schools Division Office',
    },
    {
      'value': 'barangka national high school',
      'label': 'Barangka National High School',
    },
    {
      'value': 'concepcion integrated school sl',
      'label': 'Concepcion Integrated School SL',
    },
    {
      'value': 'fortune high school',
      'label': 'Fortune High School',
    },
    {
      'value': 'jesus dela peña national high school',
      'label': 'Jesus Dela Peña Ntional Highh School',
    },
     {
      'value': 'kalumpang national high school',
      'label': 'Kalumpang National High School',
    },
    {
      'value': 'malanday national high school',
      'label': 'Malanday National High School',
    },
    {
      'value': 'marikina heights national high school',
      'label': 'Marikina Heights National High School',
    },
    {
      'value': 'marikina high school',
      'label': 'Marikina High School',
    },
    {
      'value': 'marikina science high school',
      'label': 'Marikina Science High School',
    },
    {
      'value': 'nangka  high school',
      'label': 'Nangka High School',
    },
    {
      'value': 'parang high school',
      'label': 'Parang High School',
    },
    {
      'value': 'san roque national high school',
      'label': 'San Roque National School',
    },
    {
      'value': 'sss village national high school',
      'label': 'SSS Village National High School',
    },
    {
      'value': 'sta. elena high school',
      'label': 'Sta. Elena High School',
    },
    {
      'value': 'sto. niño national high school',
      'label': 'Sto. Niño National High School',
    },
    {
      'value': 'tañong high school',
      'label': 'Tañong High School',
    },
  ];
  final List<Map<String, dynamic>> _item2 = [
    {
      'value': 'assistance',
      'label': 'Assistance',
    },
    {
      'value': 'clarification',
      'label': 'Clarification',
    },
    {
      'value': 'request',
      'label': 'Request',
    }
  ];
  
 

  editData() async{
  var url="https://technicallogs.000webhostapp.com/edit.php";
  var request = http.MultipartRequest('POST',Uri.parse(url));
  request.fields['issued_id'] = widget.data!.issued_id;
  request.fields['raised_by'] = craisedby!.text;
      request.fields['date_raised'] = cdateraised!.text;
      request.fields['school'] = cschool!.text;
      request.fields['issue_concerns'] = cissueconcern!.text;
      request.fields['type_of_concern'] = ctypeconcern!.text;
      request.fields['nature_of_concern'] = cnatureconcern!.text;
      request.fields['root_cause'] = crootcaused!.text;
      request.fields['resolution'] = cresolution!.text;
      request.fields['report'] = creport!.text;
    var pic = await http.MultipartFile.fromPath("image", image!.path);
    request.files.add(pic);
    // ignore: unused_local_variable
    var response = await request.send();
  if (response.statusCode == 200) {
        Fluttertoast.showToast(
        msg: "Posted Updated Successfully.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
       // ignore: use_build_context_synchronously
       Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Home(raised_by: widget.raised_by, date_raised:widget.date_raised, image:widget.image, issue_concerns: widget.issue_concerns, issued_id:widget.issued_id, nature_of_concern: widget.nature_of_concern, report: widget.report,  resolution: widget.resolution, root_cause: widget.root_cause, school: widget.school, type_of_concern: widget.type_of_concern,
             
              
            ),
          ),
          (Route<dynamic> route) => false);
    }else{
      // ignore: avoid_print
       Fluttertoast.showToast(
        msg: "Updating post failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    setState(() {
      
    });
 } 
  // ignore: unnecessary_new
    TextEditingController? craisedby;
// ignore: unnecessary_new
 TextEditingController? cdateraised;
 TextEditingController? cschool;
 TextEditingController? cissueconcern;
 TextEditingController? ctypeconcern;
 TextEditingController? cnatureconcern;
 TextEditingController? crootcaused;
 TextEditingController? cresolution;
 TextEditingController? creport;
  // ignore: unnecessary_new
@override
  void initState() {   
    craisedby=TextEditingController(text: widget.data!.raised_by);
    cdateraised=TextEditingController(text: widget.data!.date_raised);
    cschool=TextEditingController(text: widget.data!.school);
    cissueconcern=TextEditingController(text: widget.data!.issue_concerns);
    ctypeconcern=TextEditingController(text: widget.data!.type_of_concern);
    cnatureconcern=TextEditingController(text: widget.data!.nature_of_concern);
    crootcaused=TextEditingController(text: widget.data!.root_cause);
    cresolution=TextEditingController(text: widget.data!.resolution);
    creport=TextEditingController(text: widget.data!.report);
   super.initState();   
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
      title: Text(' Edit Data Information'),
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
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                        
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
    body:Padding(
      
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: ListView(
          
          children: [
          Container(
            key: FormKey,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: const Color.fromARGB(255, 187, 187, 187),
                )),
            padding: const EdgeInsets.all(0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                 Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: craisedby,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      hintText: "RAISED BY.", labelText: "RAISED BY"
                    ),
                  ),
                ),
                  Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                     controller: cdateraised, //editing controller of this TextField
                decoration: InputDecoration( 
                   icon: Icon(Icons.calendar_today), //icon of text field
                   labelText: "Enter Date" //label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      // ignore: avoid_print
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      // ignore: avoid_print
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                         cdateraised!.text = formattedDate; //set output date to TextField value. 
                      });
                  }else{
                      // ignore: avoid_print
                      print("Date is not selected");
                  }
                },
                  ),
                ),
                 Container(
                 padding: const EdgeInsets.all(10),
                child: Form(
                 key: _oFormKey,
                child: Column(
                children: <Widget>[
                SelectFormField(
                  type: SelectFormFieldType.dropdown,
                  controller: cschool,
                  //initialValue: _initialValue,
                  labelText: 'School',
                  hintText: 'School',
                  dialogTitle: 'Pick a item',
                  dialogCancelBtn: 'CANCEL',
                  items: _items,   
                           
                 ),
                ],
            ),
           ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: cissueconcern,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      hintText: "ISSUES / CONCERN.", labelText: "ISSUES / CONCERN"
                    ),
                  ),
                ),
              Container(
                 padding: const EdgeInsets.all(10),
                child: Form(
                 key: _iFormKey,
                child: Column(
                children: <Widget>[
                SelectFormField(
                  type: SelectFormFieldType.dropdown,
                  controller: ctypeconcern,
                  //initialValue: _initialValue,
                  labelText: 'Type of concern',
                  hintText: 'Type of concern',
                  dialogTitle: 'Pick a item',
                  dialogCancelBtn: 'CANCEL',
                  items: _item2,   
                           
                 ),
                ],
            ),
           ),
              ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: cnatureconcern,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      hintText: "NATURE OF CONCERN.", labelText: "NATURE OF CONCERN."
                    ),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    choiceImage();
                  },
                ),
               // ignore: sized_box_for_whitespace
              
                Container(
                  child: image == null ? Text('No Image Selected'): Image.file(
                                image!),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: crootcaused,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      hintText: "ROOT CAUSED.", labelText: "ROOT CAUSED.."
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: cresolution,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      hintText: "RESOLUTION", labelText: "RESOLUTION."
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: creport,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      hintText: "REPORT.", labelText: "REPORT."
                    ),
                  ),
                ),
                Center(
                   child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.green,
                        elevation: 0,
                      ),
                     onPressed: (){
                       setState(() {
      
                    });
                     editData();
                     Navigator.of(context).push(                   
                      MaterialPageRoute(builder: (BuildContext context) =>Home(raised_by: widget.data!.raised_by, issued_id: widget.data!.issued_id, date_raised: widget.data!.date_raised, issue_concerns: widget.data!.issue_concerns, nature_of_concern: widget.data!.nature_of_concern, report: widget.data!.report, resolution: widget.data!.resolution, root_cause: widget.data!.root_cause, school: widget.data!.school, type_of_concern: widget.data!.type_of_concern, image: widget.data!.image,) )
                     );
                    
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ]),
      ),  
    
    );
  }
}



