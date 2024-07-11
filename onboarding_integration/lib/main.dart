import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(ProviderScope(
    child: EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("th")],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BeMerchant Nextgen Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MyHomePage(title: 'Onboarding Authentication'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const QRScannerWidget(),
    );
  }
}

class QRScannerWidget extends StatefulWidget {
  const QRScannerWidget({super.key});

  @override
  _QRScannerWidgetState createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String _scannedUrl = '';
  // Uri? launchUri;
  QRViewController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
        ),
        // if (_scannedUrl != null)
        Expanded(
          flex: 1,
          child: GestureDetector(
            onDoubleTap: _handleDoubleTap,
            onLongPress: _handleLongPress,
            onTap: _handleTap,
            child: Text(
              'Open Link: ${_scannedUrl}',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _scannedUrl = scanData.code!;
        // launchUri = Uri(
        //   scheme: 'bualuangmbankingapp',
        //   path: 'mbanking.beMerchantAuthen',
        //   query: encodeQueryParameters(<String, String>{
        //     'token': _scannedUrl,
        //     'callback_url': 'bemerchantnextgen://'
        //   }),
        // );
        controller.pauseCamera();
      });
    });
  }

  String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _handleLongPress() async {
    final AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: _scannedUrl,
    );
    await intent.launch();
  }

  void _handleDoubleTap() async {
    await launchUrlString(_scannedUrl,
        mode: LaunchMode.externalNonBrowserApplication);
  }

  void _handleTap() async {
    await platform.invokeMethod('launchApp', {'launchUri': _scannedUrl});
  }
}

const platform = MethodChannel('samples.flutter.dev/battery');
