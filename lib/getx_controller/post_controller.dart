import 'package:get/get.dart';
import 'package:huetech_test/api_requests/post_comment_request.dart';
import 'package:huetech_test/model_class/post_model.dart';

class PostController extends GetxController {
  var isLoading = false.obs;
  PostModel? postModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    getPost();
  }

  getPost() async {
    isLoading(true);
    postModel = await PostCommentRequest.getPosts();
    isLoading(false);
  }


}
