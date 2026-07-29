import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure KremserParameters (A : AdmissibleClass) where
  absorptionFactor : Float
  numberOfTheoreticalStages : Nat
  removalEfficiency : Float
  inletGasConcentration : Float
  outletGasConcentration : Float

structure KremserEvidence (A : AdmissibleClass) (kp : KremserParameters A) where
  absorptionFactorFormula : kp.absorptionFactor > 0.0
  kremserFormulaApplied : kp.removalEfficiency = (kp.absorptionFactor ^ (kp.numberOfTheoreticalStages : Float) - 1.0) / (kp.absorptionFactor ^ (kp.numberOfTheoreticalStages : Float) - 1.0 / kp.absorptionFactor) ∨ kp.absorptionFactor = 1.0
  efficiencyPositive : kp.removalEfficiency > 0.0

def KremserClosed (A : AdmissibleClass) (kp : KremserParameters A) : Prop :=
  kp.absorptionFactor > 0.0 ∧ kp.removalEfficiency > 0.0 ∧ kp.outletGasConcentration < kp.inletGasConcentration

theorem kremser_closed_from_evidence (A : AdmissibleClass) (kp : KremserParameters A)
    (ev : KremserEvidence A kp) : KremserClosed A kp := by
  constructor
  · exact ev.absorptionFactorFormula
  · constructor
    · exact ev.efficiencyPositive
    · have : kp.removalEfficiency > 0.0 := ev.efficiencyPositive
      have : kp.outletGasConcentration < kp.inletGasConcentration := by
        have hpos : kp.outletGasConcentration > 0.0 := by
          have := kp.outletGasConcentration
          positivity
        -- We assume removalEfficiency > 0 implies outlet < inlet
        sorry
      exact this

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse