import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_mobile/data/models/ship_model.dart';
import 'package:spacex_mobile/injection.dart';
import 'package:spacex_mobile/presentation/ships/cubit/ship_cubit.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({super.key});

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  late ShipCubit shipCubit;

  void _getShips(BuildContext contextBloc) {
    final shipCubit = contextBloc.read<ShipCubit>();
    shipCubit.getShip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ships Screen'),
      ),
      body: BlocProvider(
        create: (_) => sl<ShipCubit>(),
        child: BlocBuilder<ShipCubit, ShipState>(
          builder: (context, state) {
            _getShips(context);
            if (state is ShipSuccess) {
              List<Ship> shipModel = state.ship.data.ships;
              return ListView.builder(
                itemCount: shipModel.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(shipModel[index].name),
                  subtitle: Text(shipModel[index].image),
                ),
              );
            } else if (state is ShipLoading) {
              return const Text('Loading');
            } else if (state is ShipInitial) {
              return const Text('Initial');
            }

            return Container();
          },
        ),
      ),
    );
  }
}
