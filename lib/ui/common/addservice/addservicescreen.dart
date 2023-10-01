import 'package:expert_reach/constants/colors.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AddServiceScreen extends StatelessWidget {
  AddServiceScreen({super.key});

  final List<String> districtNames = [
    "All",
    "Ampara",
    "Anuradhapura",
    "Badulla",
    "Batticaloa",
    "Colombo",
    "Galle",
    "Gampaha",
    "Hambantota",
    "Jaffna",
    "Kalutara",
    "Kandy",
    "Kegalle",
    "Kilinochchi",
    "Kurunegala",
    "Mannar",
    "Matale",
    "Matara",
    "Monaragala",
    "Mullaitivu",
    "Nuwara Eliya",
    "Polonnaruwa",
    'Puttalam',
    "Ratnapura",
    "Trincomalee",
    "Vavuniya"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(
          "Expert Reach",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                child: Text('Add Your Service',
                    style: Theme.of(context).textTheme.displaySmall),
              ),
              const SizedBox(height: 10),

              // Add Service Form
              Form(
                  child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.text_fields_outlined,
                      color: cPrimaryColor,
                    ),
                    labelText: 'Service Title',
                    hintText: 'Enter Service Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Service Description',
                    hintText: 'Enter Service Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 18,
                          ),
                        ),
                        //location icon
                        icon: const Icon(
                          Icons.location_on,
                          color: cPrimaryColor,
                        ),
                        value: "All",
                        items: districtNames
                            .map(
                              (district) => DropdownMenuItem(
                                value: district,
                                child: Text(
                                  district,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.attach_money,
                            color: cPrimaryColor,
                          ),
                          labelText: 'Hourly Rate',
                          hintText: 'Enter Hourly Rate',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                //Preview Image
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    underConstruction,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    onPressed: () {
                      //  uploadHomeworkController
                      //                 .getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons
                            .upload), // Replace 'Icons.upload' with the icon you want
                        SizedBox(
                            width:
                                8), // Adjust the spacing between the icon and text
                        Text('Upload Image'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                // terms and conditions
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text('I agree to the ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextButton(
                      onPressed: () {},
                      child: Text('Terms and Conditions',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: cPrimaryColor,
                                  )),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Service'),
                  ),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
