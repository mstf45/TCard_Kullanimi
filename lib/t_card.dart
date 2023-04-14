import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

class TCardKullanimi extends StatefulWidget {
  const TCardKullanimi({Key? key}) : super(key: key);

  @override
  State<TCardKullanimi> createState() => _TCardKullanimiState();
}

List<Color> colors = [
  Colors.blue,
  Colors.pink,
  Colors.black,
  Colors.red,
  Colors.orange,
  Colors.purple
];
int _index = 0;

class _TCardKullanimiState extends State<TCardKullanimi> {
  TCardController _controller = TCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TCard(
              cards: cardAlani,
              controller: _controller,
              onForward: (index, info) {
                _index = index;
              },
              onBack: (index, info) {
                _index = index;
              },
              onEnd: () {},
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {
                    _controller.back();
                  },
                  child: const Text('Back'),
                ),
                MaterialButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: const Text('Next'),
                ),
                MaterialButton(
                  onPressed: () {
                    _controller.reset();
                  },
                  child: const Text('Return'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> cardAlani = List.generate(
    colors.length,
    (index) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors[index],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '${index + 1}',
          style: const TextStyle(
            fontSize: 100,
            color: Colors.white,
          ),
        ),
      );
    },
  );
}
