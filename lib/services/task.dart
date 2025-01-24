import 'dart:convert';

import 'package:flutter_b8_api/models/task.dart';
import 'package:flutter_b8_api/models/task_list.dart';
import 'package:http/http.dart' as http;

class TaskServices {
  String baseUrl = "https://todo-nu-plum-19.vercel.app";

  ///Create Task
  Future<TaskModel> createTask(
      {required String description, required String token}) async {
    try {
      http.Response response = await http.post(Uri.parse("$baseUrl/todos/add"),
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: jsonEncode({"description": description}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskModel.fromJson(jsonDecode(response.body));
      } else {
        return TaskModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Get All Tasks
  Future<TaskListModel> getAllTasks({required String token}) async {
    try {
      http.Response response = await http.get(Uri.parse("$baseUrl/todos/get"),
          headers: {'Authorization': token});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskListModel.fromJson(jsonDecode(response.body));
      } else {
        return TaskListModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Get Completed Tasks
  Future<TaskListModel> getCompletedTasks({required String token}) async {
    try {
      http.Response response = await http.get(
          Uri.parse("$baseUrl/todos/completed"),
          headers: {'Authorization': token});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskListModel.fromJson(jsonDecode(response.body));
      } else {
        return TaskListModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Get InCompleted Tasks
  Future<TaskListModel> getInCompletedTasks({required String token}) async {
    try {
      http.Response response = await http.get(
          Uri.parse("$baseUrl/todos/incomplete"),
          headers: {'Authorization': token});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskListModel.fromJson(jsonDecode(response.body));
      } else {
        return TaskListModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Delete Task
  Future<bool> deleteTask(
      {required String token, required String taskID}) async {
    try {
      http.Response response = await http.delete(
          Uri.parse("$baseUrl/todos/delete/$taskID"),
          headers: {'Authorization': token});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Update Task
  Future<bool> updateTask(
      {required String token,
      required String taskID,
      required String description}) async {
    try {
      http.Response response = await http.patch(
          Uri.parse("$baseUrl/todos/update/$taskID"),
          headers: {'Authorization': token, 'Content-Type': 'application/json'},
          body: jsonEncode({'description': description}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Search Task
  Future<TaskListModel> searchTask(
      {required String token, required String searchKey}) async {
    try {
      http.Response response = await http.get(
          Uri.parse("$baseUrl/todos/search?keywords=$searchKey"),
          headers: {'Authorization': token});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskListModel.fromJson(jsonDecode(response.body));
      } else {
        return TaskListModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Filter Task
  Future<TaskListModel> filterTask(
      {required String token,
      required String firstDate,
      required String secondDate}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              "$baseUrl/todos/filter?startDate=$firstDate&endDate=$secondDate"),
          headers: {'Authorization': token});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskListModel.fromJson(jsonDecode(response.body));
      } else {
        return TaskListModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
