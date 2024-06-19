
import 'package:flutter/cupertino.dart';

class SwiperModel {
  String? img;
  String? contry;
  String? city;
  LinearGradient? color;

  SwiperModel({
    this.img,
    this.contry,
    this.city,
    this.color,
  });
}

List<SwiperModel> candidates = [
  SwiperModel(
    img: 'images/onboarding1.png',
    contry: 'india',
    city: 'Mobia',
    color: gradientPink,
  ),
  SwiperModel(
    img: 'images/onboarding2.png',
    contry: 'Mauritania',
    city: 'Atar',
    color: gradientBlue,
  ),
  SwiperModel(
    img: 'images/onboarding2.png',
    contry: 'Mauritania',
    city: 'chingity',
    color: gradientPurple,
  ),
  SwiperModel(
    img: 'images/onboarding2.png',
    contry: 'Manager',
    city: 'Town',
    color: gradientRed,
  ),
  SwiperModel(
    img: 'images/onboarding2.png',
    contry: 'Manager',
    city: 'Town',
    color: gradientPink,
  ),
  SwiperModel(
    img: 'images/onboarding2.png',
    contry: 'Manager',
    city: 'Town',
    color: gradientBlue,
  ),
  SwiperModel(
    img: 'images/onboarding2.png',
    contry: 'Manager',
    city: 'Town',
    color: gradientPurple,
  ),
  SwiperModel(
    img: 'images/onboarding2.png',
    contry: 'Manager',
    city: 'Town',
    color: gradientRed,
  ),
];

const LinearGradient gradientRed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF3868),
    Color(0xFFFFB49A),
  ],
);

const LinearGradient gradientPurple = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF736EFE),
    Color(0xFF62E4EC),
  ],
);

const LinearGradient gradientBlue = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0BA4E0),
    Color(0xFFA9E4BD),
  ],
);

const LinearGradient gradientPink = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF6864),
    Color(0xFFFFB92F),
  ],
);

const LinearGradient kNewFeedCardColorsIdentityGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF7960F1),
    Color(0xFFE1A5C9),
  ],
);
