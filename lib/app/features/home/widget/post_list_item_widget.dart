import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/core.dart';
import '../../../service/reddit_service.dart';
import '../../../shared/models/post_model.dart';
import '../../../shared/util/toast_util.dart';
import '../../../shared/widgets/bottom_sheet_widget.dart';
import 'comment_list_item.dart';

class PostListItemWidget extends StatelessWidget {
  final Post post;

  PostListItemWidget({Key? key, required this.post}) : super(key: key);
  bool commentsListIsNotEmpty = true;

  @override
  Widget build(BuildContext context) {
    List itens = [];

// Modular.get<>()

    // Listando Comentarios
    void showComments() async {
      var response = await RedditService().getComments(post.subreddit, post.id);
      List temp = [];
      temp.addAll(response);

      // Verificando se nao esta vazio (o post possui respostas/comentarios)
      print('Comentarios: ${temp.length}');
      if (temp.length >= 1) {
        try {
          temp.forEach((e) {
            if (e != temp.first) {
              itens.add(e);
              print(
                  '> Adicionado: ${e['data']['children'][0]['data']['author']}');
            }
          });
        } catch (e) {
          print("> Erro ao recuperar Comentários: $e");
          commentsListIsNotEmpty = false;
        }
      } else {
        commentsListIsNotEmpty = false;
      }

      if (commentsListIsNotEmpty) {
        showModalBottomSheet(
            // Exibindo o bottomsheet, com o layout pré-definido
            context: context,
            builder: (context) => SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .8,
                    color: Color(0xFF757575),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .9,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: Colors.transparent,
                      ),
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: BottomSheetWidget(
                        subreddit: 'r/${post.subreddit}',
                        title: post.title,
                        currentBody: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Respostas",
                                  style: AppTextStyles.h7_bold,
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .4,
                              child: ListView.builder(
                                itemCount: itens.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CommentListItemWidget(
                                    item: itens.elementAt(index),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
      } else {
        ToastUtil.showToast(
          "Nenhum comentário para esse post",
          Toast.LENGTH_SHORT,
        );
      }
    }

    return InkWell(
      onTap: () => showComments(),
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
  }
}
