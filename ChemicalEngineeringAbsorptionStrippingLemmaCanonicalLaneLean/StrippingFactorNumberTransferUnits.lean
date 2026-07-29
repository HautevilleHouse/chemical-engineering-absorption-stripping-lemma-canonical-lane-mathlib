import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure StrippingFactorNumberTransferUnits where
  strippingFactor : Float
  numberTransferUnits : Float
  absorptionFactor : Float
  theoreticalStages : Nat

structure StrippingFactorNTUEvidence (S : StrippingFactorNumberTransferUnits) where
  strippingFactorPositive : S.strippingFactor > 0
  numberTransferUnitsPositive : S.numberTransferUnits > 0
  absorptionFactorPositive : S.absorptionFactor > 0
  theoreticalStagesPositive : S.theoreticalStages > 0
  relationHolds : S.numberTransferUnits = (S.theoreticalStages : Float) * (S.strippingFactor - 1) / (S.strippingFactor * (S.absorptionFactor - 1))

def StrippingFactorNTUClosed (S : StrippingFactorNumberTransferUnits) : Prop :=
  S.strippingFactor > 0 ∧ S.numberTransferUnits > 0 ∧ S.absorptionFactor > 0 ∧ S.theoreticalStages > 0 ∧
  S.numberTransferUnits = (S.theoreticalStages : Float) * (S.strippingFactor - 1) / (S.strippingFactor * (S.absorptionFactor - 1))

theorem stripping_factor_ntu_closed_from_evidence (S : StrippingFactorNumberTransferUnits) (E : StrippingFactorNTUEvidence S) :
    StrippingFactorNTUClosed S := by
  exact And.intro E.strippingFactorPositive
    (And.intro E.numberTransferUnitsPositive
      (And.intro E.absorptionFactorPositive
        (And.intro E.theoreticalStagesPositive E.relationHolds)))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse