import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkCheckUtilities {
  bool gotNetwork = true;

  void listenToNetworkChange({required VoidCallback noNetworkCallback}) {
    StreamSubscription<ConnectivityResult> sub =
        Connectivity().onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.none:
          noNetworkCallback();
          break;

        case ConnectivityResult.vpn:
        case ConnectivityResult.other:
        case ConnectivityResult.bluetooth:
          break;

        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
          break;
      }
    });
  }
}
