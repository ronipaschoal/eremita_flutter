import 'package:eremita_flutter/scenery/cubit/scenery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuStartWidget extends StatelessWidget {
  final Size size;

  const MenuStartWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SceneryCubit, SceneryState>(
      builder: (context, state) {
        if (state is SceneryStartedState) {
          return const SizedBox.shrink();
        }
        return Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: size.width * 0.8,
            height: size.height * 0.6,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
              color: const Color(0x331A73E8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'O Eremita do Iceberg',
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Toque na tela para iniciar e pular até 3x seguidas!',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
