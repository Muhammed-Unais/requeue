import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/data/response/api_response.dart';
import 'package:requeue/data/response/status.dart';
import 'package:requeue/features/home/model/restaurent_model.dart';
import 'package:requeue/features/home/view_model/restaurent_viewmodel_provider.dart';
import 'package:requeue/res/components/restaurent_card.dart';
import 'package:requeue/res/constants/app_colors.dart';

class HomeBodyPickup extends StatefulWidget {
  const HomeBodyPickup({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<HomeBodyPickup> createState() => _HomeBodyPickupState();
}

class _HomeBodyPickupState extends State<HomeBodyPickup> {
  ScrollController scrollController = ScrollController();
  late RestaurantViewModelProvider restuarenProvider;

  int page = 1;
  List<Restaurents>? pickUprestuarents;
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
      if (pickUprestuarents != null &&
          pickUprestuarents!.length >= restuarenProvider.pickUpItemsCount) {
        isLimit = true;
        if (mounted) {
          setState(() {});
        }
        return;
      }
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page += 1;
        await pickUpInpagination();
      }
    });
  }

  void getAllRestuarents() {
    restuarenProvider = context.read<RestaurantViewModelProvider>();
    pickUprestuarents ??
        restuarenProvider.getAllPickedUpRestaurent(context: context);
  }

  Future<void> pickUpInpagination() async {
    var newRestuarents = await restuarenProvider.paginationPickedUpRestaurent(
        page: page, context: context);
    pickUprestuarents = pickUprestuarents! + newRestuarents!;
    setState(() {});
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

          status = value.pickedrestaurantResponse.status;
          apiResponse = value.pickedrestaurantResponse;
          pickUprestuarents ??= apiResponse.data?.data;
          length = pickUprestuarents?.length;

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
                        final restuarent = pickUprestuarents?[index];
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
