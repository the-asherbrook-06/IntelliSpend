// Packages
import 'dart:math';

class Quotes {
  final Random _rand = Random();
  List<String> quotes = [
    "Enjoy your Peace of Mind",
    "Live your life better",
    "Spend smart, Smile more",
    "Wise money, bright life",
    "Thoughtful spending, happy living",
    "Smart choices, happier days",
    "Save smart, live large",
    "Spend right, feel light",
    "Spend calm, live big",
    "Money managed, life elevated",
    "Feel secure everyday",
    "Peace in every choice",
    "Confidence made simple"
  ];

  String getRandomQuote() {
    int index = _rand.nextInt(quotes.length);
    return quotes[index];
  }
}
