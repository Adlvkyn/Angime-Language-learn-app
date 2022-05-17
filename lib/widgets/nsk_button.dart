import 'package:flutter/material.dart';

class NskButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const NskButton({ Key? key , this.onPressed,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 24 ,left: 15,right: 15),
                  height: 60,
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(elevation: 0,
                      primary: const Color(0xFFE1F8FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // <-- Radius
                        
                      ),
                    minimumSize: const Size.fromHeight(50)
                    ),
                    onPressed: onPressed,
                    child:Text(text,
                        style:const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            letterSpacing: 0.16,
                            color: Colors.black)),
                 
                  ),
             
    );
  }
}