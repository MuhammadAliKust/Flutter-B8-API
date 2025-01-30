import 'package:flutter/material.dart';
import 'package:flutter_b8_api/models/task_list.dart';
import 'package:flutter_b8_api/services/task.dart';
import 'package:provider/provider.dart';

import '../providers/token.dart';

class GetInCompletedTaskView extends StatelessWidget {
  const GetInCompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    var tokenProvider = Provider.of<TokenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Get InCompleted Tasks"),
      ),
      body: FutureProvider.value(
        value:
            TaskServices().getInCompletedTasks(token: tokenProvider.getToken),
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
