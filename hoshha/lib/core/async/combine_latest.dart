import 'dart:async';

Stream<R> combineLatest2<A, B, R>(
  Stream<A> streamA,
  Stream<B> streamB,
  R Function(A valueA, B valueB) combiner,
) {
  late final StreamController<R> controller;
  StreamSubscription<A>? subscriptionA;
  StreamSubscription<B>? subscriptionB;

  var hasA = false;
  var hasB = false;
  late A latestA;
  late B latestB;
  var completedStreams = 0;

  void emitIfReady() {
    if (hasA && hasB) {
      controller.add(combiner(latestA, latestB));
    }
  }

  void handleDone() {
    completedStreams += 1;
    if (completedStreams == 2) {
      controller.close();
    }
  }

  controller = StreamController<R>(
    onListen: () {
      subscriptionA = streamA.listen(
        (value) {
          latestA = value;
          hasA = true;
          emitIfReady();
        },
        onError: controller.addError,
        onDone: handleDone,
      );
      subscriptionB = streamB.listen(
        (value) {
          latestB = value;
          hasB = true;
          emitIfReady();
        },
        onError: controller.addError,
        onDone: handleDone,
      );
    },
    onPause: () {
      subscriptionA?.pause();
      subscriptionB?.pause();
    },
    onResume: () {
      subscriptionA?.resume();
      subscriptionB?.resume();
    },
    onCancel: () async {
      await subscriptionA?.cancel();
      await subscriptionB?.cancel();
    },
  );

  return controller.stream;
}

Stream<R> combineLatest3<A, B, C, R>(
  Stream<A> streamA,
  Stream<B> streamB,
  Stream<C> streamC,
  R Function(A valueA, B valueB, C valueC) combiner,
) {
  late final StreamController<R> controller;
  StreamSubscription<A>? subscriptionA;
  StreamSubscription<B>? subscriptionB;
  StreamSubscription<C>? subscriptionC;

  var hasA = false;
  var hasB = false;
  var hasC = false;
  late A latestA;
  late B latestB;
  late C latestC;
  var completedStreams = 0;

  void emitIfReady() {
    if (hasA && hasB && hasC) {
      controller.add(combiner(latestA, latestB, latestC));
    }
  }

  void handleDone() {
    completedStreams += 1;
    if (completedStreams == 3) {
      controller.close();
    }
  }

  controller = StreamController<R>(
    onListen: () {
      subscriptionA = streamA.listen(
        (value) {
          latestA = value;
          hasA = true;
          emitIfReady();
        },
        onError: controller.addError,
        onDone: handleDone,
      );
      subscriptionB = streamB.listen(
        (value) {
          latestB = value;
          hasB = true;
          emitIfReady();
        },
        onError: controller.addError,
        onDone: handleDone,
      );
      subscriptionC = streamC.listen(
        (value) {
          latestC = value;
          hasC = true;
          emitIfReady();
        },
        onError: controller.addError,
        onDone: handleDone,
      );
    },
    onPause: () {
      subscriptionA?.pause();
      subscriptionB?.pause();
      subscriptionC?.pause();
    },
    onResume: () {
      subscriptionA?.resume();
      subscriptionB?.resume();
      subscriptionC?.resume();
    },
    onCancel: () async {
      await subscriptionA?.cancel();
      await subscriptionB?.cancel();
      await subscriptionC?.cancel();
    },
  );

  return controller.stream;
}
