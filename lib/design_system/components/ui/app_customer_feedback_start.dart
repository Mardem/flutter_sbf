import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';

enum _StarType { filled, half, empty }

class AppCustomerFeedbackStar extends StatelessWidget {
  const AppCustomerFeedbackStar({
    required this.rating,
    this.starCount = 5,
    this.color = DefaultColors.brand,
    this.starSize = 24.0,
    Key? key,
  })  : assert(rating >= 0),
        assert(rating <= starCount),
        assert(starCount > 0),
        super(key: key);

  factory AppCustomerFeedbackStar.singleEmptyStar({
    Color color = DefaultColors.brand,
    double starSize = 24.0,
  }) =>
      AppCustomerFeedbackStar(
        rating: 0,
        starCount: 1,
        color: color,
        starSize: starSize,
      );

  /// Shortcut to build a single filled star.
  factory AppCustomerFeedbackStar.singleFilledStar({
    Color color = DefaultColors.brand,
    double starSize = 24.0,
  }) =>
      AppCustomerFeedbackStar(
        rating: 1,
        starCount: 1,
        color: color,
        starSize: starSize,
      );

  final double rating;

  final int starCount;

  final Color color;

  final double starSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ..._starGenerator(_StarType.filled),
        ..._starGenerator(_StarType.half),
        ..._starGenerator(_StarType.empty),
      ],
    );
  }

  /// Auxiliary function to help to calculate the number of stars needed.
  int _getNumberOfStars(_StarType type) {
    switch (type) {
      case _StarType.half:
        return rating - rating.floor() == 0 ? 0 : 1;
      case _StarType.filled:
        return rating.floor();
      case _StarType.empty:
        return starCount -
            (_getNumberOfStars(_StarType.filled) + _getNumberOfStars(_StarType.half));
    }
  }

  List<Widget> _starGenerator(_StarType type) {
    final List<Widget> buf = <Widget>[];
    for (int i = 0; i < _getNumberOfStars(type); i++) {
      buf.add(_getStar(type));
    }
    return buf;
  }

  Widget _getStar(_StarType type) {
    IconData icon;

    switch (type) {
      case _StarType.filled:
        icon = Icons.star;
        break;
      case _StarType.half:
        icon = Icons.star_half;
        break;
      case _StarType.empty:
        icon = Icons.star_outline;
        break;
    }

    return Icon(
      icon,
      size: starSize,
      color: color,
    );
  }
}
