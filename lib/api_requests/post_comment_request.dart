import 'dart:convert';

import 'package:huetech_test/api_requests/api_request.dart';
import 'package:huetech_test/consts/api_urls.dart';
import 'package:huetech_test/model_class/comments_model.dart';
import 'package:huetech_test/model_class/post_model.dart';

class PostCommentRequest {
  static getPosts() async {
    try {
      String url = "${ApiUrls.baseUrl}${ApiUrls.postsUrl}";
      var response = await ApiRequest.getRequest(url);
      String responseBody = response.body;
      responseBody = "{\"posts\":$responseBody}";
      var jsonResponse = jsonDecode(responseBody);
      PostModel postModel = PostModel.fromJson(jsonResponse);
      return postModel;
    } catch (e) {
      print("Error: $e");
      return PostModel(posts: []);
    }
  }

  static getComments(String postId) async {
    try{
    String url =
        "${ApiUrls.baseUrl}${ApiUrls.commentsUrl.replaceAll("{post_id}", postId)}";
    var response = await ApiRequest.getRequest(url);
    String responseBody = response.body;
    responseBody = "{\"comments\":$responseBody}";
    var jsonResponse = jsonDecode(responseBody);
    CommentsModel commentsModel = CommentsModel.fromJson(jsonResponse);
    return commentsModel;
    }catch (e) {
      print("Error: $e");
      return CommentsModel(comments: []);
    }
  }
}
