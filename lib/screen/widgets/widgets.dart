import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:provider/provider.dart';
import 'package:ramp_desktop/Data/data_timbanganMasuk.dart';
import 'package:ramp_desktop/models/timbangan_model.dart';
import 'package:ramp_desktop/services/extensions.dart';
import 'package:ramp_desktop/services/global_provider.dart';
import 'package:ramp_desktop/services/indikator_provider.dart';
import 'package:ramp_desktop/shared/theme.dart';
import 'package:random_string/random_string.dart';
import 'package:searchfield/searchfield.dart';
import 'package:serial_port_win32/serial_port_win32.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/data_timbanganKeluar.dart';
import '../../services/page_provider.dart';
import '../../services/timbangan_keluar_provider.dart';
import '../../services/timbangan_masuk_provider.dart';

part 'search_text_input.dart';
part 'running_date_time.dart';
part 'button_export.dart';
part 'dialog_setup_indicator.dart';
part 'dialog_konfirmasi_tbs_masuk.dart';
part 'dialog_konfirmasi_tbs_keluar.dart';
part 'running_time.dart';
part 'unplug.dart';
