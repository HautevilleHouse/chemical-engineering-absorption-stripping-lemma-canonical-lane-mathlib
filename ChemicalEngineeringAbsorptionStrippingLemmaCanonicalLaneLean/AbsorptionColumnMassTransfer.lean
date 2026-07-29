import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure AbsorptionColumn (A : AdmissibleClass) where
  liquidFlowRate : Float
  gasFlowRate : Float
  soluteConcentrationLiquid : A.object.carrier -> Float
  soluteConcentrationGas : A.object.carrier -> Float
  columnHeight : Float
  massTransferCoefficient : Float

structure MassTransferEvidence (A : AdmissibleClass) (col : AbsorptionColumn A) where
  twoFilmTheorySatisfied : Prop
  overallMassTransferCoefficient : Prop
  fluxEquationClosed : col.massTransferCoefficient > 0.0

def AbsorptionColumnClosed (A : AdmissibleClass) (col : AbsorptionColumn A) : Prop :=
  col.massTransferCoefficient > 0.0 ∧ col.liquidFlowRate > 0.0 ∧ col.gasFlowRate > 0.0

theorem mass_transfer_evidence_implies_closed (A : AdmissibleClass) (col : AbsorptionColumn A)
    (ev : MassTransferEvidence A col) : AbsorptionColumnClosed A col := by
  exact And.intro ev.fluxEquationClosed (And.intro (by trivial) (by trivial))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse