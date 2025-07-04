import 'dart:math';

abstract class HelperFunctions {
  static String generateRandomCode(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random.secure();

    return List.generate(
      length,
      (index) => chars[rand.nextInt(chars.length)],
    ).join();
  }
}
