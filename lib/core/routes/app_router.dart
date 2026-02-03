import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ttrpgcharacter/core/routes/route_names.dart';
import 'package:ttrpgcharacter/features/character/presentation/pages/characters_pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: charactersRoute,
  routes: [
    GoRoute(
      path: charactersRoute,
      builder: (context, state) => const CharactersPages(),
    ),
    GoRoute(
      path: '$characterRoute/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return Scaffold(
          body: Center(
            child: Text('Character Page for ID: $id - TODO: Implement'),
          ),
        );
      },
    ),
  ],
);
