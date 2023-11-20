import 'package:flutter/material.dart';
import 'package:news_app/pages/home/home_view_model.dart';
import 'package:news_app/pages/home/widgets/tab_item.dart';
import 'package:provider/provider.dart';

import '../../../core/models/category_model.dart';
import 'article_details.dart';
import 'article_item.dart';

class NewsDetailsView extends StatefulWidget {
  final CategoryModel categoryModel;

  const NewsDetailsView({super.key, required this.categoryModel});

  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  var vm = HomeViewModel();

  @override
  void initState() {
    Future.wait([
      vm.getSources(widget.categoryModel.categoryId),
    ]).then((value) {
      if (value[0] == true) {
        vm.getArticles(vm.sourcesList[vm.selectedIndex].id!);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return DefaultTabController(
              initialIndex: vm.selectedIndex,
              length: vm.sourcesList.length,
              child: Column(
                children: [
                  viewModel.sourcesList.isEmpty ?
                  const Center(
                    child: CircularProgressIndicator(),
                  ) :
                  TabBar(
                    isScrollable: true,
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    indicatorColor: Colors.transparent,
                    onTap: (index) {
                      vm.changeIndex(index);
                      vm.getArticles(vm.sourcesList[vm.selectedIndex].id!);
                      setState(() {});
                    },
                    tabs: vm.sourcesList
                        .map((source) => TabItem(
                              source: source,
                              isSelected: vm.selectedIndex ==
                                  vm.sourcesList.indexOf(source),
                            ))
                        .toList(),
                  ),
                  if(viewModel.articlesList.isNotEmpty)
                     Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => ArticleItem(
                                article: viewModel.articlesList[index]),
                            itemCount: viewModel.articlesList.length,
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
