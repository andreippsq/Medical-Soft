final String tablePatients = 'patients';

class PatientFields{
  static final List<String> values = [
    id, firstName, lastName, address, email, password, phoneNumber, age
  ];

  static final String id = '_id';
  static final String firstName = 'firstName';
  static final String lastName = 'lastName';
  static final String address = 'address';
  static final String email = 'email';
  static final String password = 'password';
  static final String phoneNumber = 'phoneNumber';
  static final String age = 'age';
}

class Patient{
  final int? id;
  final String firstName;
  final String lastName;
  final String address;
  final String email;
  final String password;
  final String phoneNumber;
  final String age;


  const Patient({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.age,
  });

  Map<String, Object?> toJson() => {
    PatientFields.id: id,
    PatientFields.firstName: firstName,
    PatientFields.lastName: lastName,
    PatientFields.address: address,
    PatientFields.email: email,
    PatientFields.password: password,
    PatientFields.phoneNumber: phoneNumber,
    PatientFields.age: age
  };

  static Patient fromJson(Map<String, Object?> json) => Patient(
    id: json[PatientFields.id] as int?,
    firstName: json[PatientFields.firstName] as String,
    lastName: json[PatientFields.lastName] as String,
    address: json[PatientFields.address] as String,
    email: json[PatientFields.email] as String,
    password: json[PatientFields.password] as String,
    phoneNumber: json[PatientFields.phoneNumber] as String,
    age: json[PatientFields.age] as String
  );

  Patient copy({
    int? id,
    String? firstName,
    String? lastName,
    String? address,
    String? email,
    String? password,
    String? phoneNumber,
    String? age
  }) => Patient(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    address: address ?? this.address,
    email: email ?? this.email,
    password: password ?? this.password,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    age: age ?? this.age
  );
}