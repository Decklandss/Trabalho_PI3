import '../model/forgot.dart';

abstract class IForgot {
    Future<Forgot> forgot(Forgot user);
}