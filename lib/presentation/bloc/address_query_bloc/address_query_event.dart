// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_query_bloc.dart';

abstract class AddressQueryEvent extends Equatable {
  const AddressQueryEvent();

  @override
  List<Object> get props => [];
}

class AddressQueryUpdateEvent extends AddressQueryEvent {
  final String query;
  const AddressQueryUpdateEvent({
    required this.query,
  });

  @override
  List<Object> get props => [
        query,
      ];
}

class AddressQueryUpdateSelectedIndexEvent extends AddressQueryEvent {
  final int selectedIndex;
  const AddressQueryUpdateSelectedIndexEvent({
    required this.selectedIndex,
  });

  @override
  List<Object> get props => [
        selectedIndex,
      ];
}

class AddressQueryThailandLocationEvent extends AddressQueryEvent {
  final String query;
  final AddressSearchTypes addressSearchTypes;
  const AddressQueryThailandLocationEvent({
    required this.query,
    required this.addressSearchTypes,
  });

  @override
  List<Object> get props => [query, addressSearchTypes];
}

class AddressQueryUpdateUserAdressEvent extends AddressQueryEvent {
  final Address address;
  const AddressQueryUpdateUserAdressEvent({
    required this.address,
  });

  @override
  List<Object> get props => [
        address,
      ];
}

class AddressQueryUpdateAllFieldValidEvent extends AddressQueryEvent {
  final Map<String, String?> valMap;
  const AddressQueryUpdateAllFieldValidEvent({
    required this.valMap,
  });

  @override
  List<Object> get props => [
        valMap,
      ];
}
