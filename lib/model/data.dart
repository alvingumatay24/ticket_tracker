
// ignore_for_file: non_constant_identifier_names

class Data {
  final String issued_id;
  final String raised_by;
  final String date_raised;
  final String school;
  final String issue_concerns;
  final String type_of_concern;
  final String image;
  final String nature_of_concern;
  final String root_cause;
  final String resolution;
   final String report;
  
  Data(
      {required this.issued_id, required this.raised_by, required this.date_raised,  required this.school, required this.issue_concerns, required this.type_of_concern, required this.image, required this.nature_of_concern, required this.root_cause, required this.resolution, required this.report
     });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        issued_id: json['issued_id'],
        raised_by: json['raised_by'],
        date_raised: json['date_raised'],
        school: json['school'],
        issue_concerns: json['issue_concerns'],
        type_of_concern: json['type_of_concern'],
        image: json['image'],
        nature_of_concern: json['nature_of_concern'],
        root_cause: json['root_cause'],
        resolution: json['resolution'],
        report: json['report']
       );
  }

  Map<String, dynamic> toJson() => {
        'issued_id': issued_id,
        'raised_by': raised_by,
        'date_raised': date_raised,
        'school': school,
        'issue_concerns': issue_concerns,
        'type_of_concern': type_of_concern,
        'image': image,
        'nature_of_concern': nature_of_concern, 
        'root_cause': root_cause,
        'resolution': resolution
      };
}
