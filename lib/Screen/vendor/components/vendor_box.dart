import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/models/variation_option.dart';
import 'package:wedding_planning_application/screen/vendor/vendor_single_list.dart';


vendorBox(ServiceCategory category, List<VariationOption> options,
   BuildContext context) {
  return InkWell(
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.97,
      height: MediaQuery.of(context).size.width * 0.29,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0,
            left: MediaQuery.of(context).size.width * 0.01,
            right: MediaQuery.of(context).size.width * 0.01,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.97,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 1),
                      blurRadius: 4,
                    )
                  ],
                  color: const Color.fromRGBO(221, 189, 190, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(77, 43, 43, 1),
                    width: 0.5,
                  )),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            category.icon,
                          ),
                          fit: BoxFit.cover,
                          opacity: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(65, 65)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.97,),
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,            
                      children: [
                        Text(
                          category.serviceCategoryName,
                          style: const TextStyle(
                            color: Color.fromRGBO(85, 32, 32, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                            // overflow:  TextOverflow.ellipsis
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        
                        SizedBox(
                          width: 230,
                          child: Text(
                            options.isNotEmpty ? getOptions(options) : "",
                             textAlign: TextAlign.justify,

                            style: const TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                             fontStyle: FontStyle.normal,
                               
                              fontSize: 12,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1,
                              // overflow:  TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
    onTap: () async {
  Get.to(() =>   VendorSingleList(category.serviceCategoryId),);
      
      
    },
  );
}

String getOptions(List<VariationOption> options) {
  String optionsString = "";
  for (int i = 0; i < options.length; i++) {
    if (i == options.length - 1) {
      optionsString += options[i].variationOptionName;
    } else {
      optionsString += "${options[i].variationOptionName}, ";
    }
  }
  return optionsString;
}
