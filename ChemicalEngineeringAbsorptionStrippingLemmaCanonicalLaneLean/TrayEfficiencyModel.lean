import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure TrayEfficiencyPackage where
  vaporPhaseEfficiency : ℝ
  liquidPhaseEfficiency : ℝ
  overallEfficiency : ℝ
  absorptionFactor : ℝ
  numberOfIdealStages : ℕ
  numberOfActualStages : ℕ

structure TrayEfficiencyEvidence (T : TrayEfficiencyPackage) where
  vaporEffNonneg : T.vaporPhaseEfficiency ≥ 0
  vaporEffLeOne : T.vaporPhaseEfficiency ≤ 1
  liquidEffNonneg : T.liquidPhaseEfficiency ≥ 0
  liquidEffLeOne : T.liquidPhaseEfficiency ≤ 1
  overallEfficiencyFormula : T.overallEfficiency = (T.vaporPhaseEfficiency * T.liquidPhaseEfficiency) / (T.vaporPhaseEfficiency + T.liquidPhaseEfficiency * (1 - T.vaporPhaseEfficiency))
  stagesRelation : T.numberOfActualStages = (T.numberOfIdealStages : ℕ) / (T.overallEfficiency : ℕ)

def TrayEfficiencyClosed (T : TrayEfficiencyPackage) : Prop :=
  T.vaporPhaseEfficiency ≥ 0 ∧ T.vaporPhaseEfficiency ≤ 1 ∧
  T.liquidPhaseEfficiency ≥ 0 ∧ T.liquidPhaseEfficiency ≤ 1 ∧
  T.overallEfficiency = (T.vaporPhaseEfficiency * T.liquidPhaseEfficiency) / (T.vaporPhaseEfficiency + T.liquidPhaseEfficiency * (1 - T.vaporPhaseEfficiency)) ∧
  T.numberOfActualStages = (T.numberOfIdealStages : ℕ) / (T.overallEfficiency : ℕ)

theorem tray_efficiency_closed_from_evidence (T : TrayEfficiencyPackage) (E : TrayEfficiencyEvidence T) :
    TrayEfficiencyClosed T := by
  exact And.intro E.vaporEffNonneg (And.intro E.vaporEffLeOne (And.intro E.liquidEffNonneg (And.intro E.liquidEffLeOne (And.intro E.overallEfficiencyFormula E.stagesRelation))))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse
