import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _agreeToTerms = false;
  bool _receiveTips = false;
  double _passwordStrength = 0.0; // 0.0 to 1.0
  Color _strengthColor = AppTheme.outlineVariant;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_updatePasswordStrength);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _updatePasswordStrength() {
    final text = _passwordController.text;
    setState(() {
      if (text.isEmpty) {
        _passwordStrength = 0.0;
        _strengthColor = AppTheme.outlineVariant;
      } else if (text.length < 6) {
        _passwordStrength = 0.33;
        _strengthColor = AppTheme.error;
      } else if (text.length < 10) {
        _passwordStrength = 0.66;
        _strengthColor = Colors.orange;
      } else {
        _passwordStrength = 1.0;
        _strengthColor = AppTheme.secondary;
      }
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يجب الموافقة على الشروط والأحكام'),
            backgroundColor: AppTheme.error,
          ),
        );
        return;
      }
      // Simulate registration
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إنشاء الحساب بنجاح!'),
          backgroundColor: AppTheme.secondary,
        ),
      );
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Name Field
          Text(
            'الاسم بالكامل',
            style: theme.textTheme.labelSmall?.copyWith(color: AppTheme.onSurfaceVariant),
          ),
          const SizedBox(height: 4.0),
          TextFormField(
            controller: _nameController,
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              hintText: 'أدخل اسمك الثلاثي',
              prefixIcon: Icon(Icons.person_outline, color: AppTheme.outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الاسم بالكامل مطلوب';
              }
              return null;
            },
          ),
          const SizedBox(height: AppTheme.stackGap),

          // Email Field
          Text(
            'البريد الإلكتروني',
            style: theme.textTheme.labelSmall?.copyWith(color: AppTheme.onSurfaceVariant),
          ),
          const SizedBox(height: 4.0),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              hintText: 'example@mail.com',
              prefixIcon: Icon(Icons.mail_outline, color: AppTheme.outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'البريد الإلكتروني مطلوب';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'البريد الإلكتروني غير صالح';
              }
              return null;
            },
          ),
          const SizedBox(height: AppTheme.stackGap),

          // Phone Field
          Text(
            'رقم الهاتف',
            style: theme.textTheme.labelSmall?.copyWith(color: AppTheme.onSurfaceVariant),
          ),
          const SizedBox(height: 4.0),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              hintText: '05XXXXXXXX',
              prefixIcon: Icon(Icons.phone_outlined, color: AppTheme.outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رقم الهاتف مطلوب';
              }
              return null;
            },
          ),
          const SizedBox(height: AppTheme.stackGap),

          // Password Field
          Text(
            'كلمة المرور',
            style: theme.textTheme.labelSmall?.copyWith(color: AppTheme.onSurfaceVariant),
          ),
          const SizedBox(height: 4.0),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: '••••••••',
              prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: AppTheme.outline,
                ),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'كلمة المرور مطلوبة';
              }
              if (value.length < 6) {
                return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),

          // Strength Indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 4.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.outlineVariant.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerRight,
                    widthFactor: _passwordStrength,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _strengthColor,
                        borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'تأكد من استخدام خليط من الأحرف والأرقام',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppTheme.stackGap),

          // Confirm Password Field
          Text(
            'تأكيد كلمة المرور',
            style: theme.textTheme.labelSmall?.copyWith(color: AppTheme.onSurfaceVariant),
          ),
          const SizedBox(height: 4.0),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscurePassword,
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              hintText: '••••••••',
              prefixIcon: Icon(Icons.lock_reset, color: AppTheme.outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى تأكيد كلمة المرور';
              }
              if (value != _passwordController.text) {
                return 'كلمتا المرور غير متطابقتين';
              }
              return null;
            },
          ),
          const SizedBox(height: AppTheme.stackGap),

          // Checkbox 1: Terms
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: _agreeToTerms,
                  onChanged: (val) => setState(() => _agreeToTerms = val ?? false),
                  activeColor: AppTheme.primary,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  'أوافق على الشروط والأحكام و سياسة الخصوصية',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Checkbox 2: Newsletter
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: _receiveTips,
                  onChanged: (val) => setState(() => _receiveTips = val ?? false),
                  activeColor: AppTheme.primary,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  'أريد استقبال النصائح والإشعارات المالية',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),

          // Submit Button
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, // Use custom decoration
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
              ),
              child: Container(
                height: 56.0,
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(Icons.arrow_back, color: Colors.white), // Pointing left is forward in RTL
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
