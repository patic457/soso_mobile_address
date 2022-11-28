import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfaf_cart_module/core/themes/app_colors.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/presentation/bloc/address_query_bloc/address_query_bloc.dart';
import 'package:mfaf_cart_module/presentation/widgets/location_suggest_item.dart';

class AddressLocationSearchBox extends StatelessWidget {
  AddressLocationSearchBox(
      {super.key,
      required this.title,
      required this.addressSearchType,
      this.onTapQuery = ''});

  final String title;
  final AddressSearchTypes addressSearchType;
  final String onTapQuery;

  //String query = '';
  static const IconData _close = IconData(0xe16a, fontFamily: 'MaterialIcons');
  final _searchfieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _searchfieldText.text = onTapQuery;
    context.read<AddressQueryBloc>().add(AddressQueryThailandLocationEvent(
          query: onTapQuery,
          addressSearchTypes: addressSearchType,
        ));
    return SizedBox(
      height: 660,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 8.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    _close,
                    size: 40,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45,
              child: TextField(
                controller: _searchfieldText,
                onChanged: (value) {
                  context
                      .read<AddressQueryBloc>()
                      .add(AddressQueryUpdateEvent(query: value));
                  context.read<AddressQueryBloc>().add(
                      AddressQueryThailandLocationEvent(
                          query: value, addressSearchTypes: addressSearchType));
                  // setState(() {
                  //   query = value;
                  // });
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.kLightGreen,
                    ),
                  ),
                  suffixIcon: TextButton(
                      onPressed: () {
                        debugPrint('TextButton Clicked');
                      },
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: InkWell(
                        onTap: () {
                          _searchfieldText.clear();

                          context.read<AddressQueryBloc>().add(
                              const AddressQueryUpdateSelectedIndexEvent(
                                  selectedIndex: 99999));
                          context
                              .read<AddressQueryBloc>()
                              .add(AddressQueryThailandLocationEvent(
                                query: '',
                                addressSearchTypes: addressSearchType,
                              ));

                          debugPrint('Clear Clicked');
                        },
                        child: const Text(
                          'Clear',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: AppColors.kLightGreen,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )),
                  hintText: 'Search',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<AddressQueryBloc, AddressQueryState>(
              builder: (context, state) {
                return Expanded(
                    child: Scrollbar(
                  thickness: 5,
                  thumbVisibility: true,
                  radius: const Radius.circular(5),
                  child: ListView.builder(
                    itemCount: state.thailandLocation.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // setState(() {
                          //   selectedIndex = index;
                          // });
                          context.read<AddressQueryBloc>().add(
                              AddressQueryUpdateSelectedIndexEvent(
                                  selectedIndex: index));

                          context
                              .read<AddressQueryBloc>()
                              .add(AddressQueryUpdateUserAdressEvent(
                                  address: state.address.copyWith(
                                subDistrict: state
                                    .thailandLocation[index].subDistrict
                                    .toString(),
                                district: state
                                    .thailandLocation[index].disctrict
                                    .toString(),
                                province: state.thailandLocation[index].province
                                    .toString(),
                                postalCode: state
                                    .thailandLocation[index].postalCode
                                    .toString(),
                              )));
                        },
                        child: LocationSuggestItem(
                          addressSearchTypes: addressSearchType,
                          selectedIndex: index,
                          subDistrict:
                              state.thailandLocation[index].subDistrict,
                          district: state.thailandLocation[index].disctrict,
                          province: state.thailandLocation[index].province,
                          postalCode: state.thailandLocation[index].postalCode,
                        ),
                      );
                    },
                  ),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
