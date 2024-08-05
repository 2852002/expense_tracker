import 'package:flutter/material.dart';

class MesterCard extends StatelessWidget {
  String id;
  Color color;
  String balance;
  MesterCard({
    super.key,
    required this.balance,
    required this.color,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 80, left: 10, right: 10),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              // for rectangular box in card
              cardBackground(size: 50, pTop: 90, pLeft: 200),
              cardBackground(size: 160, pBottom: -50),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        masterCardLogo(),
                        Text(
                          id,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Mastercard",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              balance,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
       
      ],
    );
  }

  Positioned cardBackground({
    double size = 40,
    double? pTop,
    double? pBottom,
    double? pLeft,
    double? pRight,
  }) =>
      Positioned(
        left: pLeft,
        top: pTop,
        bottom: pBottom,
        right: pRight,
        child: Transform.rotate(
          angle: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(size / 6),
            ),
            height: size,
            width: size,
          ),
        ),
      );

  SizedBox masterCardLogo() {
    return SizedBox(
      width: 100,
      child: Stack(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}