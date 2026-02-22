// Packages
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.label,
    required this.icon,
    required this.currency,
    required this.amount,
    required this.colorScheme,
  });

  final List<String> label;
  final IconData icon;
  final IconData currency;
  final num amount;
  final String colorScheme;

  @override
  Widget build(BuildContext context) {
    final containerColor = _containerColors(context);
    final avatarColor = _avatarColors(context);
    final iconColor = _iconColors(context);
    final textColor = _textColors(context);

    return Expanded(
      child: Container(
        height: 140,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: label
                      .map(
                        (text) => Text(
                          text,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: textColor),
                        ),
                      )
                      .toList(),
                ),
                Expanded(child: SizedBox()),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: avatarColor,
                  child: Icon(icon, color: iconColor),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Row(
              children: [
                Icon(currency, color: textColor),
                Text(
                  amount.toString(),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _containerColors(BuildContext context) {
    switch (colorScheme) {
      case 'primary':
        return Theme.of(context).colorScheme.primaryContainer;
      case 'secondary':
        return Theme.of(context).colorScheme.secondaryContainer;
      case 'tertiary':
        return Theme.of(context).colorScheme.tertiaryContainer;
      case 'quaternary':
        return Theme.of(context).colorScheme.surfaceContainer;
      default:
        return Theme.of(context).colorScheme.primaryContainer;
    }
  }

  Color _avatarColors(BuildContext context) {
    switch (colorScheme) {
      case 'primary':
        return Theme.of(context).colorScheme.primary;
      case 'secondary':
        return Theme.of(context).colorScheme.secondary;
      case 'tertiary':
        return Theme.of(context).colorScheme.tertiary;
      case 'quaternary':
        return Theme.of(context).colorScheme.surfaceContainerHighest;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  Color _iconColors(BuildContext context) {
    switch (colorScheme) {
      case 'primary':
        return Theme.of(context).colorScheme.onPrimary;
      case 'secondary':
        return Theme.of(context).colorScheme.onSecondary;
      case 'tertiary':
        return Theme.of(context).colorScheme.onTertiary;
      case 'quaternary':
        return Theme.of(context).colorScheme.onSurface;
      default:
        return Theme.of(context).colorScheme.onPrimary;
    }
  }

  Color _textColors(BuildContext context) {
    switch (colorScheme) {
      case 'primary':
        return Theme.of(context).colorScheme.onPrimaryContainer;
      case 'secondary':
        return Theme.of(context).colorScheme.onSecondaryContainer;
      case 'tertiary':
        return Theme.of(context).colorScheme.onTertiaryContainer;
      case 'quaternary':
        return Theme.of(context).colorScheme.onSurface;
      default:
        return Theme.of(context).colorScheme.onPrimaryContainer;
    }
  }
}
