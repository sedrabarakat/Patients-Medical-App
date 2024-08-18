import 'package:dartz/dartz.dart';
import 'package:patient_app/core/data/models/patient_model.dart';
import 'package:patient_app/src/features/home/data/model/doctor.dart';
import 'package:patient_app/src/features/home/data/remote/home_remote.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/data/models/section_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';

class HomeRepository{
  HomeRemote homeRemote;
  HomeRepository(this.homeRemote);
  //
  // Future<List<Doctor>> getDoctor()async{
  //
  //   await Future.delayed(const Duration(seconds: 4));
  //   return
  //     [
  //     Doctor(name: 'Tuqa baker', specialty: 'Neurology', imageUrl: 'assets/images/doctor.png'),
  //     Doctor(name: 'Sedra bakat', specialty: 'Surgery', imageUrl: 'assets/images/doctor.png'),
  //     Doctor(name: 'Omar fostok', specialty: 'Ontology', imageUrl: 'assets/images/doctor.png'),
  //   ];
  // }

  Future<Either<NetworkExceptions, PatientModel>> getPatientInfo() async{
    try{
      BaseModel baseModel = await homeRemote.getPatientInfo();
      PatientModel patientModel=PatientModel.fromJson(baseModel.data);
      return right(patientModel);
    }
    catch(error){
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModels>> getSections() async {
    try {
      final response = await homeRemote.getSections();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SectionModel>>>
  getSectionInformation(int id) async {
    try {
      final response = await homeRemote.getSectionInformation(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }


  Future<Either<NetworkExceptions, BaseModels>> getSliders() async {
    try {
      final response = await homeRemote.getSliders();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }



}