import 'package:flutter/material.dart';
import 'package:new_8/data/auth/app_authentication.dart';
import 'package:new_8/data/data_source/products_data_source.dart';
import 'package:new_8/widgets/custom_elevated_button.dart';
import 'package:new_8/widgets/error_widget.dart';
import 'package:new_8/widgets/loading_widget.dart';
import 'package:new_8/widgets/products_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print('initState');

    if (ProductsDataSource.items.isEmpty) {
      ProductsDataSource.getProducts().then(
        (value) {
          setState(() {
            print('setState');
          });
        },
      );
    } else {
      print('data is already loaded before');
    }
  }

  @override
  void dispose() {
    print('Home Screen was disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: ProductsDataSource.isLoading
          ? const LoadingWidget()
          : ProductsDataSource.isError
              ? AppErrorWidget(
                  errorMessage: ProductsDataSource.errorMessage,
                  onTryAgain: () async {
                    ProductsDataSource.items.clear();
                    ProductsDataSource.isLoading = true;
                    ProductsDataSource.isError = false;
                    setState(() {});
                    await ProductsDataSource.getProducts();
                  },
                )
              : Center(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      ProductsDataSource.items.clear();
                      ProductsDataSource.isLoading = true;
                      setState(() {});
                      await ProductsDataSource.getProducts();
                      setState(() {});
                    },
                    child: const ProductsListView(),
                  ),
                ),
      drawer: Drawer(
        child: Column(
          children: [
            Spacer(),
            CustomElevatedButton(
              textButton: 'Sign Out',
              onPressed: () {
                AppAuthentication.signOut(context);
              },
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

/// bool ? true : false
///
/// if (bool) {
///  return true;
///  } else {
///  return false;
///  }
