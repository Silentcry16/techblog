import 'package:get/get.dart';
import 'package:tech_blog/components/api_url_constamt.dart';
import 'package:tech_blog/model/article_model.dart';
import 'package:tech_blog/model/hashtag_model.dart';
import 'package:tech_blog/model/podcast_model.dart';
import 'package:tech_blog/model/poster_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> podCastList = RxList();
  RxList<TagsModel> tagsList = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    isLoading.value = true;
    var response = await DioServices().getMethode(ApiUrlConstant.getHomeItems);
    var article = response.data['top_visited'];
    var podcast = response.data['top_podcasts'];
    var tags = response.data['tags'];

    try {
      for (var element in article) {
        topVisitedList.add(ArticleModel.fromJson(element));
      }
      for (var element in podcast) {
        podCastList.add(PodcastModel.fromJson(element));
      }
      for (var element in tags) {
        tagsList.add(TagsModel.fromJson(element));
        poster.value = PosterModel.fromJson(response.data['poster']);
      }
      isLoading.value = false;
    } catch (e) {
      rethrow;
    }
  }
}
