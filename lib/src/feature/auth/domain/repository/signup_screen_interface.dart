import '../model/signup.dart';

abstract class ISignup {
  Future<SignupUser> signup(SignupUser user);
}