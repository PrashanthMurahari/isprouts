import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SymbolApp(),
    ));

class SymbolApp extends StatefulWidget {
  const SymbolApp({Key? key}) : super(key: key);

  @override
  State<SymbolApp> createState() => _SymbolAppState();
}

class _SymbolAppState extends State<SymbolApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('app'),
        ),
        body: Column(
          children: [
            const ListTile( title: Text('ha')),
            ExpansionTile(
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.feed,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('sales')
                  ],
                ),
              ),
              children: const [ListTile(title: Text('ha'))],
            ),
          ],
        ));
  }
}
