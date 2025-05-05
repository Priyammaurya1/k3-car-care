import 'dart:io';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  // Mock user data - in a real app, this would come from a user model/service
  final TextEditingController _nameController = TextEditingController(
    text: 'John Doe',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'john.doe@example.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+1 234 567 8900',
  );
  final TextEditingController _addressController = TextEditingController(
    text: '123 Main St, City, Country',
  );
  final TextEditingController _bioController = TextEditingController(
    text: 'Flutter developer and tech enthusiast',
  );

  File? _profileImage;
  bool _isEditing = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  // Mock function to simulate image selection
  Future<void> _pickImage() async {
    // In a real app, you would implement image picker functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image selection would happen here')),
    );
  }

  // Function to save user profile changes
  void _saveChanges() {
    // In a real app, this would call an API or service to update user information
    setState(() {
      _isEditing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Text('Profile updated successfully'),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green.shade600,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
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
              'My Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'Manage your account settings',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.save_rounded : Icons.edit_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (_isEditing) {
                  _saveChanges();
                } else {
                  _isEditing = true;
                }
              });
            },
            tooltip: _isEditing ? 'Save Changes' : 'Edit Profile',
          ),
          // const SizedBox(width: 16)
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colored header section for profile image
            Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: ProfileHeader(
                profileImage: _profileImage,
                name: _nameController.text,
                email: _emailController.text,
                onImageTap: _isEditing ? _pickImage : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile header is now in the colored container above
                  const SectionHeader(title: 'Personal Information'),
                  ProfileField(
                    controller: _nameController,
                    label: 'Full Name',
                    icon: Icons.person,
                    isEditing: _isEditing,
                  ),
                  ProfileField(
                    controller: _emailController,
                    label: 'Email',
                    icon: Icons.email,
                    isEditing: _isEditing,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ProfileField(
                    controller: _phoneController,
                    label: 'Phone Number',
                    icon: Icons.phone,
                    isEditing: _isEditing,
                    keyboardType: TextInputType.phone,
                  ),
                  ProfileField(
                    controller: _addressController,
                    label: 'Address',
                    icon: Icons.location_on,
                    isEditing: _isEditing,
                  ),

                  const SizedBox(height: 24),
                  const SectionTitle(title: 'About Me'),
                  ProfileTextField(
                    controller: _bioController,
                    label: 'Bio',
                    isEditing: _isEditing,
                    maxLines: 3,
                  ),

                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Preferences'),
                  PreferenceToggle(
                    title: 'Push Notifications',
                    subtitle: 'Receive alerts and updates',
                    value: true,
                    onChanged: _isEditing ? (value) {} : null,
                  ),
                  PreferenceToggle(
                    title: 'Email Newsletters',
                    subtitle: 'Receive monthly newsletters',
                    value: false,
                    onChanged: _isEditing ? (value) {} : null,
                  ),

                  const SizedBox(height: 24),
                  if (!_isEditing) ...[
                    const SectionTitle(title: 'Account Actions'),
                    AccountActionButton(
                      title: 'Change Password',
                      icon: Icons.lock,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Change password dialog would open here',
                            ),
                          ),
                        );
                      },
                    ),
                    AccountActionButton(
                      title: 'Privacy Settings',
                      icon: Icons.security,
                      onTap: () {},
                    ),
                    AccountActionButton(
                      title: 'Delete Account',
                      icon: Icons.delete_forever,
                      color: Colors.red,
                      onTap: () {},
                    ),
                    const SizedBox(height: 40),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable widgets below

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final File? profileImage;
  final String name;
  final String email;
  final VoidCallback? onImageTap;

  const ProfileHeader({
    super.key,
    this.profileImage,
    required this.name,
    required this.email,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: onImageTap,
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[100],
                    backgroundImage:
                        profileImage != null
                            ? FileImage(profileImage!) as ImageProvider
                            : const AssetImage(
                              'assets/images/default_avatar.png',
                            ),
                  ),
                ),
                if (onImageTap != null)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isEditing;
  final TextInputType keyboardType;

  const ProfileField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.isEditing,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child:
          isEditing
              ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                  prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                ),
                keyboardType: keyboardType,
              )
              : Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            controller.text,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isEditing;
  final int maxLines;

  const ProfileTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.isEditing,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child:
          isEditing
              ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                ),
                maxLines: maxLines,
              )
              : Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.text,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
    );
  }
}

class PreferenceToggle extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const PreferenceToggle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    this.onChanged,
  });

  @override
  State<PreferenceToggle> createState() => _PreferenceToggleState();
}

class _PreferenceToggleState extends State<PreferenceToggle> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SwitchListTile(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        value: _value,
        onChanged:
            widget.onChanged != null
                ? (value) {
                  setState(() {
                    _value = value;
                  });
                  widget.onChanged!(value);
                }
                : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        activeColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}

class AccountActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const AccountActionButton({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: (color ?? Theme.of(context).primaryColor).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color ?? Theme.of(context).primaryColor,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: color ?? Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onTap: onTap,
      ),
    );
  }
}
