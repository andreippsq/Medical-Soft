class Doctor {
  String firstName, lastName, specialty, sealCode, institution, email, password, phoneNumber;

  Doctor({this.firstName, this.lastName, this.specialty, this.sealCode, this.institution,
    this.email, this.password, this.phoneNumber});

  @override
  String toString() {
    return 'Doctor{firstName: $firstName, lastName: $lastName, specialty: $specialty, sealCode: $sealCode, institution: $institution, email: $email, password: $password, phoneNumber: $phoneNumber}';
  }

/*Map<String, dynamic> toJson() {
    return {
      'course': this.course,
      'professor': this.professor,
      'hour': this.hour,
      'day': this.day,
    };
  }*/



}
