import 'package:flutter/material.dart';
import 'package:k3carcare/widgets/section_header.dart';

class PeriodicServicesScreen extends StatefulWidget {
  const PeriodicServicesScreen({super.key});

  @override
  State<PeriodicServicesScreen> createState() => _PeriodicServicesScreenState();
}

class _PeriodicServicesScreenState extends State<PeriodicServicesScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabTitles = [
    'Scheduled Packages',
    'Brake Maintenance',
    'Under 49',
  ];
  final ScrollController _scrollController = ScrollController();
  final ScrollController _tabScrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = [GlobalKey(), GlobalKey(), GlobalKey()];
  bool _isScrollingProgrammatically = false;

  @override
  void initState() {
    super.initState();
    // Add scroll listener to detect which section is visible
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabScrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isScrollingProgrammatically) return;

    // Find which section is most visible
    int? visibleSectionIndex;
    double maxVisibleArea = 0;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final RenderObject? renderObject = _sectionKeys[i].currentContext?.findRenderObject();
      if (renderObject is RenderBox) {
        final RenderBox box = renderObject;
        final Offset position = box.localToGlobal(Offset.zero);
        final double screenHeight = MediaQuery.of(context).size.height;
        
        // Calculate how much of this section is visible on screen
        final double visibleTop = position.dy < 0 ? 0 : position.dy;
        final double visibleBottom = (position.dy + box.size.height) > screenHeight 
            ? screenHeight 
            : (position.dy + box.size.height);
        
        final double visibleArea = visibleBottom > visibleTop ? visibleBottom - visibleTop : 0;
        
        if (visibleArea > maxVisibleArea) {
          maxVisibleArea = visibleArea;
          visibleSectionIndex = i;
        }
      }
    }

    if (visibleSectionIndex != null && _selectedTabIndex != visibleSectionIndex) {
      setState(() {
        _selectedTabIndex = visibleSectionIndex!;
      });
      
      // Scroll the tab into view
      _scrollTabToCenter(visibleSectionIndex);
    }
  }

  void _scrollTabToCenter(int tabIndex) {
    // Get the context of the tab
    final BuildContext? tabContext = _getTabContext(tabIndex);
    if (tabContext == null) return;
    
    // Get the RenderBox of the tab
    final RenderBox box = tabContext.findRenderObject() as RenderBox;
    final double tabPosition = box.localToGlobal(Offset.zero).dx;
    final double tabWidth = box.size.width;
    
    // Calculate target scroll position (center the tab in the horizontal scroll view)
    final double screenWidth = MediaQuery.of(context).size.width;
    double targetScrollPosition = tabPosition - (screenWidth / 2) + (tabWidth / 2);
    
    // Make sure we don't scroll beyond the scrollable area
    targetScrollPosition = targetScrollPosition.clamp(
      0.0,
      _tabScrollController.position.maxScrollExtent,
    );
    
    // Animate to the target position
    _tabScrollController.animateTo(
      targetScrollPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  BuildContext? _getTabContext(int index) {
    // ignore: unused_local_variable
    final GlobalKey tabKey = GlobalKey();
    // This is a workaround as we don't have direct access to tab keys
    // In a production app, you'd likely maintain a list of keys for tabs
    
    // For now, we'll just return null and handle it in _scrollTabToCenter
    return null;
  }

  void _scrollToSection(int index) {
    _isScrollingProgrammatically = true;
    
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).then((_) {
        // Add a small delay before allowing the scroll listener to work again
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            setState(() {
              _selectedTabIndex = index;
              _isScrollingProgrammatically = false;
            });
          }
        });
      });
    } else {
      _isScrollingProgrammatically = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(206, 255, 41, 41),
                Color.fromARGB(210, 254, 61, 61),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Periodic Services',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'It\'s recommended to go through every services',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 13,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: SingleChildScrollView(
              controller: _tabScrollController,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Row(
                children: List.generate(_tabTitles.length, (index) {
                  return _buildTabButton(_tabTitles[index], index);
                }),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          // Scheduled Packages Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SectionHeader(
              key: _sectionKeys[0],
              title: 'Scheduled Packages',
            ),
          ),
          _buildServicePackage(
            title: 'Basic Service',
            points: [
              'Every 5000 Kms / 3 Months',
              'Takes 4 Hours',
              '1 Month Warranty',
              'Includes 9 Services',
            ],
            originalPrice: '₹6,825',
            discountedPrice: '₹5,119',
            discountPercentage: '25% OFF',
            isRecommended: false,
            image:
                'https://bizimages.withfloats.com/actual/6616e5973e13f24e870d16c4.jpg',
          ),
          const SizedBox(height: 16),
          _buildServicePackage(
            title: 'Standard Service',
            points: [
              'Every 10000 Kms / 6 Months',
              'Takes 6 Hours',
              '1 Month Warranty',
              'Includes 15 Services',
            ],
            originalPrice: '₹4,956',
            discountedPrice: '₹4,469',
            discountPercentage: '30% OFF',
            isRecommended: true,
            image:
                'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 20),

          // Brake Maintenance Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SectionHeader(
              key: _sectionKeys[1],
              title: 'Brake Maintenance',
            ),
          ),
          _buildServicePackage(
            title: 'Brake Pad Replacement',
            points: [
              'Every 20000 Kms / 12 Months',
              'Takes 2 Hours',
              '6 Month Warranty',
              'Includes 4 Services',
            ],
            originalPrice: '₹8,500',
            discountedPrice: '₹6,375',
            discountPercentage: '25% OFF',
            isRecommended: false,
            image:
                'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 16),
          _buildServicePackage(
            title: 'Complete Brake Service',
            points: [
              'Every 40000 Kms / 24 Months',
              'Takes 5 Hours',
              '12 Month Warranty',
              'Includes 8 Services',
            ],
            originalPrice: '₹12,999',
            discountedPrice: '₹9,099',
            discountPercentage: '30% OFF',
            isRecommended: true,
            image:
                'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 20),

          // Under 49 Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SectionHeader(key: _sectionKeys[2], title: 'Under 49'),
          ),
          _buildServicePackage(
            title: 'Quick Check-up',
            points: [
              'Single Visit Service',
              'Takes 1 Hour',
              'Basic Diagnostics',
              'Includes 3 Services',
            ],
            originalPrice: '₹2,499',
            discountedPrice: '₹1,899',
            discountPercentage: '24% OFF',
            isRecommended: false,
            image:
                'https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 16),
          _buildServicePackage(
            title: 'Express Service',
            points: [
              'Every 2500 Kms',
              'Takes 45 Minutes',
              'Quick Inspection',
              'Includes 5 Services',
            ],
            originalPrice: '₹3,499',
            discountedPrice: '₹2,799',
            discountPercentage: '20% OFF',
            isRecommended: true,
            image:
                'https://images.unsplash.com/photo-1565043666747-69f6646db940?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    final bool isSelected = _selectedTabIndex == index;
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedTabIndex = index;
            });
            _scrollToSection(index);
          },
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFEFEAFA) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF673AB7)
                    : const Color(0xFFEEEEEE),
                width: 1.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: const Color(0xFF673AB7).withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? const Color(0xFF673AB7) : Colors.black54,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServicePackage({
    required String title,
    required List<String> points,
    required String originalPrice,
    required String discountedPrice,
    required String discountPercentage,
    required bool isRecommended,
    required String image,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              if (isRecommended)
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 75, 75),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.thumb_up, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text(
                          'RECOMMENDED',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: isRecommended
                    ? const EdgeInsets.fromLTRB(16.0, 35.0, 16.0, 16.0)
                    : const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...points.map(
                            (point) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.black87,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      point,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                originalPrice,
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                discountedPrice,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  discountPercentage,
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            image,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.red[600],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.red[600]!),
                            ),
                          ),
                          child: const Text(
                            'ADD',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Add Ons',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}