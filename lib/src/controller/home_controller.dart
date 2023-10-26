import 'package:get/get.dart';
import 'package:instagram_clone/src/models/post.dart';
import 'package:instagram_clone/src/repository/post_repositoy.dart';

class HomeController extends GetxController {
  RxList<Post> postList = <Post>[].obs;
  @override
  void onInit() {
    super.onInit();
    _loadFeedList();
  }

  void _loadFeedList() async {
    var feedList = await PostRepostiory.loadFeedList();
    postList.addAll(feedList);
  }
}
