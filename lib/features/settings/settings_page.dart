import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autoroute_shell_app/app.dart';
import 'package:flutter_autoroute_shell_app/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SharedPreferences _preferences;
  late double _height, _width;

  @override
  void initState() {
    super.initState();
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _width = constraints.maxWidth;
        _height = constraints.maxHeight;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Settings', style: TextStyle(color: Colors.black)),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Text("Aa", style: TextStyle(color: Colors.green[400])),
              ),
            ],
          ),
          body: _SettingsWidget(height: _height, width: _width),
        );
      },
    );
    /*    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () async {
                // context 사용 전 필요한 객체들을 미리 캡처 (async gap 안전)
                final messenger = ScaffoldMessenger.of(context);
                final router = context.router;

                final successSnack = const SnackBar(content: Text('Cache cleared successfully.'));
                final failSnack = const SnackBar(content: Text('Failed to clear cache.'));

                final result = await _preferences.clear();

                if (!mounted) return;
                messenger.showSnackBar(result ? successSnack : failSnack);
                router.replaceAll([IntroductionRoute()]);
              }, child: const Text('Clear Cache')),
              ElevatedButton(child: const Text('Log out'), onPressed: () {
                final session = SessionScope.of(context);
                session.isAuthenticated = false;

                context.router.replaceAll([LoginRoute(
                  onLoginCallback: () {
                    session.isAuthenticated = true;
                  },
                )]);
              }),
            ],
          )
      ),
    );*/
  }
}

class _SettingsWidget extends StatefulWidget {
  final double height, width;

  const _SettingsWidget({super.key, required this.height, required this.width});

  @override
  State<_SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<_SettingsWidget> {
  late double height, width;

  @override
  void initState() {
    super.initState();
    height = widget.height;
    width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGradient(),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Account",
            style: TextStyle(color: Colors.grey[400], fontSize: 13),
          ),
        ),
        Divider(),
        _buildItem(
          "Email",
          "alice@email.com",
          Icons.email_outlined,
          Color(0xFF75abb5),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "General Settings",
            style: TextStyle(color: Colors.grey[400], fontSize: 13),
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(143, 148, 251, 1), Color.fromRGBO(143, 148, 251, .6)],
                ),
              ),
              child: Center(
                child: Text(
                  "Log out",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              final session = SessionScope.of(context);
              session.isAuthenticated = false;

              context.router.replaceAll([LoginRoute(
                onLoginCallback: () {
                  session.isAuthenticated = true;
                },
              )]);
            },
          ),
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Clear Cache",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () async {
            // context 사용 전 필요한 객체들을 미리 캡처 (async gap 안전)
            final messenger = ScaffoldMessenger.of(context);
            final router = context.router;
            final prefs = await SharedPreferences.getInstance();
            final successSnack = const SnackBar(content: Text('Cache cleared successfully.'));
            final failSnack = const SnackBar(content: Text('Failed to clear cache.'));
            final result = await prefs.clear();
            if (!mounted) return;
            messenger.showSnackBar(result ? successSnack : failSnack);
            router.replaceAll([IntroductionRoute()]);
          },
        )
      ],
    );
  }

  Widget _buildGradient() {
    return SizedBox(
      height: height * 0.275,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF75abb5), Color(0xFFafc8cf), Color(0xffd1cdc0)]),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3.0, 3.0),
                  color: Colors.black.withValues(alpha: 0.05),
                  spreadRadius: 4.0,
                ),
              ],
            ),
            height: height * 0.175,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String text, String text2, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 10),
          Text(text),
          Spacer(),
          Text(
            text2,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
