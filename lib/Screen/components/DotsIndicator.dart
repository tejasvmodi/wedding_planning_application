import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

DotsIndicator dots(data,active){

  return DotsIndicator(
                              dotsCount: data.length,
                              position: active.toInt(),
                              decorator: const DotsDecorator(
                                size: Size.square(10.0),
                                activeSize: Size(20.0, 9.0),
                                color: Colors.grey, // Inactive dot color
                                activeColor: Color.fromRGBO(54, 29, 29, 1),
                                // Active dot Color
                                 
                              ),
                            );
}