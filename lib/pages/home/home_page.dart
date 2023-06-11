import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/task/task.dart';
import 'package:todo_list_app/pages/task/task_page.dart';
import 'package:todo_list_app/utils/database_helper.dart';
import 'package:todo_list_app/widgets/scroll_behavior.dart';
import 'package:todo_list_app/widgets/task_card.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          color: const Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 32.0,
                      bottom: 32.0,
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<Task>>(
                      initialData: const [],
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        if(snapshot.data != null) {
                          if (snapshot.data!.isEmpty) {
                            return const SizedBox();
                          }  else {
                            return ScrollConfiguration(
                              behavior: NoGlowBehaviour(),
                              child: ListView.builder(
                                itemCount: snapshot.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Taskpage(
                                            task: snapshot.data?[index],
                                          ),
                                        ),
                                      ).then(
                                            (value) {
                                          setState(() {});
                                        },
                                      );
                                    },
                                    child: TaskCard(
                                      title: snapshot.data?[index].title,
                                      desc: snapshot.data?[index].description,
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        }
                        if(snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return SizedBox();

                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Taskpage(
                            task: null,
                          )),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFF7349FE), Color(0xFF643FDB)],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}