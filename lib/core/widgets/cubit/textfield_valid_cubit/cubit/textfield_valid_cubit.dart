import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'textfield_valid_state.dart';

class TextfieldValidCubit extends Cubit<TextfieldValidState> {
  TextfieldValidCubit() : super(const TextfieldValidState(isValid: true));

  void valid() {
    emit(state.copyWith(isValid: true));
  }

  void invalid() {
    emit(state.copyWith(isValid: false));
  }
}
