import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supabaseConnect() async {
  try {
    await Supabase.initialize(
      url: 'https://gwoiutiparswumqleuxw.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd3b2l1dGlwYXJzd3VtcWxldXh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk5MzgwNTUsImV4cCI6MjAzNTUxNDA1NX0.GvOIU55M8vlaxmZ5vR8V1eD36vfWjJDnmjsOMyiuLc0',
    );
  } catch (e) {
    // If error
  }
}

final supabase = Supabase.instance.client;
