import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/models/post_model.dart';

class PostListItemWidget extends StatelessWidget {
  final Post post;

  const PostListItemWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Imagem de perfil para o usuario, verifica se o valor de 'thumbnail'
                // está vazio ou nao, caso positivo, exibe um avatar padrao do reddit
                Stack(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        image: DecorationImage(
                          image: NetworkImage(post.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        image: DecorationImage(
                          image: NetworkImage(post.thumbnailPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  post.author,
                  style: AppTextStyles.h7_bold,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    post.title,
                    style: AppTextStyles.p_bold,
                  )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_upward,
                  size: 20,
                  color: AppColors.grey_0,
                ),
                Text(
                  post.upvotes,
                  style: AppTextStyles.h7_bold,
                ),
                Icon(
                  Icons.arrow_downward,
                  size: 20,
                  color: AppColors.grey_0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
