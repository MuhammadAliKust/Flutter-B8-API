import 'package:flutter/material.dart';
import 'package:flutter_b8_api/models/task_list.dart';
import 'package:flutter_b8_api/providers/token.dart';
import 'package:flutter_b8_api/services/task.dart';
import 'package:flutter_b8_api/views/get_completed_task.dart';
import 'package:provider/provider.dart';

import 'get_in_completed_task.dart';

class SearchTaskView extends StatefulWidget {
  const SearchTaskView({super.key});

  @override
  State<SearchTaskView> createState() => _SearchTaskViewState();
}

class _SearchTaskViewState extends State<SearchTaskView> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  TaskListModel? searchedTask;

  @override
  Widget build(BuildContext context) {
    var tokenProvider = Provider.of<TokenProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Search Tasks"),
        ),
        body: Column(
          children: [
            TextField(
              controller: searchController,
              onSubmitted: (val) async {
                try {
                  isLoading = true;
                  setState(() {});
                  await TaskServices()
                      .searchTask(
                          token: tokenProvider.getToken,
                          searchKey: searchController.text)
                      .then((val) {
                    isLoading = false;
                    searchedTask = val;
                    setState(() {});
                  });
                } catch (e) {
                  isLoading = false;
                  setState(() {});
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
            if (isLoading == true)
              Center(
                child: CircularProgressIndicator(),
              )
            else
            // if(searchedTask == null)
            //   Center(child: Text("No Data Found!"),)
            if (searchedTask != null)
              if (searchedTask!.tasks!.isEmpty)
                Center(
                  child: Text("No Data Found!"),
                )
              else
                Expanded(
                  child: ListView.builder(
                      itemCount: searchedTask!.tasks!.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: Icon(Icons.task),
                          title: Text(
                              searchedTask!.tasks![i].description.toString()),
                        );
                      }),
                ),
          ],
        ));
  }
}
