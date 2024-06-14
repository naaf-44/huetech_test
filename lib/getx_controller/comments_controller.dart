import 'package:get/get.dart';
import 'package:huetech_test/api_requests/post_comment_request.dart';
import 'package:huetech_test/model_class/comments_model.dart';

class CommentsController extends GetxController {
  String postId;
  CommentsController(this.postId);
  var isLoading = false.obs;
  CommentsModel? commentsModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    getPost();
  }

  getPost() async {
    isLoading(true);
    commentsModel = await PostCommentRequest.getComments(postId);
    isLoading(false);
  }


}
