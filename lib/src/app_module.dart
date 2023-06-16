import 'package:flutter_modular/flutter_modular.dart';
import 'package:libras/src/feature/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        //ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/', module: AuthModule()),
      ];
}
