import 'package:flutter/material.dart';
import 'package:todo_app_ui/Constant/colors.dart';
import 'package:todo_app_ui/Constant/taskModel.dart';
import 'package:todo_app_ui/Screens/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TaskModel> tasks = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff3451a1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerScreen(),
                ));
          },
          icon: const Icon(
            Icons.menu,
            color: Color(0xff88a5f1),
          ),
        ),
        actions: [
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.search,
                  color: Color(0xff88a5f1),
                ),
                Icon(
                  Icons.notifications,
                  color: Color(0xff88a5f1),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffd103fc),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: taskScreen,
      ),
      body: Container(
        color: const Color(0xff3451a1),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What\'s up, Code nix',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      color: Color(0xff88a5f1),
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildCard(
                          process: Color(0xffd103fc),
                          task: '40',
                          title: 'Business',
                        ),
                        buildCard(
                          process: Colors.cyan,
                          task: '10',
                          title: 'Private',
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  'Today\'s tasks',
                  style: TextStyle(
                    color: Color(0xff88a5f1),
                    fontSize: 20,
                  ),
                ),
                ListView.builder(
                  itemCount: tasks.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Card(
                    color: Colors.transparent,
                    elevation: 5,
                    margin: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      tileColor: AppColor.tileBlue,
                      leading: GestureDetector(
                        onTap: () {
                          setState(() {
                            tasks[index].isDone = true;
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: tasks[index].taskColor!,
                              width: 2,
                            ),
                          ),
                          child: tasks[index].isDone!
                              ? Icon(
                                  Icons.check_circle,
                                  color: tasks[index].taskColor,
                                )
                              : const SizedBox(),
                        ),
                      ),
                      title: Text(
                        tasks[index].taskTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: tasks[index].isDone!
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildCard({
    String task = '',
    String? title,
    Color? process,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xff010319),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 20,
        ),
        child: SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${task.toString()} Tasks',
                style: const TextStyle(
                  color: Color(0xffbbc2d8),
                  fontSize: 17,
                ),
              ),
              Text(
                '$title',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
                width: 200,
                child: LinearProgressIndicator(
                  value: 2 / 4,
                  minHeight: 4,
                  valueColor: AlwaysStoppedAnimation(process),
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void taskScreen() {
    Color? color;
    bool color1 = false;
    bool color2 = false;
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, sState) => AlertDialog(
          backgroundColor: AppColor.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: const Text(
            'Create New Task',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Wrap(
            children: [
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: controller,
                cursorColor: AppColor.tileBlue!,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.tileBlue!,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.tileBlue!,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        sState(() {
                          color1 = !color1;
                        });
                        color = AppColor.pink;
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.pink,
                        child: color1
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              )
                            : const SizedBox(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        sState(() {
                          color2 = !color2;
                        });
                        color = AppColor.iconColor;
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.iconColor,
                        child: color2
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.tileBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    if (controller.text.isNotEmpty && color != null) {
                      Navigator.pop(context);
                      setState(
                        () {
                          tasks.add(
                            TaskModel(
                              taskColor: color,
                              isDone: false,
                              taskTitle: controller.text,
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
