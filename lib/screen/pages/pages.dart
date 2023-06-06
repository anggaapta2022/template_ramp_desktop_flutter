import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:provider/provider.dart';
import 'package:ramp_desktop/Data/data_barang.dart';
import 'package:ramp_desktop/Data/data_timbanganMasuk.dart';
import 'package:ramp_desktop/models/timbangan_model.dart';
import 'package:ramp_desktop/screen/widgets/widgets.dart';
import 'package:ramp_desktop/services/extensions.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../Data/data_supplier.dart';
import '../../models/barang_model.dart';
import '../../models/supplier_model.dart';
import '../../services/data_grid_source.dart';
import '../../services/global_provider.dart';
import '../../services/page_provider.dart';
import '../../shared/theme.dart';
import '../../shared/utils.dart';

part 'splash_page.dart';
part 'no_internet_page.dart';
part 'main_page.dart';
part 'tbs_page.dart';
part 'barang_page.dart';
part 'supplier_page.dart';
part 'laporan_page.dart';
part 'indikator_page.dart';
part 'atur_pengguna_page.dart';
part 'tbs_masuk_page.dart';
part 'tbs_keluar_page.dart';
