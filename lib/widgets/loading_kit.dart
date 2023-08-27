import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../components/my_colors.dart';

class LoadingKit extends StatelessWidget {
  const LoadingKit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(
      color: SolidColors.primaryColor,
      size: 32.0,
    );
  }
}
