import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/chat_message.dart';
import 'ai_assistant_state.dart';

class AiAssistantCubit extends Cubit<AiAssistantState> {
  AiAssistantCubit()
      : super(AiAssistantLoaded(
          messages: [
            ChatMessage(
              id: 'msg-1',
              content: 'مرحباً! أنا هوشة، مساعدك المالي الذكي. كيف يمكنني مساعدتك اليوم؟',
              isUser: false,
              timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
            ),
            ChatMessage(
              id: 'msg-2',
              content: 'أريد مراجعة ميزانية الطعام والشراب لهذا الشهر',
              isUser: true,
              timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
            ),
            ChatMessage(
              id: 'msg-3',
              content: 'بالتأكيد! ميزانيتك المخصصة للطعام هي 1,500 ريال، لقد أنفقت منها حتى الآن 1,200 ريال (80%). متبقي لديك 300 ريال فقط.',
              isUser: false,
              timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
              customData: const {
                'type': 'budget_progress',
                'spent': 1200.0,
                'limit': 1500.0,
              },
            ),
          ],
          isListening: false,
        ));

  void sendMessage(String content) {
    if (state is! AiAssistantLoaded) return;
    final loaded = state as AiAssistantLoaded;

    final userMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      isUser: true,
      timestamp: DateTime.now(),
    );

    final updated = List<ChatMessage>.from(loaded.messages)..add(userMsg);
    emit(AiAssistantLoaded(messages: updated, isListening: false));

    // Simulate AI response
    Future.delayed(const Duration(seconds: 1), () {
      final aiMsg = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: 'سؤالك ممتاز! جاري تحليل البيانات المالية وتقديم أفضل نصيحة لك...',
        isUser: false,
        timestamp: DateTime.now(),
      );

      final withAi = List<ChatMessage>.from(updated)..add(aiMsg);
      emit(AiAssistantLoaded(messages: withAi, isListening: false));
    });
  }

  void toggleListening() {
    if (state is! AiAssistantLoaded) return;
    final loaded = state as AiAssistantLoaded;
    emit(AiAssistantLoaded(
      messages: loaded.messages,
      isListening: !loaded.isListening,
    ));
  }
}
