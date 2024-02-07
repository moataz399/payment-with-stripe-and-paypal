import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/theming/text_styles.dart';

import '../widgets/custom_dashed_line.dart';
import '../widgets/payment_info_item.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: const Color(0XFFEDEDED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 50 + 16, left: 12, right: 12),
                  child: Column(
                    children: [
                      Text(
                        "Thank You!",
                        style: TextStyles.font22BlackRegular,
                      ),
                      Text(
                        "Your transaction was successful",
                        style: TextStyles.font18BlackRegular.copyWith(
                            fontSize: 20,
                            color: Colors.black.withOpacity(
                              .8,
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      PaymentItemInfo(title: "Date", value: "01/24/2023"),
                      SizedBox(height: 20),
                      PaymentItemInfo(title: "Time", value: "10:15 AM"),
                      SizedBox(height: 20),
                      PaymentItemInfo(title: "To", value: "Sam Louis"),
                      Divider(
                        height: 40,
                        color: Colors.grey.withOpacity(.5),
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyles.font22BlackSemiBold,
                          ),
                          Text(
                            '\$32',
                            style: TextStyles.font22BlackSemiBold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        height: 70,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23.0),
                          child: Row(
                            children: [
                              Image.asset("assets/images/master_card.png"),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Credit Card",
                                    style: TextStyles.font18BlackRegular,
                                  ),
                                  Text(
                                    "Mastercard **78",
                                    style: TextStyles.font14GrayRegular,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            FontAwesomeIcons.barcode,
                            size: 60,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "paid",
                                style: TextStyles.font24GreenBold,
                              ),
                            ),
                            width: 113,
                            height: 60,
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: Colors.green,
                                width: 1.5,
                              ),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            (MediaQuery.sizeOf(context).height * .1 + 20) - 28,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: -20,
                  bottom: MediaQuery.sizeOf(context).height * .2,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
              Positioned(
                  right: -20,
                  bottom: MediaQuery.sizeOf(context).height * .2,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
              const Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0XFFD9D9D9),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: Icon(
                      size: 50,
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * .2 + 20,
                left: 20 + 8,
                right: 20 + 8,
                child: const CustomDashedLine(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
