import 'package:api_integration/Screens/expired_post_viewmodel.dart';
import 'package:api_integration/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpiredPostView extends StatelessWidget {
  ExpiredPostView({super.key});
  ExpiredViewModel viewModel = Get.put(ExpiredViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Expired post",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: viewModel.item.data!.length,
        itemBuilder: (BuildContext context, index) {
          // DateTime now = DateTime.now();
          // String pattern = 'yyyy-MM-dd';
          // DateFormat formatter = DateFormat(pattern);
          // String formattedDate = formatter.format(now);
          // print('Formatted Date: $formattedDate');
          return Container(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.item.data![index].adTitle.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(viewModel.item.data![index].createdAt.toString()),
                    const SizedBox(height: 10),
                    Text(viewModel.item.data![index].tags.toString()),
                    const SizedBox(height: 20),
                    Container(
                      height: 300,
                      width: 400,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn23Y6lBs7d-LOYQSIwndAEgHdqvABxQ4ZaQ&usqp=CAU"),
                    ),
                    Text(viewModel.item.data![index].description.toString()),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Column(
                          children: [
                            Text(
                                viewModel.item.data![index].location.toString())
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                            text: "Repost",
                            textColor: Colors.black,
                            btnColor: Colors.green),
                        CustomButton(
                            text: "sold",
                            textColor: Colors.black,
                            btnColor: Colors.green)
                      ],
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
