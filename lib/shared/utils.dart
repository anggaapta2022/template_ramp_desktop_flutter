// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ramp_desktop/services/extensions.dart';

import '../screen/pages/pages.dart';

class ConnectivityUtil {
  static ConnectivityResult? _connectivityResult;

  static Future<void> checkConnectivity(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != _connectivityResult) {
      _connectivityResult = connectivityResult;
      print("isi connectivity: $_connectivityResult");
      if (_connectivityResult == ConnectivityResult.none) {
        // Handle ketika tidak ada koneksi internet
        context.push(const NoInternetPage());
      }
    }
  }

  static bool isConnected() {
    return _connectivityResult != ConnectivityResult.none;
  }
}
