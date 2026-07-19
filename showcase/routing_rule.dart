enum MatchMode { all, any }

class MessageEnvelope {
  const MessageEnvelope({required this.sender, required this.body});

  final String sender;
  final String body;
}

class RoutingRule {
  const RoutingRule({
    required this.name,
    required this.senderContains,
    required this.bodyContains,
    this.mode = MatchMode.all,
    this.enabled = true,
  });

  final String name;
  final String senderContains;
  final String bodyContains;
  final MatchMode mode;
  final bool enabled;

  bool matches(MessageEnvelope message) {
    if (!enabled) return false;

    final senderMatch = _contains(message.sender, senderContains);
    final bodyMatch = _contains(message.body, bodyContains);
    return mode == MatchMode.all
        ? senderMatch && bodyMatch
        : senderMatch || bodyMatch;
  }

  bool _contains(String value, String query) {
    if (query.trim().isEmpty) return true;
    return value.toLowerCase().contains(query.trim().toLowerCase());
  }
}
