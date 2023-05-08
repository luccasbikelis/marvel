import 'package:com_mottu_marvel/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'loading_provider.dart';

class LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LoadingCustom(child: child!));
      } else {
        return LoadingCustom(child: child!);
      }
    };
  }
}

class LoadingCustom extends StatelessWidget {
  final Widget child;
  const LoadingCustom({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LoadingProvider>(
          create: (context) => LoadingProvider(),
          builder: (context, _) {
            return Stack(children: [
              child,
              Consumer<LoadingProvider>(builder: (context, provider, child) {
                return provider.loading
                    ? Stack(
                        children: [
                          Opacity(
                            opacity: 0.2,
                            child: ModalBarrier(
                                dismissible: false,
                                color: Colors.black,
                                onDismiss: () {
                                  navigatorKey.currentContext!.read<LoadingProvider>().setLoad(false);
                                  Navigator.pop(navigatorKey.currentContext!);
                                }),
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.black.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                              child: const CupertinoActivityIndicator(
                                color: Colors.white,
                                radius: 15,
                              ),
                            ),
                          )
                        ],
                      )
                    : Container();
              })
            ]);
          }),
    );
  }
}
