import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/view_model/posts_viewModel.dart';
import 'package:provider/provider.dart';


class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {




  TextEditingController searchController=TextEditingController();
  int? selectedIndex;

 ///init functoin
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider=Provider.of<PageViewModel>(context,listen: false);
      provider.getPost();
    });

  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }





  @override
  Widget build(BuildContext context) {

    final provider=Provider.of<PageViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Posts Page"), 
          actions:[
            IconButton(onPressed: (){
              provider.reverseListFunction();

            }, icon: const Icon(Icons.sort) ,
            )
            
          ]
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children:
          [


            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: searchController,
                onChanged: (value){
                  provider.filterList(value);
                },
                decoration:const InputDecoration(
                  hintText: "Search here",

                ) ,
              ),
            ),

            provider.postList.isEmpty==true?
            const CupertinoActivityIndicator():
                provider.resultList.isEmpty==false?
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder:(context,index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          },

                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color:selectedIndex==index?Colors.cyanAccent: Colors.cyan,
                                borderRadius: BorderRadius.circular(14)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.resultList[index].title??"",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow:  TextOverflow.ellipsis
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    provider.resultList[index].body.toString()??"",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black54,
                                        overflow:  TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        );
                      }, separatorBuilder: (context,index) {
                    return const SizedBox(height: 10);
                  }, itemCount: provider.resultList.length),
                ):
                provider.reverseList==false?
                Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder:(context,index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=index;
                    });
                  },

                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        color:selectedIndex==index?Colors.cyanAccent: Colors.cyan,
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.postList[index].title??"",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                              overflow:  TextOverflow.ellipsis
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            provider.postList[index].body.toString()??"",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black54,
                                overflow:  TextOverflow.ellipsis
                          ),
                          ),
                        ],
                      ),
                    ),

                  ),
                );
              }, separatorBuilder: (context,index) {
                return const SizedBox(height: 10);
              }, itemCount: 10),
            ):
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder:(context,index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          },

                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color:selectedIndex==index?Colors.cyanAccent: Colors.cyan,
                                borderRadius: BorderRadius.circular(14)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.reversedList[index].title??"",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow:  TextOverflow.ellipsis
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    provider.reversedList[index].body.toString()??"",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black54,
                                        overflow:  TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        );
                      }, separatorBuilder: (context,index) {
                    return const SizedBox(height: 10);
                  }, itemCount: 10),
                )
          ],
        ),
      ),
      
    );
  }






}
