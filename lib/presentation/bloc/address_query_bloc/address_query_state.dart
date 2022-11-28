// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_query_bloc.dart';

class AddressQueryState extends Equatable {
  const AddressQueryState({
    required this.selectedIndex,
    required this.query,
    required this.address,
    required this.thailandLocation,
    required this.isAllInputFieldValidated,
  });

  final String query;
  final int selectedIndex;
  final Address address;
  final List<ThailandLocation> thailandLocation;
  final bool isAllInputFieldValidated;

  @override
  List<Object> get props => [
        query,
        selectedIndex,
        thailandLocation,
        address,
        isAllInputFieldValidated,
      ];

  AddressQueryState copyWith({
    String? query,
    int? selectedIndex,
    Address? address,
    List<ThailandLocation>? thailandLocation,
    bool? isAllInputFieldValidated,
  }) {
    return AddressQueryState(
      query: query ?? this.query,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      address: address ?? this.address,
      thailandLocation: thailandLocation ?? this.thailandLocation,
      isAllInputFieldValidated:
          isAllInputFieldValidated ?? this.isAllInputFieldValidated,
    );
  }
}
