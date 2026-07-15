import 'package:flutter/material.dart';

class SchauFenster extends StatelessWidget {
  const SchauFenster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              for (int row = 0; row < 3; row++)
                Row(
                  children: [
                    for (int element = 0; element < 3; element++)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: _SlotWidget(),
                        ),
                        flex: 1,
                      ),
                  ],
                ),
            ],
          ),
          Container(color: Colors.white, width: 100, height: 50),
        ],
      ),
    );
  }
}

class _SlotWidget extends StatelessWidget {
  const _SlotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, width: 10, height: 100);
  }
}
