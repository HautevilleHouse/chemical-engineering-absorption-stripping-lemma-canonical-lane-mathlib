import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure AbsorptionColumnPackage where
  liquidFlowRate : ℝ
  gasFlowRate : ℝ
  equilibriumLineSlope : ℝ
  numberStages : ℕ
  absorptionFactor : ℝ
  operatingLine : ℝ → ℝ

structure AbsorptionEvidence (A : AbsorptionColumnPackage) where
  equilibriumLineSlopePos : A.equilibriumLineSlope > 0
  absorptionFactorDefined : A.absorptionFactor = A.equilibriumLineSlope * A.liquidFlowRate / A.gasFlowRate
  operatingLineDerived : ∀ x : ℝ, A.operatingLine x = (A.liquidFlowRate / A.gasFlowRate) * x + (1 - A.liquidFlowRate / A.gasFlowRate)
  numberStagesPos : A.numberStages > 0

def AbsorptionClosed (A : AbsorptionColumnPackage) : Prop :=
  A.equilibriumLineSlope > 0 ∧ A.absorptionFactor = A.equilibriumLineSlope * A.liquidFlowRate / A.gasFlowRate ∧ A.numberStages > 0

theorem absorption_closed_from_evidence (A : AbsorptionColumnPackage) (E : AbsorptionEvidence A) :
    AbsorptionClosed A := by
  exact And.intro E.equilibriumLineSlopePos (And.intro E.absorptionFactorDefined E.numberStagesPos)

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse
