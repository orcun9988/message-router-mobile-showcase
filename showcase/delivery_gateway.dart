class DeliveryRequest {
  const DeliveryRequest({required this.destinationId, required this.payload});

  final String destinationId;
  final String payload;
}

class DeliveryResult {
  const DeliveryResult({required this.accepted, required this.reference});

  final bool accepted;
  final String reference;
}

abstract interface class DeliveryGateway {
  Future<DeliveryResult> deliver(DeliveryRequest request);
}

// Production adapters, authentication, remote endpoints and retry persistence
// are deliberately omitted from this public portfolio snapshot.
