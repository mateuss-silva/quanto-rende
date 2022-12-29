import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quanto_rende/features/cdi/domain/entities/rendimento_cdi.dart';
import 'package:quanto_rende/features/cdi/domain/repositories/rendimento_cdi_repository.dart';
import 'package:quanto_rende/features/cdi/domain/usecases/obter_rendimento_cdi.dart';

class MockRendimentoCDIRepository extends Mock
    implements RendimentoCDIRepository {}

void main() {
  late MockRendimentoCDIRepository mockRendimentoCDIRepository;
  late ObterRendimentoCDI usecase;

  setUp(() {
    mockRendimentoCDIRepository = MockRendimentoCDIRepository();
    usecase = ObterRendimentoCDI(mockRendimentoCDIRepository);
  });

  const double montante = 7500;
  const int mesesDeRendimento = 12;
  const double indiceCDIAnual = 12.17;
  const double rendimentoBrutoTotal = 912.75;
  const double impostoTotalSobreRendimento = 182.55; //imposto de 20% aplicado
  const double rendimentoLiquidoTotal = 730.2;
  const double montanteBrutoFinal = 8412.75;
  const double montanteLiquidoFinal = 8230.20;

  const List<double> rendimentoBrutoMensal = [
    72.12,
    72.82,
    73.52,
    74.22,
    74.94,
    75.66,
    76.39,
    77.12,
    77.86,
    78.61,
    79.37,
    80.13
  ];
  const List<double> impostoMensal = [
    14.424,
    14.564,
    14.704,
    14.844,
    14.988,
    15.132,
    15.278,
    15.424,
    15.572,
    15.722,
    15.874,
    16.026
  ];
  const List<double> rendimentoLiquidoMensal = [
    57.696,
    58.255,
    58.815,
    59.376,
    59.952,
    60.528,
    61.112,
    61.696,
    62.288,
    62.888,
    63.496,
    64.104
  ];

  const rendimentoCDI = RendimentoCDI(
    montanteInicial: montante,
    tempoDeRendimentoEmMeses: mesesDeRendimento,
    indiceCDIAnual: indiceCDIAnual,
    impostoTotalSobreRendimento: impostoTotalSobreRendimento,
    montanteBrutoFinal: montanteBrutoFinal,
    montanteLiquidoFinal: montanteLiquidoFinal,
    rendimentoBrutoTotal: rendimentoBrutoTotal,
    rendimentoLiquidoTotal: rendimentoLiquidoTotal,
    rendimentoBrutoMensal: rendimentoBrutoMensal,
    rendimentoLiquidoMensal: rendimentoLiquidoMensal,
    impostoMensal: impostoMensal,
  );

  test(
    'deve obter rendimento cdi do repositório utilizando índice atual',
    () async {
      // arrange
      when(() => mockRendimentoCDIRepository.getRendimentoCDI(
            montante: montante,
            tempoDeRendimentoEmMeses: mesesDeRendimento,
          )).thenAnswer((_) async => const Right(rendimentoCDI));

      // act
      final result = await usecase.execute(
        montante: montante,
        tempoDeRendimentoEmMeses: mesesDeRendimento,
      );

      // assert
      expect(result, const Right(rendimentoCDI));
      verify(() => mockRendimentoCDIRepository.getRendimentoCDI(
            montante: montante,
            tempoDeRendimentoEmMeses: mesesDeRendimento,
          )).called(1);
      verifyNoMoreInteractions(mockRendimentoCDIRepository);
    },
  );
}
