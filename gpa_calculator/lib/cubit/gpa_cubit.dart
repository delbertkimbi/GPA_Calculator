import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/model/result_calculate.dart';

class GpaCubit extends Cubit<List<SubjectInfo>> {
  GpaCubit() : super([]);
  void addSubject(String subName, String subGrade, int subCreditValue) {
    final subInfo = SubjectInfo(
      subName: subName,
      subGrade: subGrade,
      subCreditValue: subCreditValue,
    );
  }
}
