class Patient {
  String firstName, lastName, address, email, password, phoneNumber;
  int age;

  Patient({this.firstName, this.lastName, this.age, this.address, this.email, this.password,
    this.phoneNumber});

  @override
  String toString() {
    return 'Patient{firstName: $firstName, lastName: $lastName, address: $address, email: $email, password: $password, phoneNumber: $phoneNumber, age: $age}';
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
