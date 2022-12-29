import 'package:equatable/equatable.dart';

class RendimentoCDI extends Equatable {
  final double montanteInicial;
  final int tempoDeRendimentoEmMeses;
  final double indiceCDIAnual;

  final double montanteLiquidoFinal;
  final double montanteBrutoFinal;

  final double rendimentoLiquidoTotal;
  final double rendimentoBrutoTotal;
  final double impostoTotalSobreRendimento;

  final List<double> rendimentoBrutoMensal;
  final List<double> rendimentoLiquidoMensal;
  final List<double> impostoMensal;

  const RendimentoCDI({
    required this.montanteInicial,
    required this.tempoDeRendimentoEmMeses,
    required this.indiceCDIAnual,
    required this.rendimentoBrutoTotal,
    required this.impostoTotalSobreRendimento,
    required this.montanteLiquidoFinal,
    required this.montanteBrutoFinal,
    required this.rendimentoLiquidoTotal,
    required this.rendimentoBrutoMensal,
    required this.rendimentoLiquidoMensal,
    required this.impostoMensal,
  });

  @override
  List<Object> get props => [
        tempoDeRendimentoEmMeses,
        indiceCDIAnual,
        rendimentoBrutoTotal,
        impostoTotalSobreRendimento,
        montanteLiquidoFinal,
        montanteBrutoFinal,
        rendimentoLiquidoTotal,
        rendimentoBrutoMensal,
        rendimentoLiquidoMensal,
        impostoMensal,
      ];
}
