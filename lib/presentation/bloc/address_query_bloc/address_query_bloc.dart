import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mfaf_cart_module/core/util/helper.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/domain/entities/address.dart';
import 'package:mfaf_cart_module/domain/entities/thailand_localtion.dart';
import 'package:mfaf_cart_module/domain/usecases/get_thailand_location.dart';

part 'address_query_event.dart';
part 'address_query_state.dart';

class AddressQueryBloc extends Bloc<AddressQueryEvent, AddressQueryState> {
  final GetThailandLocation _getThailandLocation;

  AddressQueryBloc(this._getThailandLocation)
      : super(const AddressQueryState(
            query: '',
            selectedIndex: 99999,
            address: Address(isPrimary: false),
            thailandLocation: [],
            isAllInputFieldValidated: false)) {
    on<AddressQueryUpdateEvent>(_onUpdateQuery);
    on<AddressQueryUpdateSelectedIndexEvent>(_onUpdateSelectedIndex);
    on<AddressQueryThailandLocationEvent>(_onQueryThailandLocationEvent);
    on<AddressQueryUpdateUserAdressEvent>(_onUpdateUserAdressEvent);
    on<AddressQueryUpdateAllFieldValidEvent>(_onUpdateAllFieldValidEvent);
  }

  void _onUpdateQuery(
      AddressQueryUpdateEvent event, Emitter<AddressQueryState> emit) {
    emit(state.copyWith(query: event.query));
  }

  void _onUpdateSelectedIndex(AddressQueryUpdateSelectedIndexEvent event,
      Emitter<AddressQueryState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  void _onQueryThailandLocationEvent(AddressQueryThailandLocationEvent event,
      Emitter<AddressQueryState> emit) async {
    var locations = await _getThailandLocation.execute(
        event.query, event.addressSearchTypes);
    var data = locations.fold<List<ThailandLocation>>(
        (failure) => <ThailandLocation>[], (data) => data);
    emit(state.copyWith(thailandLocation: data, query: event.query));
  }

  void _onUpdateUserAdressEvent(AddressQueryUpdateUserAdressEvent event,
      Emitter<AddressQueryState> emit) {
    log(event.address.toString());
    emit(state.copyWith(address: event.address));
  }

  void _onUpdateAllFieldValidEvent(AddressQueryUpdateAllFieldValidEvent event,
      Emitter<AddressQueryState> emit) {
    emit(state.copyWith(
        isAllInputFieldValidated:
            Helper.isElementHasVal(event.valMap.values.toList())));
  }
}
