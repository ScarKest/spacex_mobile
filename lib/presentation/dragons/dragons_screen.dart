import 'package:flutter/material.dart';
import 'package:spacex_mobile/data/models/dragon_model.dart';
import 'package:spacex_mobile/injection.dart';
import 'package:spacex_mobile/presentation/dragons/cubit/dragon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DragonsScreen extends StatefulWidget {
  const DragonsScreen({super.key});

  @override
  State<DragonsScreen> createState() => _DragonsScreenState();
}

class _DragonsScreenState extends State<DragonsScreen> {
  late DragonCubit dragonCubit;

  void _getDragons(BuildContext contextBloc) {
    final dragonCubit = contextBloc.read<DragonCubit>();
    dragonCubit.getDragon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dragons Screen'),
      ),
      body: BlocProvider(
        create: (_) => sl<DragonCubit>(),
        child: BlocBuilder<DragonCubit, DragonState>(
          builder: (context, state) {
            _getDragons(context);
            if (state is DragonSuccess) {
              DragonModel dragonModel = state.dragon;
              return ListView.builder(
                itemCount: dragonModel.data.dragons.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(dragonModel.data.dragons[index].name),
                  subtitle: Text(dragonModel.data.dragons[index].id),
                ),
              );
            } else if (state is DragonLoading) {
              return const Text('Loading');
            } else if (state is DragonInitial) {
              return const Text('Iniasdasdasdasda');
            }

            return const Text('No lo');
          },
        ),
      ),
    );
  }
}
