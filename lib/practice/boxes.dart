import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Boxes(),
    ));

class Boxes extends StatefulWidget {
  const Boxes({Key? key}) : super(key: key);

  @override
  State<Boxes> createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  String? from;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                // style: ButtonStyle(
                //
                //   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                //         (Set<MaterialState> states) {
                //       if (states.contains(MaterialState.pressed))
                //         return Colors.redAccent; //<-- SEE HERE
                //       return null; // Defer to the widget's default.
                //     },
                //   ),
                // ),
                onPressed: () {
                  if (from == null || from != "From") {
                    from = "From";

                    print(from);
                  }
                  ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  );
                },
                child: const Text('Vendor')),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(onPressed: () {
            //   if (from == null || from != "warehouse") {
            //     from = "warehouse";
            //     ElevatedButton.styleFrom(
            //       backgroundColor: Colors.black, // Background color
            //     );
            //     print(from);
            //   }
            //   ElevatedButton.styleFrom(
            //     backgroundColor: Colors.grey,
            //   );
            // }, child: const Text('Warehouse')),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(onPressed: () {
            //   if (from == null || from != "pantry1") {
            //     from = "pantry1";
            //     ElevatedButton.styleFrom(
            //       backgroundColor: Colors.black, // Background color
            //     );
            //     print(from);
            //   }
            //   ElevatedButton.styleFrom(
            //     backgroundColor: Colors.grey,
            //   );
            // }, child: const Text('pantry1')),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(onPressed: () {
            //   if (from == null || from != "pantry2") {
            //     from = "pantry2";
            //     ElevatedButton.styleFrom(
            //       backgroundColor: Colors.black, // Background color
            //     );
            //     print(from);
            //   }
            //   ElevatedButton.styleFrom(
            //     backgroundColor: Colors.grey,
            //   );
            //  },
            // child: const Text('pantry2')),
          ],
        ),
      ),
    );
  }
}
