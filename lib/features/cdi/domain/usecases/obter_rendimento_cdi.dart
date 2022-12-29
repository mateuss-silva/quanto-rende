import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/rendimento_cdi.dart';
import '../repositories/rendimento_cdi_repository.dart';

class ObterRendimentoCDI {
  final RendimentoCDIRepository repository;

  ObterRendimentoCDI(this.repository);

  Future<Either<Failure, RendimentoCDI>> execute({
    required double montante,
    required int tempoDeRendimentoEmMeses,
    double? indiceCDI,
  }) async {
    return await ( repository.getRendimentoCDI(
      montante: montante,
      tempoDeRendimentoEmMeses: tempoDeRendimentoEmMeses,
      indiceCDI: indiceCDI,
    ));
  }
}
