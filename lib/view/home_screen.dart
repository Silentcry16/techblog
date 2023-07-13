import 'package:flutter/material.dart';

import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/widgets/podcast_post.dart';

import '../components/dimens.dart';
import '../components/my_strings.dart';
import '../widgets/blog_post_list.dart';
import '../widgets/custom_poster.dart';
import '../widgets/hashtag_list_view.dart';
import '../widgets/icon_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;

  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          //Poster
          CustomPoster(size: size),
          const SizedBox(
            height: 30,
          ),
          //Hashtags ListView
          HashtagListView(size: size, bodyMargin: bodyMargin),
          const SizedBox(
            height: 32,
          ),
          //newest blog posts title (see more)
          IconTitle(
            bodyMargin: bodyMargin,
            size: size,
            text: MyStrings.viewHotestBlog,
            icon: Assets.icons.bluePen.path,
          ),
          //Blog list
          BlogPostList(size: size, bodyMargin: bodyMargin),
          const SizedBox(
            height: 30,
          ),
          IconTitle(
            bodyMargin: bodyMargin,
            size: size,
            text: MyStrings.viewHotestPodCasts,
            icon: Assets.icons.microphon.path,
          ),
          PostCastList(size: size, bodyMargin: bodyMargin),
          SizedBox(
            height: Dimens.xlarge + 36,
          )
        ],
      ),
    );
  }
}
