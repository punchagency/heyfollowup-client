import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

GetIt sl = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => sl.init();
