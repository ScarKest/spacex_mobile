import 'dart:developer';

import 'package:flutter/material.dart';
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
            }
          }, builder: (context, state) {
            context.read<RocketCubit>().getRockets();
            log(state.toString());
            if (state is RocketSuccess) {
              return ListView(
                children: [
                  Text(state.rocket.toString()),
                ],
              );
            } else if (state is RocketError) {
              return Text('Error ${state.error}');
            } else if (state is RocketInitial) {
              return const Text('Initial');
            } else if (state is RocketLoading) {
              return const Text('Loading');
            }
            return const Text('No lo');
          }),
        )
        //  ListView(
        //   children: [
        //     OutlinedButton(
        //         onPressed: () async {}, child: const Text('Presionar')),
        //     Text(response.toString()),
        //   ],
        // ),
        );
  }
}
