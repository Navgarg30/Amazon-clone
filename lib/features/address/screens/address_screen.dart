// import 'package:amazon_clone/constants/utils.dart';
// import 'package:amazon_clone/features/address/services/address_services.dart';
// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
// import 'package:provider/provider.dart';
// import 'package:amazon_clone/common/widgets/custom_textfield.dart';
// import 'package:amazon_clone/constants/global_variables.dart';
// import 'package:amazon_clone/providers/user_provider.dart';
// import 'package:flutter_pay/flutter_pay.dart';

// class AddressScreen extends StatefulWidget {
//   static const String routeName = '/address';
//   final String totalAmount;
//   const AddressScreen({
//     Key? key,
//     required this.totalAmount,
//   }) : super(key: key);

//   @override
//   State<AddressScreen> createState() => _AddressScreenState();
// }

// class _AddressScreenState extends State<AddressScreen> {
//   final TextEditingController flatBuildingController = TextEditingController();
//   final TextEditingController areaController = TextEditingController();
//   final TextEditingController pincodeController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final _addressFormKey = GlobalKey<FormState>();

//   String addressToBeUsed = "";
//   List<PaymentItem> paymentItems = [];
//   final AddressServices addressServices = AddressServices();

//   @override
//   void initState() {
//     super.initState();
//     paymentItems.add(
//       PaymentItem(
//         amount: widget.totalAmount,
//         label: 'Total Amount',
//         status: PaymentItemStatus.final_price,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     flatBuildingController.dispose();
//     areaController.dispose();
//     pincodeController.dispose();
//     cityController.dispose();
//   }

//   void onApplePayResult(res) {
//     if (Provider.of<UserProvider>(context, listen: false)
//         .user
//         .address
//         .isEmpty) {
//       addressServices.saveUserAddress(
//           context: context, address: addressToBeUsed);
//     }
//     addressServices.placeOrder(
//       context: context,
//       address: addressToBeUsed,
//       totalSum: double.parse(widget.totalAmount),
//     );
//   }

//   void onGooglePayResult(res) {
//     if (Provider.of<UserProvider>(context, listen: false)
//         .user
//         .address
//         .isEmpty) {
//       addressServices.saveUserAddress(
//           context: context, address: addressToBeUsed);
//     }
//     addressServices.placeOrder(
//       context: context,
//       address: addressToBeUsed,
//       totalSum: double.parse(widget.totalAmount),
//     );
//   }

//   void payPressed(String addressFromProvider) {
//     addressToBeUsed = "";

//     bool isForm = flatBuildingController.text.isNotEmpty ||
//         areaController.text.isNotEmpty ||
//         pincodeController.text.isNotEmpty ||
//         cityController.text.isNotEmpty;

//     if (isForm) {
//       if (_addressFormKey.currentState!.validate()) {
//         addressToBeUsed =
//             '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
//       } else {
//         throw Exception('Please enter all the values!');
//       }
//     } else if (addressFromProvider.isNotEmpty) {
//       addressToBeUsed = addressFromProvider;
//     } else {
//       showSnackBar(context, 'ERROR');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var address = context.watch<UserProvider>().user.address;

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: GlobalVariables.appBarGradient,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               if (address.isNotEmpty)
//                 Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.black12,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           address,
//                           style: const TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       'OR',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               Form(
//                 key: _addressFormKey,
//                 child: Column(
//                   children: [
//                     CustomTextField(
//                       controller: flatBuildingController,
//                       hintText: 'Flat, House no, Building',
//                     ),
//                     const SizedBox(height: 10),
//                     CustomTextField(
//                       controller: areaController,
//                       hintText: 'Area, Street',
//                     ),
//                     const SizedBox(height: 10),
//                     CustomTextField(
//                       controller: pincodeController,
//                       hintText: 'Pincode',
//                     ),
//                     const SizedBox(height: 10),
//                     CustomTextField(
//                       controller: cityController,
//                       hintText: 'Town/City',
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//               ApplePayButton(
//                 width: double.infinity,
//                 style: ApplePayButtonStyle.whiteOutline,
//                 type: ApplePayButtonType.buy,
//                 paymentConfiguration:
//                     PaymentConfiguration.fromJsonString('applepay.json'),
//                 onPaymentResult: onApplePayResult,
//                 paymentItems: paymentItems,
//                 margin: const EdgeInsets.only(top: 15),
//                 height: 50,
//                 onPressed: () => payPressed(address),
//               ),
//               const SizedBox(height: 10),
//               GooglePayButton(
//                 onPressed: () => payPressed(address),
//                 paymentConfiguration:
//                     PaymentConfiguration.fromJsonString('gpay.json'),
//                 onPaymentResult: onGooglePayResult,
//                 paymentItems: paymentItems,
//                 height: 50,
//                 //style: GooglePayButtonStyle.black,
//                 type: GooglePayButtonType.buy,
//                 margin: const EdgeInsets.only(top: 15),
//                 loadingIndicator: const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_pay/flutter_pay.dart'; // Ensure you have this package in your pubspec.yaml

class AddressScreen extends StatefulWidget {
  final String totalAmount;

  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = "";
  final FlutterPay flutterPay = FlutterPay(); // Initialize FlutterPay instance

  @override
  void dispose() {
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
    super.dispose();
  }

  Future<void> processPayment(String addressFromProvider) async {
    addressToBeUsed = "";

    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter all the values!')),
        );
        return;
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in the address.')),
      );
      return;
    }

    final paymentItems = [
      PaymentItem(
        name: '',
        price: double.parse(widget.totalAmount),
      ),
    ];

    try {
      bool canPay = await flutterPay.canMakePayments();
      if (canPay) {
        await flutterPay.requestPayment(
          googleParameters: GoogleParameters(
            gatewayName: "example", // Replace with your actual gateway name
            gatewayMerchantId:
                "exampleMerchantId", // Replace with your actual merchant ID
            merchantName: "Your Merchant Name", // Your merchant name
          ),
          appleParameters: AppleParameters(
            merchantIdentifier:
                'merchant.com.example', // Replace with your actual merchant ID for Apple Pay
          ),
          currencyCode: 'INR', // Currency code
          countryCode: 'IN', // Country code (Use 'IN' for India)
          paymentItems: paymentItems,
        );

        // Save address if not already saved
        if (addressToBeUsed.isNotEmpty) {
          // Implement your address saving logic here
        }

        // Place the order
        // Implement your order placing logic here
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment method not available.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sample user address. Replace this with your actual implementation
    String address = ''; // Replace with actual address

    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: flatBuildingController,
                      decoration: const InputDecoration(
                        hintText: 'Flat, House no, Building',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the flat/house/building';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: areaController,
                      decoration: const InputDecoration(
                        hintText: 'Area, Street',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the area/street';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: pincodeController,
                      decoration: const InputDecoration(
                        hintText: 'Pincode',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the pincode';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        hintText: 'Town/City',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the city/town';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => processPayment(address),
                child: const Text('Pay with Google Pay/Apple Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
