// To parse this JSON data, do
//
//     final fetchFile = fetchFileFromJson(jsonString);

import 'dart:convert';

FetchFile fetchFileFromJson(String str) => FetchFile.fromJson(json.decode(str));

String fetchFileToJson(FetchFile data) => json.encode(data.toJson());

class FetchFile {
  FetchFile({
    this.result,
  });

  Result result;

  factory FetchFile.fromJson(Map<String, dynamic> json) => FetchFile(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.files,
  });

  Files files;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        files: Files.fromJson(json["files"]),
      );

  Map<String, dynamic> toJson() => {
        "files": files.toJson(),
      };
}

class Files {
  Files({
    this.docType1,
    this.docType2,
  });

  DocType1 docType1;
  DocType2 docType2;

  factory Files.fromJson(Map<String, dynamic> json) => Files(
        docType1: DocType1.fromJson(json["docType1"]),
        docType2: DocType2.fromJson(json["docType2"]),
      );

  Map<String, dynamic> toJson() => {
        "docType1": docType1.toJson(),
        "docType2": docType2.toJson(),
      };
}

class DocType1 {
  DocType1({
    this.fileFound,
    this.details,
  });

  bool fileFound;
  DocType1Details details;

  factory DocType1.fromJson(Map<String, dynamic> json) => DocType1(
        fileFound: json["fileFound"],
        details: DocType1Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "fileFound": fileFound,
        "details": details.toJson(),
      };
}

class DocType1Details {
  DocType1Details({
    this.name,
    this.type,
    this.size,
    this.date,
    this.parent,
    this.mime,
    this.doctype,
    this.description,
    this.issuerid,
    this.issuer,
    this.id,
    this.uri,
    this.file,
  });

  String name;
  String type;
  String size;
  String date;
  String parent;
  List<String> mime;
  String doctype;
  String description;
  String issuerid;
  String issuer;
  String id;
  String uri;
  FileClass file;

  factory DocType1Details.fromJson(Map<String, dynamic> json) =>
      DocType1Details(
        name: json["name"],
        type: json["type"],
        size: json["size"],
        date: json["date"],
        parent: json["parent"],
        mime: List<String>.from(json["mime"].map((x) => x)),
        doctype: json["doctype"],
        description: json["description"],
        issuerid: json["issuerid"],
        issuer: json["issuer"],
        id: json["id"],
        uri: json["uri"],
        file: FileClass.fromJson(json["file"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "size": size,
        "date": date,
        "parent": parent,
        "mime": List<dynamic>.from(mime.map((x) => x)),
        "doctype": doctype,
        "description": description,
        "issuerid": issuerid,
        "issuer": issuer,
        "id": id,
        "uri": uri,
        "file": file.toJson(),
      };
}

class FileClass {
  FileClass({
    this.pdf,
    this.xml,
  });

  String pdf;
  String xml;

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        pdf: json["pdf"],
        xml: json["xml"],
      );

  Map<String, dynamic> toJson() => {
        "pdf": pdf,
        "xml": xml,
      };
}

class DocType2 {
  DocType2({
    this.fileFound,
    this.details,
  });

  String fileFound;
  DocType2Details details;

  factory DocType2.fromJson(Map<String, dynamic> json) => DocType2(
        fileFound: json["fileFound"],
        details: DocType2Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "fileFound": fileFound,
        "details": details.toJson(),
      };
}

class DocType2Details {
  DocType2Details();

  factory DocType2Details.fromJson(Map<String, dynamic> json) =>
      DocType2Details();

  Map<String, dynamic> toJson() => {};
}
