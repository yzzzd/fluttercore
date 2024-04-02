import 'package:flutter/material.dart';
import 'package:flutter_core/base/screen/core_screen.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/widget/collect/collect.dart';
import 'package:example/core/data/model/news/news.dart';
import 'package:example/ui/home/home_view_model.dart';

class HomeScreen extends CoreScreen<HomeViewModel> {
  const HomeScreen({super.key});
  static const routeName = '/homeScreen';
  
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('Home', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        leading: const Icon(Icons.flutter_dash_outlined),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () => {
            Get.defaultDialog(
              title: 'Logout',
              titlePadding: const EdgeInsets.only(top: 24, bottom: 16),
              middleText: 'Are you sure want to logout?',
              confirm: TextButton(onPressed: () => viewModel.logout(), child: const Text('Logout')),
              cancel: TextButton(onPressed: () => Get.back(), child: const Text('Cancel'))
            )
          }, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Collect(() => Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Text('Welcome ${viewModel.user.value?.name}', style: const TextStyle(fontSize: 16)),
              const Gap(16),
              ...viewModel.news.value.map((data) => _itemNews(data)).toList()
            ],
          ),
          Visibility(
            visible: viewModel.newsLoading.value == true,
            child: const CircularProgressIndicator(),
          ),
        ],
      ),),
    );
  }

  Widget _itemNews(News news) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 72,
                height: 72,
                child: Image.network(
                  news.image ?? '', 
                  fit: BoxFit.cover, 
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(padding: const EdgeInsets.all(24), child: const CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey, child: const Icon(Icons.image_not_supported_outlined, color: Colors.white))
                )
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  children: [
                    Text(news.title ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), maxLines: null),
                    Text(news.description ?? '', style: const TextStyle(fontSize: 12), maxLines: 3, overflow: TextOverflow.ellipsis),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(news.prettyPublishedAt, style: const TextStyle(fontSize: 12)),
                        const Icon(Icons.share_outlined, size: 16)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Gap(16),
          Container(
            height: 1,
            color: const Color(0xFFDFDFDF),
          )
        ],
      ),
    );
  }
}
