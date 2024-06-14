import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huetech_test/getx_controller/post_controller.dart';
import 'package:huetech_test/pages/comments_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      body: Obx(() => postController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : postController.postModel!.posts!.isEmpty
              ? const Center(child: Text("No Posts Found"))
              : Container(
                margin: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: postController.postModel!.posts!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 10),
                        child: ListTile(
                          title: Text(postController.postModel!.posts![index].title!, maxLines: 1),
                          subtitle:
                              Text(postController.postModel!.posts![index].body!, maxLines: 2),
                          onTap: () {
                            Get.to(CommentsPage(posts: postController.postModel!.posts![index]));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.deepPurple[100],
                          titleTextStyle: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),
                          subtitleTextStyle: const TextStyle(color: Colors.black,fontSize: 12),
                        ),
                      );
                    },
                  ),
              )),
    );
  }
}
