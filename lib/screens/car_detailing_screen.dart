import 'package:flutter/material.dart';
import 'package:k3carcare/widgets/section_header.dart';

class CarDetailingScreen extends StatefulWidget {
  const CarDetailingScreen({super.key});

  @override
  State<CarDetailingScreen> createState() => _CarDetailingScreenState();
}

class _CarDetailingScreenState extends State<CarDetailingScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabTitles = [
    'Polishing',
    'Ceramic Coating',
    'PPF Coating',
    'Teflon Coating',
    'Anti-Rust Coating',
  ];
  
  // Controllers for both vertical and horizontal scrolling
  final ScrollController _scrollController = ScrollController();
  final ScrollController _tabScrollController = ScrollController();
  
  // Create a key for each section corresponding to tabs
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());
  
  // Track if we're programmatically scrolling
  bool _isScrollingProgrammatically = false;

  @override
  void initState() {
    super.initState();

    // Add scroll listener to detect which section is visible
    _scrollController.addListener(_onScroll);
    
    // Add post-frame callback to ensure all render objects are available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize to first section
      if (_sectionKeys.isNotEmpty && _sectionKeys[0].currentContext != null) {
        _selectedTabIndex = 0;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabScrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Skip this check if we're programmatically scrolling
    if (_isScrollingProgrammatically) return;
    
    // Find which section is most visible
    double viewportHeight = MediaQuery.of(context).size.height;
    double bestVisibleArea = 0;
    int bestIndex = _selectedTabIndex;
    
    for (int i = 0; i < _sectionKeys.length; i++) {
      final RenderObject? renderObject = _sectionKeys[i].currentContext?.findRenderObject();
      if (renderObject is RenderBox) {
        final RenderBox box = renderObject;
        final Offset position = box.localToGlobal(Offset.zero);
        
        // Calculate how much of this section is visible in the viewport
        final double top = position.dy;
        final double bottom = top + box.size.height;
        final double viewportTop = 0;
        final double viewportBottom = viewportHeight;
        
        // Calculate overlapping area
        final double visibleTop = top < viewportTop ? viewportTop : top;
        final double visibleBottom = bottom > viewportBottom ? viewportBottom : bottom;
        
        if (visibleBottom > visibleTop) {
          final double visibleArea = visibleBottom - visibleTop;
          if (visibleArea > bestVisibleArea) {
            bestVisibleArea = visibleArea;
            bestIndex = i;
          }
        }
      }
    }
    
    // Update selected tab if it changed
    if (bestIndex != _selectedTabIndex) {
      setState(() {
        _selectedTabIndex = bestIndex;
      });
      
      // Scroll the tab into view
      _scrollTabIntoView(bestIndex);
    }
  }

  void _scrollTabIntoView(int tabIndex) {
    if (!_tabScrollController.hasClients) return;
    
    // Calculate width of each tab (approximation - assuming uniform width)
    final double screenWidth = MediaQuery.of(context).size.width;
    final double averageTabWidth = 120.0; // Estimate - adjust based on your design
    
    // Calculate target scroll offset
    double targetOffset = (averageTabWidth + 8.0) * tabIndex; // 8.0 is for padding
    
    // Center the tab if possible
    targetOffset = targetOffset - (screenWidth / 2) + (averageTabWidth / 2);
    
    // Clamp the scroll offset to valid bounds
    targetOffset = targetOffset.clamp(
      0.0,
      _tabScrollController.position.maxScrollExtent,
    );
    
    // Animate to the position
    // _tabScrollController.animateTo(
    //   targetOffset,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeInOut,
    // );
  }

  void _scrollToSection(int index) {
    // Ensure index is valid
    if (index < 0 || index >= _sectionKeys.length) return;
    
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      setState(() {
        _selectedTabIndex = index;
        _isScrollingProgrammatically = true;
      });
      
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).then((_) {
        // Reset the flag after scrolling animation completes
        setState(() {
          _isScrollingProgrammatically = false;
        });
        
        // Scroll the tab into view
        _scrollTabIntoView(index);
      });
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
        title:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Car Detailing',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'We got you covered and your car as well',
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
            padding: const EdgeInsets.only(top: 20, bottom: 16),
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
          // Polishing Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: SectionHeader(
              key: _sectionKeys[0],
              title: 'Polishing',
            ),
          ),
          _buildServicePackage(
            title: '3M™ Car Polishing',
            points: [
              'Takes 4 Hours',
              '3M Ultra Shine Polishing',
              'Every 3 Months Recommended',
            ],
            originalPrice: '₹6,825',
            discountedPrice: '₹5,119',
            discountPercentage: '25% OFF',
            isRecommended: true,
            image:
                'https://bizimages.withfloats.com/actual/6616e5973e13f24e870d16c4.jpg',
          ),
          const SizedBox(height: 20),

          // Ceramic Coating Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SectionHeader(
              key: _sectionKeys[1],
              title: 'Ceramic Coating',
            ),
          ),
          _buildServicePackage(
            title: 'Ceramic Coating Service',
            points: [
              'Takes 2 days',
              'Includes 2 Coats',
              '5 Year Warranty',
              'Hydrophobic Properties',
              'UV Protection',
            ],
            originalPrice: '₹8,500',
            discountedPrice: '₹6,375',
            discountPercentage: '25% OFF',
            isRecommended: true,
            image:
                'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 20),

          // PPF Coating Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SectionHeader(
              key: _sectionKeys[2],
              title: 'PPF Coating',
            ),
          ),
          _buildServicePackage(
            title: 'PPF - Garware Plus',
            points: [
              'Takes 2 Days',
              '5 Year Warranty',
              '150 Microns Thickness',
            ],
            originalPrice: '₹69,499',
            discountedPrice: '₹58,899',
            discountPercentage: '24% OFF',
            isRecommended: false,
            image:
                'https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 16),
          _buildServicePackage(
            title: 'PPF - Garware Premium',
            points: [
              'Takes 2 days',
              '8 Year Warranty',
              '200 Microns Thickness',
            ],
            originalPrice: '₹99,499',
            discountedPrice: '₹92,799',
            discountPercentage: '20% OFF',
            isRecommended: true,
            image:
                'https://images.unsplash.com/photo-1565043666747-69f6646db940?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 16),
          _buildServicePackage(
            title: 'PPF - Garware Llumar',
            points: [
              'Takes 3 days',
              '10 Year Warranty',
              '210 Microns Thickness',
            ],
            originalPrice: '₹99,499',
            discountedPrice: '₹92,799',
            discountPercentage: '20% OFF',
            isRecommended: false,
            image:
                'https://images.unsplash.com/photo-1565043666747-69f6646db940?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 20),
          
          // Teflon Coating Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SectionHeader(
              key: _sectionKeys[3],
              title: 'Teflon Coating',
            ),
          ),
          _buildServicePackage(
            title: '3M™ Teflon Coating',
            points: [
              'Takes 24 Hours',
              '3 Months Warranty',
              'Basic Diagnostics',
              'Includes 3 Services',
            ],
            originalPrice: '₹9,499',
            discountedPrice: '₹8,899',
            discountPercentage: '24% OFF',
            isRecommended: true,
            image:
                'https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 16),
          _buildServicePackage(
            title: 'Meguiar\'s Teflon Coating',
            points: [
              'Takes 24 Hours',
              '3 Months Warranty',
              'Every 1 Year Recommended',
            ],
            originalPrice: '₹12,499',
            discountedPrice: '₹11,799',
            discountPercentage: '20% OFF',
            isRecommended: false,
            image:
                'https://images.unsplash.com/photo-1565043666747-69f6646db940?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 20),
          
          // Anti-Rust Coating Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SectionHeader(
              key: _sectionKeys[4],
              title: 'Anti-Rust Coating',
            ),
          ),
          _buildServicePackage(
            title: 'Anti Rust Underbody Coating',
            points: [
              'Takes 24 Hours',
              '3 Months Warranty',
              'Monsoon Protection',
            ],
            originalPrice: '₹9,499',
            discountedPrice: '₹8,899',
            discountPercentage: '24% OFF',
            isRecommended: true,
            image:
                'https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&w=1074&q=80',
          ),
          const SizedBox(height: 16),
          _buildServicePackage(
            title: 'Silencer Coating',
            points: [
              'Takes 6 days',
              '3 Months Warranty',
              '2 Layers of Protection',
            ],
            originalPrice: '₹5,499',
            discountedPrice: '₹4,799',
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
              _isScrollingProgrammatically = true;
            });
            // Scroll to the corresponding section
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