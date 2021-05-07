export 'src/enum/date_format.dart';
export 'src/enum/money_format.dart';
export 'src/enum/money_unit.dart';
export 'src/res/string.dart';
export 'src/encrypt_util.dart';
export 'src/list_util.dart';
export 'src/money_util.dart';
export 'src/num_util.dart';
export 'src/regex_util.dart';
export 'src/string_util.dart';
export 'src/time_util.dart';
export 'src/timer_util.dart';
export 'src/log_util.dart';
export 'src/screen_util.dart';
export 'src/status_bar_util.dart';
export 'src/widget/exit_widget.dart';

///当App运行在Release环境时，release为true；当App运行在Debug和Profile环境时，release为false
const bool release = const bool.fromEnvironment("dart.vm.product");
const bool debug = !release;
