import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_clinics/data/models/doctor_model.dart';
import 'package:booking_clinics/feature/see_all/data/see_all_repo.dart';

part 'all_doctors_state.dart';

class AllDoctorsCubit extends Cubit<AllDoctorsState> {
  final SeeAllRepo seeAllRepo;
  AllDoctorsCubit(this.seeAllRepo) : super(AllDoctorsInitial());

  Future<void> invokeAllDoctors() async {
    emit(AllDoctorsLoading());
    final result = await seeAllRepo.getAllDoctors();
    result.fold(
      (failure) {
        debugPrint(failure.ex);
        emit(AllDoctorsFailure(failure.ex));
      },
      (doctors) {
        emit(AllDoctorsSuccess(doctors));
      },
    );
  }
}
