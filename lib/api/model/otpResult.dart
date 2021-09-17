// To parse this JSON data, do
//
//     final otpResult = otpResultFromJson(jsonString);

import 'dart:convert';

OtpResult otpResultFromJson(String str) => OtpResult.fromJson(json.decode(str));

String otpResultToJson(OtpResult data) => json.encode(data.toJson());

class OtpResult {
  OtpResult({
    this.essentials,
    this.id,
    this.patronId,
    this.task,
    this.result,
  });

  Essentials essentials;
  String id;
  String patronId;
  String task;
  Result result;

  factory OtpResult.fromJson(Map<String, dynamic> json) => OtpResult(
        essentials: Essentials.fromJson(json["essentials"]),
        id: json["id"],
        patronId: json["patronId"],
        task: json["task"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "essentials": essentials.toJson(),
        "id": id,
        "patronId": patronId,
        "task": task,
        "result": result.toJson(),
      };
}

class Essentials {
  Essentials({
    this.requestId,
    this.otp,
  });

  String requestId;
  String otp;

  factory Essentials.fromJson(Map<String, dynamic> json) => Essentials(
        requestId: json["requestId"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "otp": otp,
      };
}

class Result {
  Result({
    this.eAadhaar,
    this.userDetails,
    this.files,
  });

  EAadhaar eAadhaar;
  UserDetails userDetails;
  List<FileElement> files;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        eAadhaar: EAadhaar.fromJson(json["eAadhaar"]),
        userDetails: UserDetails.fromJson(json["userDetails"]),
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "eAadhaar": eAadhaar.toJson(),
        "userDetails": userDetails.toJson(),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class EAadhaar {
  EAadhaar({
    this.name,
    this.uid,
    this.dob,
    this.gender,
    this.x509Data,
    this.address,
    this.photo,
    this.splitAddress,
  });

  String name;
  String uid;
  String dob;
  String gender;
  X509Data x509Data;
  String address;
  String photo;
  SplitAddress splitAddress;

  factory EAadhaar.fromJson(Map<String, dynamic> json) => EAadhaar(
        name: json["name"],
        uid: json["uid"],
        dob: json["dob"],
        gender: json["gender"],
        x509Data: X509Data.fromJson(json["x509Data"]),
        address: json["address"],
        photo: json["photo"],
        splitAddress: SplitAddress.fromJson(json["splitAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "dob": dob,
        "gender": gender,
        "x509Data": x509Data.toJson(),
        "address": address,
        "photo": photo,
        "splitAddress": splitAddress.toJson(),
      };
}

class SplitAddress {
  SplitAddress({
    this.district,
    this.state,
    this.city,
    this.pincode,
    this.country,
    this.addressLine,
  });

  List<String> district;
  List<String> state;
  List<String> city;
  String pincode;
  List<String> country;
  String addressLine;

  factory SplitAddress.fromJson(Map<String, dynamic> json) => SplitAddress(
        district: List<String>.from(json["district"].map((x) => x)),
        state: List<String>.from(json["state"].map((x) => x)),
        city: List<String>.from(json["city"].map((x) => x)),
        pincode: json["pincode"],
        country: List<String>.from(json["country"].map((x) => x)),
        addressLine: json["addressLine"],
      );

  Map<String, dynamic> toJson() => {
        "district": List<dynamic>.from(district.map((x) => x)),
        "state": List<dynamic>.from(state.map((x) => x)),
        "city": List<dynamic>.from(city.map((x) => x)),
        "pincode": pincode,
        "country": List<dynamic>.from(country.map((x) => x)),
        "addressLine": addressLine,
      };
}

class X509Data {
  X509Data({
    this.subjectName,
    this.certificate,
    this.details,
    this.validAadhaarDsc,
  });

  String subjectName;
  String certificate;
  Details details;
  String validAadhaarDsc;

  factory X509Data.fromJson(Map<String, dynamic> json) => X509Data(
        subjectName: json["subjectName"],
        certificate: json["certificate"],
        details: Details.fromJson(json["details"]),
        validAadhaarDsc: json["validAadhaarDSC"],
      );

  Map<String, dynamic> toJson() => {
        "subjectName": subjectName,
        "certificate": certificate,
        "details": details.toJson(),
        "validAadhaarDSC": validAadhaarDsc,
      };
}

class Details {
  Details({
    this.version,
    this.subject,
    this.issuer,
    this.serial,
    this.notBefore,
    this.notAfter,
    this.subjectHash,
    this.signatureAlgorithm,
    this.fingerPrint,
    this.publicKey,
    this.altNames,
    this.extensions,
  });

  int version;
  Issuer subject;
  Issuer issuer;
  String serial;
  DateTime notBefore;
  DateTime notAfter;
  String subjectHash;
  String signatureAlgorithm;
  String fingerPrint;
  PublicKey publicKey;
  List<dynamic> altNames;
  Extensions extensions;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        version: json["version"],
        subject: Issuer.fromJson(json["subject"]),
        issuer: Issuer.fromJson(json["issuer"]),
        serial: json["serial"],
        notBefore: DateTime.parse(json["notBefore"]),
        notAfter: DateTime.parse(json["notAfter"]),
        subjectHash: json["subjectHash"],
        signatureAlgorithm: json["signatureAlgorithm"],
        fingerPrint: json["fingerPrint"],
        publicKey: PublicKey.fromJson(json["publicKey"]),
        altNames: List<dynamic>.from(json["altNames"].map((x) => x)),
        extensions: Extensions.fromJson(json["extensions"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "subject": subject.toJson(),
        "issuer": issuer.toJson(),
        "serial": serial,
        "notBefore": notBefore.toIso8601String(),
        "notAfter": notAfter.toIso8601String(),
        "subjectHash": subjectHash,
        "signatureAlgorithm": signatureAlgorithm,
        "fingerPrint": fingerPrint,
        "publicKey": publicKey.toJson(),
        "altNames": List<dynamic>.from(altNames.map((x) => x)),
        "extensions": extensions.toJson(),
      };
}

class Extensions {
  Extensions({
    this.extendedKeyUsage,
    this.authorityKeyIdentifier,
    this.authorityInformationAccess,
    this.certificatePolicies,
    this.cRlDistributionPoints,
    this.subjectKeyIdentifier,
    this.keyUsage,
    this.subjectAlternativeName,
  });

  String extendedKeyUsage;
  String authorityKeyIdentifier;
  String authorityInformationAccess;
  String certificatePolicies;
  String cRlDistributionPoints;
  String subjectKeyIdentifier;
  String keyUsage;
  String subjectAlternativeName;

  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
        extendedKeyUsage: json["extendedKeyUsage"],
        authorityKeyIdentifier: json["authorityKeyIdentifier"],
        authorityInformationAccess: json["authorityInformationAccess"],
        certificatePolicies: json["certificatePolicies"],
        cRlDistributionPoints: json["cRLDistributionPoints"],
        subjectKeyIdentifier: json["subjectKeyIdentifier"],
        keyUsage: json["keyUsage"],
        subjectAlternativeName: json["subjectAlternativeName"],
      );

  Map<String, dynamic> toJson() => {
        "extendedKeyUsage": extendedKeyUsage,
        "authorityKeyIdentifier": authorityKeyIdentifier,
        "authorityInformationAccess": authorityInformationAccess,
        "certificatePolicies": certificatePolicies,
        "cRLDistributionPoints": cRlDistributionPoints,
        "subjectKeyIdentifier": subjectKeyIdentifier,
        "keyUsage": keyUsage,
        "subjectAlternativeName": subjectAlternativeName,
      };
}

class Issuer {
  Issuer({
    this.countryName,
    this.organizationName,
    this.organizationalUnitName,
    this.postalCode,
    this.stateOrProvinceName,
    this.streetAddress,
    this.houseIdentifier,
    this.commonName,
    this.serialNumber,
    this.telephoneNumber,
  });

  String countryName;
  String organizationName;
  String organizationalUnitName;
  String postalCode;
  String stateOrProvinceName;
  String streetAddress;
  String houseIdentifier;
  String commonName;
  String serialNumber;
  String telephoneNumber;

  factory Issuer.fromJson(Map<String, dynamic> json) => Issuer(
        countryName: json["countryName"],
        organizationName: json["organizationName"],
        organizationalUnitName: json["organizationalUnitName"],
        postalCode: json["postalCode"],
        stateOrProvinceName: json["stateOrProvinceName"],
        streetAddress:
            json["streetAddress"] == null ? null : json["streetAddress"],
        houseIdentifier:
            json["houseIdentifier"] == null ? null : json["houseIdentifier"],
        commonName: json["commonName"],
        serialNumber:
            json["serialNumber"] == null ? null : json["serialNumber"],
        telephoneNumber:
            json["telephoneNumber"] == null ? null : json["telephoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "countryName": countryName,
        "organizationName": organizationName,
        "organizationalUnitName": organizationalUnitName,
        "postalCode": postalCode,
        "stateOrProvinceName": stateOrProvinceName,
        "streetAddress": streetAddress == null ? null : streetAddress,
        "houseIdentifier": houseIdentifier == null ? null : houseIdentifier,
        "commonName": commonName,
        "serialNumber": serialNumber == null ? null : serialNumber,
        "telephoneNumber": telephoneNumber == null ? null : telephoneNumber,
      };
}

class PublicKey {
  PublicKey({
    this.algorithm,
  });

  String algorithm;

  factory PublicKey.fromJson(Map<String, dynamic> json) => PublicKey(
        algorithm: json["algorithm"],
      );

  Map<String, dynamic> toJson() => {
        "algorithm": algorithm,
      };
}

class FileElement {
  FileElement({
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
  });

  String name;
  String type;
  String size;
  String date;
  String parent;
  List<Mime> mime;
  String doctype;
  String description;
  String issuerid;
  String issuer;
  String id;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        name: json["name"],
        type: json["type"],
        size: json["size"],
        date: json["date"],
        parent: json["parent"],
        mime: List<Mime>.from(json["mime"].map((x) => mimeValues.map[x])),
        doctype: json["doctype"],
        description: json["description"],
        issuerid: json["issuerid"],
        issuer: json["issuer"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "size": size,
        "date": date,
        "parent": parent,
        "mime": List<dynamic>.from(mime.map((x) => mimeValues.reverse[x])),
        "doctype": doctype,
        "description": description,
        "issuerid": issuerid,
        "issuer": issuer,
        "id": id,
      };
}

enum Mime { APPLICATION_JSON, APPLICATION_XML, APPLICATION_PDF }

final mimeValues = EnumValues({
  "application/json": Mime.APPLICATION_JSON,
  "application/pdf": Mime.APPLICATION_PDF,
  "application/xml": Mime.APPLICATION_XML
});

class UserDetails {
  UserDetails({
    this.digilockerid,
    this.name,
    this.dob,
    this.gender,
    this.eaadhaar,
  });

  String digilockerid;
  String name;
  String dob;
  String gender;
  String eaadhaar;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        digilockerid: json["digilockerid"],
        name: json["name"],
        dob: json["dob"],
        gender: json["gender"],
        eaadhaar: json["eaadhaar"],
      );

  Map<String, dynamic> toJson() => {
        "digilockerid": digilockerid,
        "name": name,
        "dob": dob,
        "gender": gender,
        "eaadhaar": eaadhaar,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

// class OtpResult {
//   Result result;

//   OtpResult({this.result});

//   OtpResult.fromJson(Map<String, dynamic> json) {
//     result =
//         json['result'] != null ? new Result.fromJson(json['result']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.result != null) {
//       data['result'] = this.result.toJson();
//     }
//     return data;
//   }
// }

// class Result {
//   UserDetails userDetails;
//   List<Files> files;
//   EAadhaar eAadhaar;

//   Result({this.userDetails, this.files, this.eAadhaar});

//   Result.fromJson(Map<String, dynamic> json) {
//     userDetails = json['userDetails'] != null
//         ? new UserDetails.fromJson(json['userDetails'])
//         : null;
//     if (json['files'] != null) {
//       files = new List<Files>();
//       json['files'].forEach((v) {
//         files.add(new Files.fromJson(v));
//       });
//     }
//     eAadhaar = json['eAadhaar'] != null
//         ? new EAadhaar.fromJson(json['eAadhaar'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.userDetails != null) {
//       data['userDetails'] = this.userDetails.toJson();
//     }
//     if (this.files != null) {
//       data['files'] = this.files.map((v) => v.toJson()).toList();
//     }
//     if (this.eAadhaar != null) {
//       data['eAadhaar'] = this.eAadhaar.toJson();
//     }
//     return data;
//   }
// }

// class UserDetails {
//   String digilockerid;
//   String name;
//   String dob;
//   String gender;
//   String eaadhaar;

//   UserDetails(
//       {this.digilockerid, this.name, this.dob, this.gender, this.eaadhaar});

//   UserDetails.fromJson(Map<String, dynamic> json) {
//     digilockerid = json['digilockerid'];
//     name = json['name'];
//     dob = json['dob'];
//     gender = json['gender'];
//     eaadhaar = json['eaadhaar'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['digilockerid'] = this.digilockerid;
//     data['name'] = this.name;
//     data['dob'] = this.dob;
//     data['gender'] = this.gender;
//     data['eaadhaar'] = this.eaadhaar;
//     return data;
//   }
// }

// class Files {
//   String name;
//   String type;
//   String size;
//   String date;
//   String parent;
//   List<String> mime;
//   String doctype;
//   String description;
//   String issuerid;
//   String issuer;
//   String id;

//   Files(
//       {this.name,
//       this.type,
//       this.size,
//       this.date,
//       this.parent,
//       this.mime,
//       this.doctype,
//       this.description,
//       this.issuerid,
//       this.issuer,
//       this.id});

//   Files.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     type = json['type'];
//     size = json['size'];
//     date = json['date'];
//     parent = json['parent'];
//     mime = json['mime'].cast<String>();
//     doctype = json['doctype'];
//     description = json['description'];
//     issuerid = json['issuerid'];
//     issuer = json['issuer'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['type'] = this.type;
//     data['size'] = this.size;
//     data['date'] = this.date;
//     data['parent'] = this.parent;
//     data['mime'] = this.mime;
//     data['doctype'] = this.doctype;
//     data['description'] = this.description;
//     data['issuerid'] = this.issuerid;
//     data['issuer'] = this.issuer;
//     data['id'] = this.id;
//     return data;
//   }
// }

// class EAadhaar {
//   String name;
//   String dob;
//   String uid;
//   String gender;
//   X509Data x509Data;
//   String address;
//   String photo;
//   SplitAddress splitAddress;

//   EAadhaar(
//       {this.name,
//       this.dob,
//       this.uid,
//       this.gender,
//       this.x509Data,
//       this.address,
//       this.photo,
//       this.splitAddress});

//   EAadhaar.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     dob = json['dob'];
//     uid = json['uid'];
//     gender = json['gender'];
//     x509Data = json['x509Data'] != null
//         ? new X509Data.fromJson(json['x509Data'])
//         : null;
//     address = json['address'];
//     photo = json['photo'];
//     splitAddress = json['splitAddress'] != null
//         ? new SplitAddress.fromJson(json['splitAddress'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['dob'] = this.dob;
//     data['uid'] = this.uid;
//     data['gender'] = this.gender;
//     if (this.x509Data != null) {
//       data['x509Data'] = this.x509Data.toJson();
//     }
//     data['address'] = this.address;
//     data['photo'] = this.photo;
//     if (this.splitAddress != null) {
//       data['splitAddress'] = this.splitAddress.toJson();
//     }
//     return data;
//   }
// }

// class X509Data {
//   String validAadhaarDSC;

//   X509Data({this.validAadhaarDSC});

//   X509Data.fromJson(Map<String, dynamic> json) {
//     validAadhaarDSC = json['validAadhaarDSC'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['validAadhaarDSC'] = this.validAadhaarDSC;
//     return data;
//   }
// }

// class SplitAddress {
//   List<String> district;
//   List<String> state;
//   List<String> city;
//   String pincode;
//   List<String> country;
//   String addressLine;

//   SplitAddress(
//       {this.district,
//       this.state,
//       this.city,
//       this.pincode,
//       this.country,
//       this.addressLine});

//   SplitAddress.fromJson(Map<String, dynamic> json) {
//     district = json['district'].cast<String>();
//     state = json['state'].cast<String>();
//     city = json['city'].cast<String>();
//     pincode = json['pincode'];
//     country = json['country'].cast<String>();
//     addressLine = json['addressLine'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['district'] = this.district;
//     data['state'] = this.state;
//     data['city'] = this.city;
//     data['pincode'] = this.pincode;
//     data['country'] = this.country;
//     data['addressLine'] = this.addressLine;
//     return data;
//   }
// }
