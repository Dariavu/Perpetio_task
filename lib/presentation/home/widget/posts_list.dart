import 'package:flutter/material.dart';
import 'package:perpetio_task/model/post_model.dart';

class PostsList extends StatelessWidget {
  final List<PostModel> posts;
  const PostsList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCell(postModel: posts[index]);
      },
    );
  }
}

class PostCell extends StatelessWidget {
  final PostModel postModel;

  PostCell({required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            '${postModel.title}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('${postModel.body}'),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
