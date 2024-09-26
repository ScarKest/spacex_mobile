import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spacex_mobile/data/models/rocket_model.dart';
import 'package:spacex_mobile/injection.dart';
import 'package:spacex_mobile/presentation/rockets/cubit/rocket_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({super.key});

  @override
  State<RocketsScreen> createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  late RocketCubit rocketCubit;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    rocketCubit.close();
    super.dispose();
  }

  void _getRockets(BuildContext contextBloc) {
    final rocketCubit = contextBloc.read<RocketCubit>();
    rocketCubit.getRocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rockets Screen'),
      ),
      body: BlocProvider(
        create: (_) => sl<RocketCubit>(),
        child: BlocBuilder<RocketCubit, RocketState>(
          builder: (context, state) {
            _getRockets(context);
            if (state is RocketSuccess) {
              // log(state.rocket.toString());
              RocketModel rocketModel = state.rocket;
              return ListView.builder(
                itemCount: rocketModel.data.rockets.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(rocketModel.data.rockets[index].name),
                  subtitle: Text(rocketModel.data.rockets[index].id),
                ),
              );
            } else if (state is RocketLoading) {
              return const Text('Loading');
            } else if (state is RocketInitial) {
              return const Text('Iniasdasdasdasda');
            }

            return const Text('No lo');
          },
        ),
      ),
    );
  }
}
