import 'package:flutter/material.dart';

class Task {
  final String title;

  const Task(this.title);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      home: TodosScreen(
        Tasks: List.generate(
          2,
          (i) => Task(
            'Task ${i += 1}',
          ),
        ),
        CompleteTasks: List.generate(
          2,
          (j) => Task(
            'Task ${j + 3}',
          ),
        ),
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  const TodosScreen(
      {Key? key, required this.Tasks, required this.CompleteTasks})
      : super(key: key);

  final List<Task> Tasks;
  final List<Task> CompleteTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: Text('List Name'),
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.person_add),
          Icon(Icons.more_vert),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: Tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(Tasks[index].title),
                    leading: Icon(
                      Icons.circle_outlined,
                      size: 35,
                    ),
                    trailing: Icon(Icons.star_border),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(task: Tasks[index]),
                        ),
                      );
                    },
                  ));
                },
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 30,
                width: 110,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 10,
                        color: Colors.white,
                      ),
                      Text(
                        ' Complete  ${CompleteTasks.length}',
                        style: TextStyle(color: Colors.white),
                      )
                    ])),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: CompleteTasks.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(CompleteTasks[index].title,
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough)),
                    leading: Icon(
                      Icons.check_circle_outline,
                      size: 35,
                    ),
                    trailing: Icon(Icons.star_border),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreenCompleteTask(
                              task: CompleteTasks[index]),
                        ),
                      );
                    },
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: Text("List Name"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
            title: Text(task.title),
            leading: Icon(
              Icons.circle_outlined,
              size: 35,
            ),
            trailing: Icon(Icons.star_border),
          ),
          Card(
              child: ListTile(
            title: Text("Add step"),
            leading: Icon(Icons.add),
          )),
          Card(
              child: ListTile(
            title: Text("Add to My Day"),
            leading: Icon(Icons.wb_sunny_outlined),
          )),
          Card(
              child: ListTile(
            title: Text("Remind Me"),
            leading: Icon(Icons.circle_notifications),
          )),
          Card(
              child: ListTile(
            title: Text("Add due Date"),
            leading: Icon(Icons.calendar_today_outlined),
          )),
          Card(
              child: ListTile(
            title: Text("Repeat"),
            leading: Icon(Icons.repeat),
          )),
          Card(
              child: ListTile(
            title: Text("Add File"),
            leading: Icon(Icons.file_present),
          )),
          Card(
              child: ListTile(
            subtitle: Text("Added a few moment ago"),
          )),
          Card(
              child: ListTile(
            subtitle: Text("created 2 minuts ago"),
            trailing: Icon(
              Icons.delete,
              size: 20,
            ),
          )),
        ],
      )),
    );
  }
}

class DetailScreenCompleteTask extends StatelessWidget {
  const DetailScreenCompleteTask({Key? key, required this.task})
      : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: Text("List Name"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
            title: Text(task.title,
                style: TextStyle(decoration: TextDecoration.lineThrough)),
            leading: Icon(
              Icons.check_circle_outline,
              size: 35,
            ),
            trailing: Icon(Icons.star_border),
          ),
          Card(
              child: ListTile(
            title: Text("Add step"),
            leading: Icon(Icons.add),
          )),
          Card(
              child: ListTile(
            title: Text("Add to My Day"),
            leading: Icon(Icons.wb_sunny_outlined),
          )),
          Card(
              child: ListTile(
            title: Text("Remind Me"),
            leading: Icon(Icons.circle_notifications),
          )),
          Card(
              child: ListTile(
            title: Text("Add due Date"),
            leading: Icon(Icons.calendar_today_outlined),
          )),
          Card(
              child: ListTile(
            title: Text("Repeat"),
            leading: Icon(Icons.repeat),
          )),
          Card(
              child: ListTile(
            title: Text("Add File"),
            leading: Icon(Icons.file_present),
          )),
          Card(
              child: ListTile(
            subtitle: Text("Added note"),
          )),
          Card(
              child: ListTile(
            subtitle: Text("Complete today"),
            trailing: Icon(
              Icons.delete,
              size: 20,
            ),
          )),
        ],
      )),
    );
  }
}
