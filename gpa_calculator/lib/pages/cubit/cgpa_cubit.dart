import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/Bussiness_Logic/cubits/cubit_gpa/cgpa_cubit.dart';
import 'package:gpa_calculator/Data/models/model/subject.dart';

part 'cgpa_state.dart';

class CgpaCubit extends Cubit<CgpaState> {
  CgpaCubit() : super(CgpaInitial());

  List<Subject> subjects = [];

  TextEditingController subjectNameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController creditValueController = TextEditingController();

  void refresh() {
    emit(CgpaLoading());
    emit(CgpaLoaded());
  }

  String? validate() {
    if (subjectNameController.text.isEmpty) {
      return 'Enter subject name';
    } else if (gradeController.text.isEmpty) {
      return 'Enter subject grade';
    } else if (creditValueController.text.isEmpty) {
      return 'Enter subject credit value';
    } else {
      return null;
    }
  }

  addSubject() {
    emit(CgpaLoading());
    try {
      String? error = validate();
      if (error != null) {
        emit(CgpaError(error: error));
      } else {
        Subject subject = Subject(
            name: subjectNameController.text,
            grade: gradeController.text,
            creditValue: double.tryParse(creditValueController.text) ?? 0);
        subjects.add(subject);

        subjectNameController.clear();
        creditValueController.clear();
        gradeController.clear();
        emit(CgpaLoaded());
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      emit(CgpaError(error: e.toString()));
    }
  }
}
