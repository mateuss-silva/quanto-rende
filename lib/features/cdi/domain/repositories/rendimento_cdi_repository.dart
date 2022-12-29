import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/rendimento_cdi.dart';

abstract class RendimentoCDIRepository {
  Future<Either<Failure, RendimentoCDI>> getRendimentoCDI({
    required double montante,
    required int tempoDeRendimentoEmMeses,
    double? indiceCDI,
  });
}
