import 'package:flutter/material.dart';

class InboundMobile extends StatefulWidget {
  const InboundMobile({super.key});

  @override
  State<InboundMobile> createState() => InboundMobileState();
}

class InboundMobileState extends State<InboundMobile> {
  String? _modeOfTransportation;
  final _pickupAddressController = TextEditingController();
  final _pickupPincodeController = TextEditingController();
  final _destinationAddressController = TextEditingController();
  final _destinationPincodeController = TextEditingController();
  final _approxWeightController = TextEditingController();
  final _contactPersonNameController = TextEditingController();
  final _contactPersonMobileController = TextEditingController();
  final _supplierNameController = TextEditingController();
  final _numberOfPackagesController = TextEditingController();
  final _packageDimensionsController = TextEditingController();
  final _documentPoNumberController = TextEditingController();
  final _specialInstructionsController = TextEditingController();
  final _invoiceValueController = TextEditingController();

  DateTime? _pickupDate;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        const Text(
          'Edit Inbound Request',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Transport Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              _buildInputField(
                label: 'Section',
                widget: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select',
                  ),
                  value: _modeOfTransportation,
                  onChanged: (value) {
                    setState(() {
                      _modeOfTransportation = value;
                    });
                  },
                  items: [
                    'Mode 1',
                    'Mode 2',
                    'Mode 3',
                  ].map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Pickup Address',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _pickupAddressController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Pickup Pincode',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _pickupPincodeController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Destination Address',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _destinationAddressController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Destination Pincode',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _destinationPincodeController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Approx Weight',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0 kg',
                  ),
                  controller: _approxWeightController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Invoice Value',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _invoiceValueController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Pickup Date',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                    hintText: 'dd-mm-yyyy',
                  ),
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() {
                        _pickupDate = date;
                      });
                    }
                  },
                  controller:
                      TextEditingController(text: _pickupDate?.toString()),
                ),
                isMobile: isMobile,
              ),
            ],
          ),
        ),
        const Text(
          'Pickup Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              _buildInputField(
                label: 'Contact Person Name',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _contactPersonNameController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Contact Person Mobile Number',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _contactPersonMobileController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Supplier Name',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _supplierNameController,
                ),
                isMobile: isMobile,
              ),
            ],
          ),
        ),
        const Text(
          'Package Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              _buildInputField(
                label: 'Number of Packages',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _numberOfPackagesController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Package Dimensions',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _packageDimensionsController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Special Instructions',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _specialInstructionsController,
                ),
                isMobile: isMobile,
              ),
              _buildInputField(
                label: 'Document/PO Number',
                widget: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _documentPoNumberController,
                ),
                isMobile: isMobile,
              ),
              _buildAttachmentField(isMobile: isMobile),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(
      {required String label, required Widget widget, required bool isMobile}) {return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12)),
          isMobile
              ? widget // Show as full width
              : Row(
                  children: [Expanded(child: widget)],
                ),
        ],
      ),
    );}

  Widget _buildAttachmentField({required bool isMobile}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Attachment', style: TextStyle(fontSize: 12)),
          InkWell(
            onTap: () {
              // Add your file upload logic here
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Upload File',
                        style: TextStyle(color: Colors.grey)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.upload_file),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
