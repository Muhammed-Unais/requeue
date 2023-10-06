import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/data/response/api_response.dart';
import 'package:requeue/data/response/status.dart';
import 'package:requeue/features/home/model/restaurent_model.dart';
import 'package:requeue/features/home/view_model/restaurent_viewmodel_provider.dart';
import 'package:requeue/res/components/restaurent_card.dart';
import 'package:requeue/res/constants/app_colors.dart';

class HomeBodyDiniIn extends StatefulWidget {
  const HomeBodyDiniIn({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<HomeBodyDiniIn> createState() => _HomeBodyDiniInState();
}

class _HomeBodyDiniInState extends State<HomeBodyDiniIn> {
  ScrollController scrollController = ScrollController();
  late RestaurantViewModelProvider restuarenProvider;

  int page = 1;
  List<Restaurents>? dineInrestuarents;
  bool isLimit = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllRestuarents();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    listenScrollControllor();
    super.didChangeDependencies();
  }

  void listenScrollControllor() {
    scrollController.addListener(() async {
      if (dineInrestuarents != null &&
          dineInrestuarents!.length >= restuarenProvider.dineInItemsCount) {
        isLimit = true;
        if (mounted) setState(() {});
        return;
      }
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page += 1;
        await dineInpagination();
      }
    });
  }

  void getAllRestuarents() {
    restuarenProvider = context.read<RestaurantViewModelProvider>();
    dineInrestuarents ??
        restuarenProvider.getAlldineinRestaurent(context: context);
  }

  Future<void> dineInpagination() async {
    var newRestuarents = await restuarenProvider.paginationDineinRestaurent(
        page: page, context: context);
    dineInrestuarents = dineInrestuarents! + newRestuarents!;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<RestaurantViewModelProvider>(
        builder: (context, value, child) {
          Status? status;
          ApiResponse<RestuarentModel>? apiResponse;
          int? length;

          status = value.dineinrestaurantResponse.status;
          apiResponse = value.dineinrestaurantResponse;
          dineInrestuarents ??= apiResponse.data?.data;
          length = dineInrestuarents?.length;

          switch (status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              );
            case Status.completed:
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: length,
                      itemBuilder: (context, index) {
                        final restuarent = dineInrestuarents?[index];
                        return RestarentCard(
                          rating: restuarent?.rating?.ceilToDouble(),
                          image: restuarent?.logo,
                          titile: restuarent?.nameEn,
                        );
                      },
                    ),
                    if (!isLimit)
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      )
                  ],
                ),
              );
            case Status.error:
              return Center(
                child: Text(
                  apiResponse.message ?? "",
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
