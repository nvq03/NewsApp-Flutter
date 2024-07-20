import 'package:flutter/material.dart';
import 'package:google_login/model/article.dart';
import 'package:google_login/view/newsDetail.dart';
import 'package:google_login/viewmodel/NewsApi.dart';


class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {

  late Future<List<Article>> future;
  String? searchTerm;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<String> categoryItems = [
    "GENERAL",
    "BUSINESS",
    "ENTERTAINMENT",
    "HEALTH",
    "SCIENCE",
    "SPORTS",
    "TECHNOLOGY",
  ];
  late String selectedCategory;

  @override
  void initState() {
    selectedCategory = categoryItems[0];
    future = getNewsData();
    super.initState();
  }

  Future<List<Article>> getNewsData() async {
    NewsAPI newsAPI = NewsAPI("2b3350c2e130493a94f280d8c05ca388");
    return await newsAPI.getTopHeadlines(
      country: "us",
      query: searchTerm,
      category: selectedCategory,
      pageSize: 50,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching ? searchAppBar() : appBar(),
      body: SafeArea(
        child: Column(
          children: [
           _buildCategories(),
           Expanded(
            child: FutureBuilder(
              future: future, 
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ); 
                }
                else if(snapshot.hasError){
                 return const Center(
                  child: Text('Erorr Loading The News'),
                 );
                }
                 else{
                   if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return _builNewsListView(snapshot.data as List<Article>);
                   } else {
                    return const Center(
                      child: Text('No News Available'),
                    );
                   }
                } 
              }
              )
            )
                 
          ],
        )
        ),
    );
  }

  searchAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      leading: IconButton(
        icon:  Icon(Icons.arrow_back),
        onPressed: () {
          setState(() {
            isSearching = false;
            searchTerm = null;
            searchController.text = "";
            future = getNewsData();
          });
        },
      ),
      title: TextField(
        controller: searchController,
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
          )
        ),
      ),
      actions: [
        IconButton(
          onPressed: (){setState(() {
          searchTerm = searchController.text;
          future = getNewsData();
        });},
        icon: const Icon(Icons.search)
        )
      ],
    );
  }

    appBar() {
    return AppBar(
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.newspaper)),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      title: const Text("Read News", style: TextStyle(fontFamily: 'Lexend', fontSize: 22,fontWeight: FontWeight.bold),),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                isSearching = true;
              });
            },
            icon: const Icon(Icons.search)),
      ],
    );
  }

  

 Widget _buildCategories() {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: SizedBox(
        height: 60,
        child: ListView.builder(
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    selectedCategory = categoryItems[index];
                    future = getNewsData();
                  });
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    categoryItems[index] == selectedCategory ? Color.fromARGB(255, 197, 197, 197).withOpacity(0.5) : const Color.fromARGB(255, 255, 255, 255),
                     
                  )
                ),
                child: Text(categoryItems[index],style: TextStyle(color: Colors.black),),
                
                ),
            );
          },
          itemCount: categoryItems.length,
          scrollDirection: Axis.horizontal,
          ),
       ),
     );
   }
   
     Widget _builNewsListView(List<Article> articleList) {
       return ListView.builder(
        itemCount: articleList.length,
        itemBuilder: (context, index){
          Article article = articleList[index];
          return _buildNewsItem(article);
        }
        );
     }
     
       Widget _buildNewsItem(Article article) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail(url: article.url!)));
                },
                child:  Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(article.urlToImage ?? "",
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) { return  Image.asset('assets/d.jpg');},
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(article.title!, maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                              Text(article.source!.name!,style: TextStyle(color: Colors.grey)),
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
                        SizedBox(height: 10,),
          ],
        );
       }

}

