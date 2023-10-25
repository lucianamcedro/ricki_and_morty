import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) =>
    (event, mapper) => droppable<E>().call(event.throttle(duration), mapper);
