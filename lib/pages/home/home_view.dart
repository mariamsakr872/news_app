import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widgets/category_item.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';
import 'package:news_app/pages/home/news_view.dart';
import 'package:news_app/pages/home/widgets/open_search.dart';
import 'package:provider/provider.dart';

import '../../app_provider.dart';
import '../../core/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoryModel? selectCategoryModel;
  List<CategoryModel> categories = [
    CategoryModel(
        categoryId: "sports",
        categoryTitle: "Sports",
        categoryImage: "assets/images/sports.png",
        categoryColor: const Color(0xFFC91C22)),
    CategoryModel(
        categoryId: "general",
        categoryTitle: "Politics",
        categoryImage: "assets/images/Politics.png",
        categoryColor: const Color(0xFF003E90)),
    CategoryModel(
        categoryId: "health",
        categoryTitle: "Health",
        categoryImage: "assets/images/health.png",
        categoryColor: const Color(0xFFED1E79)),
    CategoryModel(
        categoryId: "business",
        categoryTitle: "Business",
        categoryImage: "assets/images/bussines.png",
        categoryColor: const Color(0xFFCF7E48)),
    CategoryModel(
        categoryId: "entertainment",
        categoryTitle: "Entertainment",
        categoryImage: "assets/images/environment.png",
        categoryColor: const Color(0xFF4882CF)),
    CategoryModel(
        categoryId: "science",
        categoryTitle: "Science",
        categoryImage: "assets/images/science.png",
        categoryColor: const Color(0xFFF2D352)),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/pattern.png",
            ),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectCategoryModel == null
                ? locale!.news_app
                : selectCategoryModel!.categoryTitle,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: OpenSearch(),);
                },
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: CustomDrawer(
          onCategoryClicked: onDrawerClickedCategoryClicked,
        ),
        body: selectCategoryModel == null
            ? Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your category \n of interest",
                      textAlign: (appProvider.currentLocale == "en")
                          ? TextAlign.start
                          : TextAlign.end,
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: const Color(0xFF4F5A69)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 9 / 10,
                        ),
                        itemBuilder: (context, index) => CategoryItem(
                            categoryModel: categories[index],
                            index: index,
                            onItemClick: onCategoryItemClick),
                        itemCount: categories.length,
                      ),
                    )
                  ],
                ),
              )
            : NewsView(categoryModel: selectCategoryModel!),
      ),
    );
  }

  onCategoryItemClick(CategoryModel categoryModel) {
    selectCategoryModel = categoryModel;
    setState(() {});
  }

  onDrawerClickedCategoryClicked() {
    selectCategoryModel = null;
    Navigator.pop(context);
    setState(() {});
  }
}
