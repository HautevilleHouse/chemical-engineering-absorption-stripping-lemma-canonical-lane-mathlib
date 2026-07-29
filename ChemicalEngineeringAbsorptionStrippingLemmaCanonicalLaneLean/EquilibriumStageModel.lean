import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.MassTransferPacking

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure EquilibriumStageModelPackage (P : MassTransferPackingPackage) where
  operatingLine : Prop
  equilibriumCurve : Prop
  numberOfStages : Prop
  stageEfficiency : Prop

structure EquilibriumStageModelEvidence {P : MassTransferPackingPackage}
    (E : EquilibriumStageModelPackage P) where
  operatingLineClosed : E.operatingLine
  equilibriumCurveClosed : E.equilibriumCurve
  numberOfStagesClosed : E.numberOfStages
  stageEfficiencyClosed : E.stageEfficiency

def EquilibriumStageModelClosed {P : MassTransferPackingPackage}
    (E : EquilibriumStageModelPackage P) : Prop :=
  E.operatingLine ∧ E.equilibriumCurve ∧ E.numberOfStages ∧ E.stageEfficiency

theorem equilibrium_stage_model_closed_from_evidence {P : MassTransferPackingPackage}
    (E : EquilibriumStageModelPackage P) (Ev : EquilibriumStageModelEvidence E) :
    EquilibriumStageModelClosed E := by
  exact And.intro Ev.operatingLineClosed (And.intro Ev.equilibriumCurveClosed (And.intro Ev.numberOfStagesClosed Ev.stageEfficiencyClosed))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse