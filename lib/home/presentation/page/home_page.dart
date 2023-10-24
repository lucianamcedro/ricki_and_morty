import 'package:estudo_rick_xp_flutter/home/presentation/cubit/navigation_cubit.dart';
import 'package:estudo_rick_xp_flutter/home/presentation/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: HomeWidget(),
    );
  }
}
