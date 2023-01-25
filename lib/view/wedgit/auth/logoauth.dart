import 'package:flutter/material.dart';
import 'package:glaregroup/core/constant/imageasset.dart';
import 'package:lottie/lottie.dart';


class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo,height: 180,);
  }
}

class LogoAuthSignUp extends StatelessWidget {
  const LogoAuthSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo,height: 70,);
  }
}

class LogoAuthVerfiy extends StatelessWidget {
  const LogoAuthVerfiy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.verfiy,height: 220,);
  }
}


class VerfiyEmailPhoto extends StatelessWidget {
  const VerfiyEmailPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.verfiyemail,height: 250,);
  }
}


class LogoResetPassword extends StatelessWidget {
  const LogoResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.resetpassword,height: 220,);
  }
}


class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.loading);
  }
}


class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.noData);
  }
}


class Offline extends StatelessWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.offline);
  }
}


class ServerError extends StatelessWidget {
  const ServerError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.servererror);
  }
}


class ChoseLang extends StatelessWidget {
  const ChoseLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(AppImageAsset.choseLang,height: 250, width: 250);
  }
}


