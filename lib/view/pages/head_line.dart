import 'package:covidapp/models/models/virus_model.dart';
import 'package:covidapp/view/conponents/head_line_item.dart';
import 'package:covidapp/view/conponents/transition.dart';
import 'package:covidapp/view/data/search_type.dart';
import 'package:covidapp/view/screens/news_web_page.dart';
import 'package:covidapp/viewmodel/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsViewModel=Provider.of<NewsViewModel>(context,listen: false);
    if(!newsViewModel.isLoading){
      Future(()=>newsViewModel.getHeadLine(searchtype: SearchType.HEAD_LINE));
    }
    return Scaffold(
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.deepOrange,
       child: Icon(Icons.refresh),
       onPressed: ()=>onUpdate(context),
     ),
      body: Container(
        color: Colors.orange[200],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<NewsViewModel>(builder: (context, model, child) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator(
               backgroundColor: Colors.deepOrange,
               valueColor:AlwaysStoppedAnimation<Color>(Colors.white),
              ));
            } else {
              return PageTransformer(pageViewBuilder: (context, pageVisibilityResolver) {
                return PageView.builder(
                  controller: PageController(viewportFraction: 0.90),
                  itemCount: model.articles.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final article = model.articles[index];
                    final pageVisibility=pageVisibilityResolver.resolvePageVisibility(index);
                    final visibleFraction=pageVisibility.visibleFraction;
                    return HeadLineItem(
                      article: model.articles[index],
                      pageVisibility: pageVisibility,
                      onArticledTap: (article)=>_onArticleWebPage(context,article),
                    );
                  },
                );
              });
            }
          }),
        ),
      ),
    );
  }

  onUpdate(BuildContext context)async {
    final newsViewModel=Provider.of<NewsViewModel>(context,listen: false);
    await newsViewModel.getHeadLine(searchtype:SearchType.HEAD_LINE);
  }
  _onArticleWebPage(BuildContext context,Article article) {
    print('headline${article.url}');
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsWebPageScreen(article: article)));
  }
}
