// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'textfield_valid_cubit.dart';

class TextfieldValidState extends Equatable {
  final bool isValid;
  const TextfieldValidState({required this.isValid});

  @override
  List<Object> get props => [
        isValid,
      ];

  TextfieldValidState copyWith({
    bool? isValid,
  }) {
    return TextfieldValidState(
      isValid: isValid ?? this.isValid,
    );
  }
}
