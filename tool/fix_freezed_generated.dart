// Fix for freezed 2.5.2 generated code compatibility with Dart 3.13+
// Removes invalid 'final' modifiers from generated freezed implementation classes

import 'dart:io';
import 'dart:developer';

void main() {
  final libDir = Directory('lib');

  final filesToFix = <File>[];

  void findFreezedFiles(Directory dir) {
    for (final entity in dir.listSync(recursive: true)) {
      if (entity is File && entity.path.endsWith('.freezed.dart')) {
        filesToFix.add(entity);
      }
    }
  }

  findFreezedFiles(libDir);

  log('Found ${filesToFix.length} freezed files to fix');

  for (final file in filesToFix) {
    fixFreezedFile(file);
  }

  log('Done fixing freezed files');
}

void fixFreezedFile(File file) {
  String content = file.readAsStringSync();
  String originalContent = content;

  // Fix 1: Remove 'final' from constructor parameters in implementation classes (_$ClassImpl)
  // Pattern: required final Type name,
  // Pattern: final Type name,
  // Pattern: final Type name = default,
  // Handle nullable types (Type?)
  content = content.replaceAllMapped(
    RegExp(r'(required\s+)?final\s+(\w+(?:<\w+(?:,\s*\w+)*>)?\??)\s+(\w+)(\s*=\s*[^,)]+)?,', multiLine: true),
    (match) {
      final required = match.group(1) ?? '';
      final type = match.group(2) ?? '';
      final name = match.group(3) ?? '';
      final defaultValue = match.group(4) ?? '';
      return '$required$type $name$defaultValue,';
    },
  );

  // Fix 2: Remove 'final' from field declarations with default values in implementation classes
  // These are lines in the constructor body that look like:
  //       final Type name = value)})  followed by newline and :
  // Process line by line for this specific pattern
  final lines = content.split('\n');
  final fixedLines = <String>[];

  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];

    // Check if this line has a field declaration with 'final' and '=' in constructor body
    // Pattern: whitespace + final + Type + name + = + value + closing braces/parens
    if (RegExp(r'^\s+final\s+\w+(?:<\w+(?:,\s*\w+)*>)?\??\s+\w+\s*=').hasMatch(line)) {
      // Remove 'final ' from the line
      line = line.replaceFirst(RegExp(r'^\s+final\s+'), '');
      fixedLines.add(line);
    } else {
      fixedLines.add(line);
    }
  }

  content = fixedLines.join('\n');

  // Fix 3: Remove 'final' from abstract factory constructor parameters
  // Remove default values from abstract factory (defaults should only be in implementation class)
  // Find abstract class _Class implements Class { ... const factory _Class( ... ) = _$ClassImpl; }
  content = content.replaceAllMapped(
    RegExp(r'(abstract class _\w+ implements \w+ \{[\s\S]*?const factory _\w+\()([\s\S]*?)(\) = _\$\w+Impl;)', multiLine: true),
    (match) {
      final prefix = match.group(1) ?? '';
      final params = match.group(2) ?? '';
      final suffix = match.group(3) ?? '';

      String fixedParams = params;

      // First, remove 'final' from parameters AND remove default values
      fixedParams = fixedParams.replaceAllMapped(
        RegExp(r'(required\s+)?final\s+(\w+(?:<\w+(?:,\s*\w+)*>)?\??)\s+(\w+)(\s*=\s*[^,)]+)?'),
        (m) {
          final required = m.group(1) ?? '';
          final type = m.group(2) ?? '';
          final name = m.group(3) ?? '';
          // defaultValue is intentionally dropped - no defaults in abstract factory
          return '$required$type $name';
        },
      );

      // Also remove default values from parameters that don't have 'final'
      // Pattern: Type name = default, -> Type name,
      fixedParams = fixedParams.replaceAllMapped(
        RegExp(r'(\b(?:List<String>|Map<String, dynamic>)\s+\w+)\s*=\s*const\s*(?:\[\]|\{\})\s*,', multiLine: true),
        (m) {
          return '${m.group(1)},';
        },
      );

      // Also handle the last parameter before } which doesn't have a comma
      fixedParams = fixedParams.replaceAllMapped(
        RegExp(r'(\b(?:List<String>|Map<String, dynamic>)\s+\w+)\s*=\s*const\s*(?:\[\]|\{\})\s*\}', multiLine: true),
        (m) {
          return '${m.group(1)}}';
        },
      );

      return '$prefix$fixedParams$suffix';
    },
  );

  // Fix 4: Handle case where there's no comma after the last parameter before })
  // In implementation class constructor: final Type name = default})
  // In abstract factory: final Type name = default}) = _$ClassImpl;
  // Note: actual order in generated code is }) (brace then paren), not )}
  content = content.replaceAllMapped(
    RegExp(r'(required\s+)?final\s+(\w+(?:<\w+(?:,\s*\w+)*>)?\??)\s+(\w+)(\s*=\s*[^)}]+)?\s*\}\s*\)\s*(?:=\s*_\$\w+Impl;)?', multiLine: true),
    (match) {
      final required = match.group(1) ?? '';
      final type = match.group(2) ?? '';
      final name = match.group(3) ?? '';
      final defaultValue = match.group(4) ?? '';
      final fullMatch = match.group(0) ?? '';
      // Check if this is in abstract factory (has = _$ClassImpl)
      if (fullMatch.contains('= _\$') && fullMatch.contains('Impl;')) {
        final className = fullMatch.split('= _\$')[1].split('Impl')[0];
        return '$required$type $name$defaultValue}) = _\$${className}Impl;';
      }
      // Otherwise it's in implementation class constructor body
      return '$required$type $name$defaultValue})';
    },
  );

  if (content != originalContent) {
    file.writeAsStringSync(content);
    log('Fixed: ${file.path}');
  }
}