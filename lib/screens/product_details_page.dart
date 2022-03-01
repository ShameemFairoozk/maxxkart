import 'package:flutter/material.dart';
import 'package:maxxkart_flutter/constants/text_style.dart';
import 'package:maxxkart_flutter/providers/home_provider.dart';
import 'package:provider/provider.dart';
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider provider =Provider.of<HomeProvider>(context,listen: false);

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<HomeProvider>(
          builder: (context,value,child) {
            if(value.productsDetailsModel!=null){
              return Column(
                children: [
                  Container(
                    height: 300,
                    padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
                    child: Image.network(value.productsDetailsModel!.image),

                    // child: Image.network(''),

                  ),
                  Expanded(child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        color:Color(0xff377c80),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(value.productsDetailsModel!.proName,style: white12,),
                        Text(value.productsDetailsModel!.attribute,style: white12,),
                        double.parse(value.productsDetailsModel!.sellingPrice)<double.parse(value.productsDetailsModel!.price)?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(value.productsDetailsModel!.price,style: black16Cross,),
                            ),
                            Text(value.productsDetailsModel!.sellingPrice,style: red16,),
                          ],
                        ):
                        Text(value.productsDetailsModel!.sellingPrice,style: red16,),
                        Center(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(icon:  const Icon(Icons.remove_circle_outline,color: Colors.white,size: 30,),
                                  onPressed: (){
                                    if(int.parse(value.productsDetailsModel!.cartQty)>0){
                                      provider.decrement();
                                    }
                                  },
                                ),
                                 SizedBox(
                                    width: 40,
                                    child: Center(child: Text(
                                      value.productsDetailsModel!.cartQty,
                                      style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),))),
                                IconButton(icon: const Icon(Icons.add_circle_outline,color: Colors.white,size: 30,),
                                  onPressed: (){

                                    provider.increment();

                                  },
                                )
                              ],
                            ),

                          ),
                        ),
                        Text('Total :'+value.productsDetailsModel!.total,style: white,),
                        const Divider(thickness: 3,color: Colors.black,endIndent: 20,indent: 20,),
                        Align(
                          alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Product details',style: white12,),
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              child: Text('Company : '+value.productsDetailsModel!.company,style: white14,),
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              child: Text('Category : '+value.productsDetailsModel!.category,style: white14,),
                            )),


                      ],
                    ),
                  ))

                ],
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }

        }
      ),
    );
  }
}
