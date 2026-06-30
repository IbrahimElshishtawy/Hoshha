import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../cubit/ai_assistant_cubit.dart';
import '../cubit/ai_assistant_state.dart';
import '../widgets/chat_bubble_stream.dart';
import '../widgets/chat_input_row.dart';
import '../widgets/chat_suggestion_tags.dart';

class AiAssistantPage extends StatelessWidget {
  const AiAssistantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => sl<AiAssistantCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withValues(alpha: 0.7),
          elevation: 2.0,
          shadowColor: Colors.black12,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward, color: AppTheme.onSurfaceVariant),
              onPressed: () => Navigator.pop(context),
            ),
          ],
          leading: const SizedBox.shrink(), // Suppress default leading to match design direction
          title: Text(
            'مساعد هوشة الذكي',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppTheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            // Background soft decorative glows
            Positioned(
              top: -50,
              right: -50,
              width: 250,
              height: 250,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.primary.withValues(alpha: 0.03),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: -80,
              width: 200,
              height: 200,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.primary.withValues(alpha: 0.02),
                  ),
                ),
              ),
            ),

            BlocBuilder<AiAssistantCubit, AiAssistantState>(
              builder: (context, state) {
                if (state is AiAssistantLoaded) {
                  return Column(
                    children: [
                      // Chat Messages Area
                      Expanded(
                        child: ChatBubbleStream(messages: state.messages),
                      ),

                      // Interactive Input Zone
                      Container(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.7),
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(32.0)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                              offset: Offset(0, -4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Suggested Questions Tags
                            ChatSuggestionTags(
                              onTap: (tag) => context.read<AiAssistantCubit>().sendMessage(tag),
                            ),
                            const SizedBox(height: 16.0),

                            // Typing box & Record Toggle
                            ChatInputRow(
                              onSend: (text) => context.read<AiAssistantCubit>().sendMessage(text),
                              isListening: state.isListening,
                              onMicToggle: () => context.read<AiAssistantCubit>().toggleListening(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
