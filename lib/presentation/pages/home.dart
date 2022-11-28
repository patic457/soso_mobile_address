import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfaf_cart_module/core/themes/app_colors.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/core/widgets/app_bottom_sheet.dart';
import 'package:mfaf_cart_module/core/widgets/app_button.dart';
import 'package:mfaf_cart_module/core/widgets/app_textfield.dart';
import 'package:mfaf_cart_module/presentation/bloc/address_query_bloc/address_query_bloc.dart';
import 'package:mfaf_cart_module/presentation/widgets/autofil_address_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _formKey = GlobalKey<FormState>();

  //late bool _isAllInputFieldValidated;
  final _firstnameController = TextEditingController();

  final _lastnameController = TextEditingController();

  final _contactNumberController = TextEditingController();

  final _houseNoController = TextEditingController();

  final _mooController = TextEditingController();

  final _villageController = TextEditingController();

  final _buildingController = TextEditingController();

  final _floorNoController = TextEditingController();

  final _roomNoController = TextEditingController();

  final _soiController = TextEditingController();

  final _streetController = TextEditingController();

  final _subDistrictController = TextEditingController();

  final _districtController = TextEditingController();

  final _provinceController = TextEditingController();

  final _postalCodeController = TextEditingController();

  Map<String, String?> addressMapVal = <String, String?>{
    'firstname': null,
    'lastname': null,
    'contactNumber': null,
    'houseNo': null,
    //'moo': null,
    //'village': null,
    //'building': null,
    //'floorNo': null,
    //'roomNo': null,
    //'soi': null,
    //'street': null,
    'subDistrict': null,
    'district': null,
    'province': null,
    'postalCode': null,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Add new address',
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            addressFormInputSection(context),
            addressPrimaryCheckbox(),
            addressActionButton(),
          ],
        ),
      ),
    );
  }

  Padding addressActionButton() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<AddressQueryBloc, AddressQueryState>(
              builder: (context, state) {
                return AppButton(
                  title: 'Save and use this address',
                  enableSplash: state.isAllInputFieldValidated,
                  bgColor: state.isAllInputFieldValidated
                      ? AppColors.kLightGreen
                      : AppColors.kMediumGrey,
                  textColor: state.isAllInputFieldValidated
                      ? Colors.white
                      : AppColors.kGreyCustomShade1,
                  onPressed: state.isAllInputFieldValidated
                      ? () {
                          debugPrint("clicked !!");
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            context
                                .read<AddressQueryBloc>()
                                .add(AddressQueryUpdateUserAdressEvent(
                                    address: state.address.copyWith(
                                  firstname: _firstnameController.text,
                                  lastname: _lastnameController.text,
                                  contactNumber: _contactNumberController.text,
                                  houseNo: _houseNoController.text,
                                  moo: _mooController.text,
                                  village: _villageController.text,
                                  building: _buildingController.text,
                                  floorNo: _floorNoController.text,
                                  roomNo: _postalCodeController.text,
                                  soi: _soiController.text,
                                  street: _streetController.text,
                                  subDistrict: _subDistrictController.text,
                                  district: _districtController.text,
                                  province: _provinceController.text,
                                  postalCode: _postalCodeController.text,
                                )));
                          } else {
                            //setState(() {});
                          }
                        }
                      : () {},
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              title: 'Cancel',
              bgColor: Colors.white,
              textColor: AppColors.kLightGreen,
              borderColor: AppColors.kLightGreen,
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Padding addressPrimaryCheckbox() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: ListTileTheme(
        contentPadding: const EdgeInsets.all(0),
        child: BlocBuilder<AddressQueryBloc, AddressQueryState>(
          builder: (context, state) {
            return CheckboxListTile(
              activeColor: AppColors.kLightGreen,
              title: const Text(
                "Set as primary address",
                style: TextStyle(
                    color: AppColors.kDarkestGrey, fontWeight: FontWeight.bold),
              ),
              value: state.address.isPrimary,
              onChanged: (newValue) {
                // setState(() {
                //   _isPrimary = newValue ?? false;
                // });
                context.read<AddressQueryBloc>().add(
                    AddressQueryUpdateUserAdressEvent(
                        address: state.address.copyWith(isPrimary: newValue)));
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            );
          },
        ),
      ),
    );
  }

  Padding addressFormInputSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          AppTextField(
            controller: _firstnameController,
            title: 'First name',
            hintText: 'Enter first name',
            onSaved: (val) {
              addressMapVal['firstname'] = val;
            },
            onChanged: (val) {
              onAddressFieldChanged(
                  context, 'firstname', _firstnameController.text);
            },
          ),
          AppTextField(
            controller: _lastnameController,
            title: 'Last name',
            hintText: 'Enter last name',
            onSaved: (val) {
              addressMapVal['lastname'] = val;
            },
            onChanged: (val) {
              onAddressFieldChanged(
                  context, 'lastname', _lastnameController.text);
            },
          ),
          AppTextField(
            controller: _contactNumberController,
            title: 'Contact number',
            hintText: 'Enter contact number',
            onSaved: (val) {
              addressMapVal['contactNumber'] = val;
            },
            onChanged: (val) {
              onAddressFieldChanged(
                  context, 'contactNumber', _contactNumberController.text);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 9),
            child: Divider(
              thickness: 1,
            ),
          ),
          SizedBox(
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: AppTextField(
                    controller: _houseNoController,
                    title: 'House no.',
                    hintText: 'Enter house no.',
                    onSaved: (val) {
                      addressMapVal['houseNo'] = val;
                    },
                    onChanged: (val) {
                      onAddressFieldChanged(
                          context, 'houseNo', _houseNoController.text);
                    },
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Flexible(
                  child: AppTextField(
                    controller: _mooController,
                    title: 'Moo (optional)',
                    hintText: 'Enter moo',
                    onSaved: (val) {
                      //addressMapVal['moo'] = val;
                    },
                    isOptional: true,
                    onChanged: (val) {
                      //onAddressFieldChanged('moo', _mooController.text);
                    },
                  ),
                )
              ],
            ),
          ),
          AppTextField(
            controller: _villageController,
            isOptional: true,
            title: 'Village (optional)',
            hintText: 'Enter village',
            onSaved: (val) {
              //addressMapVal['village'] = val;
            },
            onChanged: (val) {
              //onAddressFieldChanged('village', _villageController.text);
            },
          ),
          AppTextField(
            controller: _buildingController,
            title: 'Building (optional)',
            hintText: 'Enter building',
            isOptional: true,
            onSaved: (val) {
              //addressMapVal['building'] = val;
            },
            onChanged: (val) {
              //onAddressFieldChanged('building', _buildingController.text);
            },
          ),
          SizedBox(
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: AppTextField(
                    controller: _floorNoController,
                    title: 'Floor number (optional)',
                    hintText: 'Enter floor no.',
                    isOptional: true,
                    onSaved: (val) {
                      //addressMapVal['floorNo'] = val;
                    },
                    onChanged: (val) {
                      //onAddressFieldChanged('floorNo', _floorNoController.text);
                    },
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Flexible(
                  child: AppTextField(
                    controller: _roomNoController,
                    title: 'Room (optional)',
                    hintText: 'Enter room',
                    isOptional: true,
                    onSaved: (val) {
                      //addressMapVal['roomNo'] = val;
                    },
                    onChanged: (val) {
                      //onAddressFieldChanged('roomNo', _roomNoController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
          AppTextField(
            controller: _soiController,
            title: 'Soi (optional)',
            hintText: 'Enter soi',
            isOptional: true,
            onSaved: (val) {
              //addressMapVal['soi'] = val;
            },
            onChanged: (val) {
              //onAddressFieldChanged('soi', _soiController.text);
            },
          ),
          AppTextField(
            controller: _streetController,
            title: 'Street (optional)',
            hintText: 'Enter street',
            isOptional: true,
            onSaved: (val) {
              //addressMapVal['street'] = val;
            },
            onChanged: (val) {
              //onAddressFieldChanged('street', _streetController.text);
            },
          ),
          BlocBuilder<AddressQueryBloc, AddressQueryState>(
            builder: (context, state) {
              _subDistrictController.text = state.address.subDistrict ?? '';
              _districtController.text = state.address.district ?? '';
              _provinceController.text = state.address.province ?? '';
              _postalCodeController.text = state.address.postalCode ?? '';
              addressMapVal['subDistrict'] = _subDistrictController.text;
              addressMapVal['district'] = _districtController.text;
              addressMapVal['province'] = _provinceController.text;
              addressMapVal['postalCode'] = _postalCodeController.text;

              context.read<AddressQueryBloc>().add(
                  AddressQueryUpdateAllFieldValidEvent(valMap: addressMapVal));
              return Column(
                children: [
                  AppTextField(
                    onTap: () async {
                      await popAddressSearch(
                          context,
                          AddressLocationSearchBox(
                            title: 'Sub District',
                            addressSearchType: AddressSearchTypes.subDistrict,
                            onTapQuery: _subDistrictController.text,
                          )).whenComplete(() {
                        context.read<AddressQueryBloc>().add(
                            const AddressQueryUpdateSelectedIndexEvent(
                                selectedIndex: 99999));
                        context
                            .read<AddressQueryBloc>()
                            .add(const AddressQueryThailandLocationEvent(
                              query: '',
                              addressSearchTypes:
                                  AddressSearchTypes.subDistrict,
                            ));
                      });
                    },
                    controller: _subDistrictController,
                    title: 'Sub district',
                    hintText: 'Enter sub district',
                    onSaved: (val) {
                      addressMapVal['subDistrict'] = val;
                    },
                    onChanged: (val) {
                      onAddressFieldChanged(
                          context, 'subDistrict', _subDistrictController.text);
                    },
                  ),
                  AppTextField(
                    onTap: () async {
                      await popAddressSearch(
                          context,
                          AddressLocationSearchBox(
                            title: 'District',
                            addressSearchType: AddressSearchTypes.district,
                            onTapQuery: _districtController.text,
                          )).whenComplete(() {
                        context.read<AddressQueryBloc>().add(
                            const AddressQueryUpdateSelectedIndexEvent(
                                selectedIndex: 99999));
                        context
                            .read<AddressQueryBloc>()
                            .add(const AddressQueryThailandLocationEvent(
                              query: '',
                              addressSearchTypes: AddressSearchTypes.district,
                            ));
                      });
                    },
                    controller: _districtController,
                    title: 'District',
                    hintText: 'Enter district',
                    onSaved: (val) {
                      addressMapVal['district'] = val;
                    },
                    onChanged: (val) {
                      onAddressFieldChanged(
                          context, 'district', _districtController.text);
                    },
                  ),
                  AppTextField(
                    controller: _provinceController,
                    onTap: () async {
                      await popAddressSearch(
                          context,
                          AddressLocationSearchBox(
                            title: 'Province',
                            addressSearchType: AddressSearchTypes.province,
                            onTapQuery: _provinceController.text,
                          )).whenComplete(() {
                        context.read<AddressQueryBloc>().add(
                            const AddressQueryUpdateSelectedIndexEvent(
                                selectedIndex: 99999));
                        context
                            .read<AddressQueryBloc>()
                            .add(const AddressQueryThailandLocationEvent(
                              query: '',
                              addressSearchTypes: AddressSearchTypes.province,
                            ));
                      });
                    },
                    title: 'Province',
                    hintText: 'Enter Province',
                    onSaved: (val) {
                      addressMapVal['province'] = val;
                    },
                    onChanged: (val) {
                      onAddressFieldChanged(
                          context, 'province', _provinceController.text);
                    },
                  ),
                  AppTextField(
                    onTap: () async {
                      await popAddressSearch(
                          context,
                          AddressLocationSearchBox(
                            title: 'Postal code',
                            addressSearchType: AddressSearchTypes.postalCode,
                            onTapQuery: _postalCodeController.text,
                          )).whenComplete(() {
                        context.read<AddressQueryBloc>().add(
                            const AddressQueryUpdateSelectedIndexEvent(
                                selectedIndex: 99999));
                        context
                            .read<AddressQueryBloc>()
                            .add(const AddressQueryThailandLocationEvent(
                              query: '',
                              addressSearchTypes: AddressSearchTypes.postalCode,
                            ));
                      });
                    },
                    controller: _postalCodeController,
                    title: 'Postal code',
                    hintText: 'Enter postal code',
                    onSaved: (val) {
                      addressMapVal['postalCode'] = val;
                    },
                    onChanged: (val) {
                      onAddressFieldChanged(
                          context, 'postalCode', _postalCodeController.text);
                    },
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void onAddressFieldChanged(BuildContext context, String key, String? val) {
    addressMapVal[key] = val;

    context
        .read<AddressQueryBloc>()
        .add(AddressQueryUpdateAllFieldValidEvent(valMap: addressMapVal));
  }
}
