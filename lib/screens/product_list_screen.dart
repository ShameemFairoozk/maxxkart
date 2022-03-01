import 'package:flutter/material.dart';
import 'package:maxxkart_flutter/constants/text_style.dart';
import 'package:maxxkart_flutter/providers/home_provider.dart';
import 'package:maxxkart_flutter/screens/product_details_page.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var height = queryData.size.height;
    var width = queryData.size.width;
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xff377c80),
      body: Consumer<HomeProvider>(builder: (context, value, child) {
        if(value.productList.isNotEmpty){
          return Column(
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    //    ...,other fields
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search Item',
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (item) {
                      provider.onSearchItem(item);
                    },
                  ),
                ),
              ),
              Container(
                height: height-150,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ListView.builder(
                    itemCount: value.filteredList.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = value.filteredList[index];
                      return InkWell(
                        onTap: () {
                          provider.getProductDetails(item.id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage()));
                        },
                        child: Card(
                          child: Container(
                            height: 150,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(item.image))
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.proName,
                                          style: black16,
                                        ),
                                        Text(
                                          item.attribute,
                                          style: black12,
                                        ),
                                        double.parse(item.sellingPrice) <
                                            double.parse(item.price)
                                            ? Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  right: 10),
                                              child: Text(
                                                '₹'+item.price,
                                                style: black16Cross,
                                              ),
                                            ),
                                            Text(
                                              '₹'+item.sellingPrice,
                                              style: red16,
                                            ),
                                          ],
                                        )
                                            : Text(
                                          '₹'+item.sellingPrice,
                                          style: red16,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );

        }else{
        return const Center(child: CircularProgressIndicator(color: Colors.white,));
        }
      }),
    );
  }
}
