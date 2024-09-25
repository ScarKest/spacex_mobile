import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spacex_mobile/data/models/rocket_model.dart';
import 'package:spacex_mobile/presentation/rockets/cubit/rocket_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_mobile/injection.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({super.key});

  @override
  State<RocketsScreen> createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rockets Screen'),
        ),
        body: BlocProvider(
          create: (_) => sl<RocketCubit>(),
          child: BlocConsumer<RocketCubit, RocketState>(
            listener: (context, state) {
              if (state is RocketLoading) {
                log('Loading');
              } else if (state is RocketError) {
                log('error');
              } else if (state is RocketSuccess) {
                log('SUCCESS');
              }
            },
            builder: (context, state) {
              final rocketCubit = context.read<RocketCubit>();
              rocketCubit.getRocket();
              if (state is RocketSuccess) {
                RocketModel rocketModel = state.rocket;
                return ListView(
                  children: [
                    Text(rocketModel.data.rockets.first.name),
                  ],
                );
              } else if (state is RocketError) {
                return Text('Error ${state.error}');
              } else if (state is RocketInitial) {
                return const Text('InitiaKGIOIUl');
              } else if (state is RocketLoading) {
                return const Text('Loading');
              }
              return const Text('No lo');
            },
          ),
        ));
  }
}
