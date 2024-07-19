import 'package:patient_app/src/features/home/data/model/doctor.dart';

class DoctorRepository{
  Future<List<Doctor>> getDoctor()async{
    await Future.delayed(const Duration(seconds: 4));
    return [
      Doctor(name: 'Tuqa baker', specialty: 'Neurology', imageUrl: 'assets/images/doctor.png'),
      Doctor(name: 'Sedra barakat', specialty: 'Surgery', imageUrl: 'assets/images/doctor.png'),
      Doctor(name: 'Omar fostok', specialty: 'Ontology', imageUrl: 'assets/images/doctor.png'),
    ];
  }
}