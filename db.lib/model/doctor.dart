final String tableDoctors = 'doctors';

class DoctorFields{
  static final List<String> values = [
    id, firstName, lastName, specialty, sealCode, institution, email, password, phoneNumber
  ];

  static final String id = '_id';
  static final String firstName = 'firstName';
  static final String lastName = 'lastName';
  static final String specialty = 'specialty';
  static final String sealCode = 'sealCode';
  static final String institution = 'institution';
  static final String email = 'email';
  static final String password = 'password';
  static final String phoneNumber = 'phoneNumber';
}

class Doctor {
  final int? id;
  final String firstName;
  final String lastName;
  final String specialty;
  final String sealCode;
  final String institution;
  final String email;
  final String password;
  final String phoneNumber;

  const Doctor({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.specialty,
    required this.sealCode,
    required this.institution,
    required this.email,
    required this.password,
    required this.phoneNumber
  });

  Map<String, Object?> toJson() => {
    DoctorFields.id: id,
    DoctorFields.firstName: firstName,
    DoctorFields.lastName: lastName,
    DoctorFields.specialty: specialty,
    DoctorFields.sealCode: sealCode,
    DoctorFields.institution: institution,
    DoctorFields.email: email,
    DoctorFields.password: password,
    DoctorFields.phoneNumber: phoneNumber
  };

  static Doctor fromJson(Map<String, Object?> json) => Doctor(
      id: json[DoctorFields.id] as int?,
      firstName: json[DoctorFields.firstName] as String,
      lastName: json[DoctorFields.lastName] as String,
      specialty: json[DoctorFields.specialty] as String,
      sealCode: json[DoctorFields.sealCode] as String,
      institution: json[DoctorFields.institution] as String,
      email: json[DoctorFields.email] as String,
      password: json[DoctorFields.password] as String,
      phoneNumber: json[DoctorFields.phoneNumber] as String
  );

  Doctor copy({
    int? id,
    String? firstName,
    String? lastName,
    String? specialty,
    String? sealCode,
    String? institution,
    String? email,
    String? password,
    String? phoneNumber
  }) => Doctor(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    specialty: specialty ?? this.specialty,
    sealCode: sealCode ?? this.sealCode,
    institution: institution ?? this.institution,
    email: email ?? this.email,
    password: password ?? this.password,
    phoneNumber: phoneNumber ?? this.phoneNumber
  );
}
