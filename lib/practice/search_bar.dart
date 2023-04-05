import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchBar(),
    ));

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": '1',
      "name": "prashanth",
      'number': '9573977890',
    },
    {
      "id": '2',
      "name": "vamshi",
      'number': '7032420618',
    },
    {
      "id": '3',
      "name": "sreekanth",
      'number': '9381419853',
    }
  ];
  List<Map<String, dynamic>> _findUsers = [];

  @override
  void initState() {
    _findUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword){
    List<Map<String,dynamic>> results =[];
    if (enteredKeyword.isEmpty){
      results =_allUsers;
    }
    else{
      results=_allUsers.where((user)=>user['name'].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _findUsers=results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value)=>_runFilter(value),
              decoration: InputDecoration(
                hintText: 'search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _findUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _findUsers.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(_findUsers[index]['name']),
                          subtitle: Text(_findUsers[index]['id']),
                        ),
                      ),
                    )
                  : const Text(
                      "No Results found",
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
