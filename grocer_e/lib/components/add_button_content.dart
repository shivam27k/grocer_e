import 'package:get/get.dart';
import 'package:grocer_e/consts/consts.dart';
import 'package:grocer_e/controllers/product_controller.dart';

class AddButtonContent extends StatelessWidget {
  final String productTitle;
  final String productCategory;
  final String productPrice;
  final String productQuantity;
  final String productAvailable;
  final String maxAvailable;
  final String totalPrice;
  final String productImage;
  final String storeName;

  const AddButtonContent({
    super.key,
    required this.productTitle,
    required this.productCategory,
    required this.productPrice,
    required this.productQuantity,
    required this.productAvailable,
    required this.maxAvailable,
    required this.totalPrice,
    required this.productImage,
    required this.storeName,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            productTitle,
            softWrap: false,
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: regular,
              color: blueColor,
              decoration: TextDecoration.none,
            ),
          ),
          UnconstrainedBox(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: logoTextColor,
                borderRadius: BorderRadius.circular(2),
              ),
              height: 15,
              child: Text(
                productCategory,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: regular,
                  color: blueColor,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          20.heightBox,
          Row(
            children: [
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  // color: logoTextColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                height: 15,
                child: Text(
                  "Available: $productAvailable",
                  style: const TextStyle(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: regular,
                    color: redColor,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              (context.screenWidth * 0.25).widthBox,
              const Text(
                "Quantity:",
                style: TextStyle(
                    fontSize: 16,
                    color: lightGrey,
                    fontWeight: FontWeight.w600),
              ),
              5.widthBox,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: const Icon(Icons.remove, color: redColor),
                    ).onTap(
                      () {
                        controller.decreaseQuantity();
                        controller.calculateTotalPrice(int.parse(totalPrice));
                      },
                    ),
                    UnconstrainedBox(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(width: 1),
                          ),
                        ),
                        height: 30,
                        alignment: Alignment.center,
                        child: controller.quantity.value.text
                            .size(16)
                            .color(darkFontGrey)
                            .fontWeight(FontWeight.bold)
                            .make(),
                      ),
                    ),
                    Container(
                            decoration:
                                BoxDecoration(border: Border.all(width: 1)),
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            child: const Icon(Icons.add, color: redColor))
                        .onTap(
                      () {
                        controller.increaseQuantity(
                          int.parse(maxAvailable),
                        );
                        controller.calculateTotalPrice(int.parse(totalPrice));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          18.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.currency_rupee,
                color: greenColor,
                size: 15,
              ),
              Text(
                productPrice,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: regular,
                  color: greenColor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
              20.widthBox,
              const Icon(
                Icons.shopping_bag,
                color: blueColor,
                size: 15,
              ),
              Text(
                productQuantity,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: regular,
                  color: blueColor,
                  decoration: TextDecoration.none,
                ),
              ),
              (context.screenWidth * 0.26).widthBox,
              const Text(
                "Total:",
                style: TextStyle(
                    fontSize: 16,
                    color: lightGrey,
                    fontWeight: FontWeight.w600),
              ),
              5.widthBox,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.currency_rupee,
                        size: 18, color: greenColor),
                    UnconstrainedBox(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        height: 30,
                        alignment: Alignment.center,
                        child: controller.totalPrice.value.text
                            .size(20)
                            .color(greenColor)
                            .fontWeight(FontWeight.bold)
                            .make(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          27.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: (context.screenWidth) * 0.422,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    controller.quantity.value = 0;
                    controller.totalPrice.value = 0;
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      side: const BorderSide(width: 1, color: redColor)),
                  child: const Text(
                    "Cancel",
                    style:
                        TextStyle(color: redColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              2.widthBox,
              SizedBox(
                width: (context.screenWidth) * 0.422,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.quantity.value == 0) {
                      VxToast.show(context, msg: "Quantity is not valid");
                    } else {
                      controller.addToCart(
                        title: productTitle,
                        context: context,
                        image: productImage,
                        quantity: controller.quantity.value,
                        totalPrice: controller.totalPrice.value,
                        storeName: storeName,
                      );
                      Navigator.pop(context);
                      VxToast.show(context, msg: "Added to Cart");
                      controller.quantity.value = 0;
                      controller.totalPrice.value = 0;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                      shadowColor: Colors.transparent,
                      side: const BorderSide(width: 1, color: blueColor)),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ).box.padding(const EdgeInsets.fromLTRB(10, 20, 10, 10)).make(),
    );
  }
}














// 