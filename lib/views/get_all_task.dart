import 'package:flutter/material.dart';
import 'package:flutter_b8_api/models/task_list.dart';
import 'package:flutter_b8_api/providers/token.dart';
import 'package:flutter_b8_api/services/task.dart';
import 'package:flutter_b8_api/views/create_task.dart';
import 'package:flutter_b8_api/views/get_completed_task.dart';
import 'package:flutter_b8_api/views/search_task.dart';
import 'package:provider/provider.dart';

import 'get_in_completed_task.dart';

class GetAllTaskView extends StatelessWidget {
  const GetAllTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    var tokenProvider = Provider.of<TokenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Get All Tasks"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchTaskView()));
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetCompletedTaskView()));
              },
              icon: Icon(Icons.circle)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetInCompletedTaskView()));
              },
              icon: Icon(Icons.incomplete_circle)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateTaskView()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureProvider.value(
        value: TaskServices().getAllTasks(token: tokenProvider.getToken),
        initialData: TaskListModel(),
        builder: (context, child) {
          TaskListModel taskList = context.watch<TaskListModel>();
          return taskList.tasks == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: taskList.tasks!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: Icon(Icons.task),
                      title: Text(taskList.tasks![i].description.toString()),
                    );
                  });
        },
      ),
    );
  }
}
