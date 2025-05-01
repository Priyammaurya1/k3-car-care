import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(206, 255, 41, 41), Color.fromARGB(210, 254, 61, 61)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment History',
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Track all your transactions',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.search, color: Colors.white, size: 20),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TabBar(
              controller: _tabController,
              labelColor: const Color.fromARGB(219, 253, 49, 49),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color.fromARGB(219, 253, 49, 49),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Services'),
                Tab(text: 'Store'),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            PaymentHistoryList(paymentType: PaymentType.all),
            PaymentHistoryList(paymentType: PaymentType.services),
            PaymentHistoryList(paymentType: PaymentType.store),
          ],
        ),
      ),
    );
  }
}

enum PaymentType { all, services, store }

class PaymentHistoryList extends StatelessWidget {
  final PaymentType paymentType;
  
  const PaymentHistoryList({super.key, required this.paymentType});

  @override
  Widget build(BuildContext context) {
    // Filter payments based on the selected tab
    final filteredPayments = _getDummyPayments().where((payment) {
      if (paymentType == PaymentType.all) return true;
      if (paymentType == PaymentType.services) return payment.type == 'Service';
      if (paymentType == PaymentType.store) return payment.type == 'Store';
      return false;
    }).toList();

    return filteredPayments.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt_long, size: 80, color: Colors.grey[300]),
                const SizedBox(height: 16),
                Text(
                  'No payment history found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your payment records will appear here',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredPayments.length,
            itemBuilder: (context, index) {
              final payment = filteredPayments[index];
              
              // Group payments by month
              final bool isFirstInMonth = index == 0 || 
                  !_isSameMonth(payment.date, filteredPayments[index - 1].date);
                  
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isFirstInMonth)
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: Text(
                        DateFormat('MMMM yyyy').format(payment.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  PaymentCard(payment: payment),
                ],
              );
            },
          );
  }

  bool _isSameMonth(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month;
  }

  List<Payment> _getDummyPayments() {
    return [
      Payment(
        id: 'PAY-123456',
        amount: 250.00,
        date: DateTime.now().subtract(const Duration(days: 2)),
        paymentMethod: 'Credit Card',
        type: 'Service',
        details: [
          PaymentDetail(name: 'Oil Change', amount: 80.00),
          PaymentDetail(name: 'Brake Inspection', amount: 40.00),
          PaymentDetail(name: 'Air Filter Replacement', amount: 35.00),
          PaymentDetail(name: 'Labor', amount: 95.00),
        ],
        vehicle: 'Toyota Camry (ABC-1234)',
        status: 'Completed',
        technician: 'John Smith',
      ),
      Payment(
        id: 'PAY-123456',
        amount: 250.00,
        date: DateTime.now().subtract(const Duration(days: 2)),
        paymentMethod: 'In Hand',
        type: 'Service',
        details: [
          PaymentDetail(name: 'Oil Change', amount: 80.00),
          PaymentDetail(name: 'Brake Inspection', amount: 40.00),
          PaymentDetail(name: 'Air Filter Replacement', amount: 35.00),
          PaymentDetail(name: 'Labor', amount: 95.00),
        ],
        vehicle: 'Toyota Camry (ABC-1234)',
        status: 'Completed',
        technician: 'John Smith',
      ),
      Payment(
        id: 'PAY-123457',
        amount: 520.00,
        date: DateTime.now().subtract(const Duration(days: 8)),
        paymentMethod: 'UPI',
        type: 'Store',
        details: [
          PaymentDetail(name: 'Front Brake Pads', amount: 120.00),
          PaymentDetail(name: 'Brake Discs (2)', amount: 280.00),
          PaymentDetail(name: 'Labor', amount: 120.00),
        ],
        vehicle: 'Toyota Camry (ABC-1234)',
        status: 'Completed',
        technician: 'Robert Johnson',
      ),
      Payment(
        id: 'PAY-123457',
        amount: 520.00,
        date: DateTime.now().subtract(const Duration(days: 8)),
        paymentMethod: 'Cash on Delivery',
        type: 'Store',
        details: [
          PaymentDetail(name: 'Front Brake Pads', amount: 120.00),
          PaymentDetail(name: 'Brake Discs (2)', amount: 280.00),
          PaymentDetail(name: 'Labor', amount: 120.00),
        ],
        vehicle: 'Toyota Camry (ABC-1234)',
        status: 'Completed',
        technician: 'Robert Johnson',
      ),
      Payment(
        id: 'PAY-123458',
        amount: 35.00,
        date: DateTime.now().subtract(const Duration(days: 15)),
        paymentMethod: 'UPI',
        type: 'Service',
        details: [
          PaymentDetail(name: 'Car Wash', amount: 35.00),
        ],
        vehicle: 'Toyota Camry (ABC-1234)',
        status: 'Completed',
        technician: 'Mike Williams',
      ),
      Payment(
        id: 'PAY-123459',
        amount: 180.00,
        date: DateTime.now().subtract(const Duration(days: 45)),
        paymentMethod: 'Credit Card',
        type: 'Store',
        details: [
          PaymentDetail(name: 'Battery', amount: 150.00),
          PaymentDetail(name: 'Installation', amount: 30.00),
        ],
        vehicle: 'Toyota Camry (ABC-1234)',
        status: 'Completed',
        technician: 'Robert Johnson',
      ),
    ];
  }
}

class Payment {
  final String id;
  final double amount;
  final DateTime date;
  final String paymentMethod;
  final String type; // Service or Store
  final List<PaymentDetail> details;
  final String vehicle;
  final String status;
  final String technician;

  Payment({
    required this.id,
    required this.amount,
    required this.date,
    required this.paymentMethod,
    required this.type,
    required this.details,
    required this.vehicle,
    required this.status,
    required this.technician,
  });
}

class PaymentDetail {
  final String name;
  final double amount;

  PaymentDetail({
    required this.name,
    required this.amount,
  });
}

class PaymentCard extends StatelessWidget {
  final Payment payment;

  const PaymentCard({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showPaymentDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: payment.type == 'Service' 
                        ? Colors.blue.withOpacity(0.1) 
                        : Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      payment.type == 'Service' 
                        ? Icons.build_outlined 
                        : Icons.settings_outlined,
                      color: payment.type == 'Service' ? Colors.blue : Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          payment.type,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          payment.vehicle,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${payment.amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('dd MMM, yyyy').format(payment.date),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPaymentMethodChip(payment.paymentMethod),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: payment.status == 'Completed' ? Colors.green : Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        payment.status,
                        style: TextStyle(
                          color: payment.status == 'Completed' ? Colors.green : Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodChip(String method) {
    IconData icon;
    Color color;
    
    switch (method) {
      case 'Credit Card':
        icon = Icons.credit_card;
        color = Colors.blue;
        break;
      case 'UPI':
        icon = Icons.smartphone;
        color = Colors.purple;
        break;
      case 'Cash on Delivery':
        icon = Icons.money;
        color = Colors.green;
        break;
      case 'In Hand':
        icon = Icons.handshake;
        color = const Color.fromARGB(255, 197, 106, 106);
        break;
      default:
        icon = Icons.payment;
        color = Colors.grey;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            method,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: controller,
                  padding: const EdgeInsets.all(24),
                  children: [
                    const Text(
                      'Payment Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildDetailRow(
                      'Invoice ID',
                      payment.id,
                      Icons.receipt_outlined,
                    ),
                    _buildDetailRow(
                      'Date',
                      DateFormat('dd MMMM yyyy, hh:mm a').format(payment.date),
                      Icons.calendar_today_outlined,
                    ),
                    _buildDetailRow(
                      'Amount',
                      '\$${payment.amount.toStringAsFixed(2)}',
                      Icons.attach_money,
                    ),
                    _buildDetailRow(
                      'Payment Method',
                      payment.paymentMethod,
                      Icons.payment_outlined,
                    ),
                    _buildDetailRow(
                      'Vehicle',
                      payment.vehicle,
                      Icons.directions_car_outlined,
                    ),
                    _buildDetailRow(
                      'Technician',
                      payment.technician,
                      Icons.person_outline,
                    ),
                    _buildDetailRow(
                      'Status',
                      payment.status,
                      Icons.check_circle_outline,
                      valueColor: payment.status == 'Completed' ? Colors.green : Colors.orange,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Service Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...payment.details.map((detail) => _buildServiceItem(detail)),
                    const SizedBox(height: 24),
                    _buildTotalAmount(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.share_outlined, color:  Color.fromARGB(219, 253, 49, 49),),
                            label: const Text('Share Receipt', style: TextStyle(color:  Color.fromARGB(219, 253, 49, 49)),),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color.fromARGB(219, 253, 49, 49)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.download_outlined, color: Colors.white,),
                            label: const Text('Download', style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(219, 253, 49, 49),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: valueColor ?? Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(PaymentDetail detail) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            detail.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '\$${detail.amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAmount() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.redAccent.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Total Amount',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            '\$${payment.amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}