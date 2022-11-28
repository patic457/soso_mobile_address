import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfaf_cart_module/app_bloc_observer.dart';
import 'package:mfaf_cart_module/core/themes/app_colors.dart';
import 'package:mfaf_cart_module/core/util/gen.dart';
import 'package:mfaf_cart_module/presentation/bloc/address_query_bloc/address_query_bloc.dart';
import 'package:mfaf_cart_module/presentation/pages/home.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final addressQueryBloc = BlocProvider<AddressQueryBloc>(
      create: (context) => di.locator<AddressQueryBloc>(),
    );

    return MultiBlocProvider(
      providers: [addressQueryBloc],
      child: MaterialApp(
        title: 'Address',
        theme: ThemeData(
          primarySwatch:
              Gen.generateMaterialColorFromColor(AppColors.kDarkGreen),
        ),
        home: HomePage(),
      ),
    );
  }
}
