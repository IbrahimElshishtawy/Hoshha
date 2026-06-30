import 'package:equatable/equatable.dart';
import '../../domain/entities/chat_message.dart';

abstract class AiAssistantState extends Equatable {
  const AiAssistantState();

  @override
  List<Object?> get props => [];
}

class AiAssistantInitial extends AiAssistantState {}

class AiAssistantLoaded extends AiAssistantState {
  final List<ChatMessage> messages;
  final bool isListening;

  const AiAssistantLoaded({
    required this.messages,
    required this.isListening,
  });

  @override
  List<Object?> get props => [messages, isListening];
}
