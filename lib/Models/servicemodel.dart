// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Service {
  int serviceId;
  int createdBy;
  String serviceName;
  String serviceDescription;
  String serviceLocation;
  String serviceImage;
  Service({
    required this.serviceId,
    required this.createdBy,
    required this.serviceName,
    required this.serviceDescription,
    required this.serviceLocation,
    required this.serviceImage,
  });
  

  Service copyWith({
    int? serviceId,
    int? createdBy,
    String? serviceName,
    String? serviceDescription,
    String? serviceLocation,
    String? serviceImage,
  }) {
    return Service(
      serviceId: serviceId ?? this.serviceId,
      createdBy: createdBy ?? this.createdBy,
      serviceName: serviceName ?? this.serviceName,
      serviceDescription: serviceDescription ?? this.serviceDescription,
      serviceLocation: serviceLocation ?? this.serviceLocation,
      serviceImage: serviceImage ?? this.serviceImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceId': serviceId,
      'createdBy': createdBy,
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'serviceLocation': serviceLocation,
      'serviceImage': serviceImage,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      serviceId: map['serviceId'] as int,
      createdBy: map['createdBy'] as int,
      serviceName: map['serviceName'] as String,
      serviceDescription: map['serviceDescription'] as String,
      serviceLocation: map['serviceLocation'] as String,
      serviceImage: map['serviceImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

 
  factory Service.fromJson(Map<String, dynamic> map) {
  return Service(
    serviceId: map['serviceId'] as int,
    createdBy: map['createdBy'] as int, // Corrected key to 'createdBy'
    serviceName: map['serviceName'] as String,
    serviceDescription: map['serviceDescription'] as String,
    serviceLocation: map['serviceLocation'] as String,
    serviceImage: map['serviceImage'] as String,
  );
}

  @override
  String toString() {
    return 'Service(serviceId: $serviceId, createdBy: $createdBy, serviceName: $serviceName, serviceDescription: $serviceDescription, serviceLocation: $serviceLocation, serviceImage: $serviceImage)';
  }

  @override
  bool operator ==(covariant Service other) {
    if (identical(this, other)) return true;
  
    return 
      other.serviceId == serviceId &&
      other.createdBy == createdBy &&
      other.serviceName == serviceName &&
      other.serviceDescription == serviceDescription &&
      other.serviceLocation == serviceLocation &&
      other.serviceImage == serviceImage;
  }

  @override
  int get hashCode {
    return serviceId.hashCode ^
      createdBy.hashCode ^
      serviceName.hashCode ^
      serviceDescription.hashCode ^
      serviceLocation.hashCode ^
      serviceImage.hashCode;
  }
}
