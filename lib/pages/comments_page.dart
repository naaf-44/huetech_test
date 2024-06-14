import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huetech_test/getx_controller/comments_controller.dart';
import 'package:huetech_test/model_class/post_model.dart';

class CommentsPage extends StatefulWidget {
  final Posts? posts;
  const CommentsPage({super.key, required this.posts});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late CommentsController commentsController;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    commentsController =
        Get.put(CommentsController(widget.posts!.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Comments Page"),
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        return Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.posts!.title!),
                    subtitle: Text(widget.posts!.body!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: Colors.deepPurple[100],
                    titleTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    subtitleTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Comments",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            if (commentsController.isLoading.value)
              const Center(child: CircularProgressIndicator())
            else if (commentsController.commentsModel!.comments!.isEmpty)
              const Center(child: Text("No Comments Found"))
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount:
                        commentsController.commentsModel!.comments!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          subtitle: Text(
                              "Name: ${commentsController.commentsModel!.comments![index].name!}\nEmail: ${commentsController.commentsModel!.comments![index].email!}\n\nComment: ${commentsController.commentsModel!.comments![index].body!}"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.deepPurple[100],
                          subtitleTextStyle: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                      );
                    },
                  ),
                ),
              )
          ],
        );
      }),
    );
  }
}
