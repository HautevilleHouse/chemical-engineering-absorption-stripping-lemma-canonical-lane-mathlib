import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.EquilibriumStageModel

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure AbsorptionColumnDesignPackage {P : MassTransferPackingPackage}
    (E : EquilibriumStageModelPackage P) where
  columnDiameter : Prop
  columnHeight : Prop
  pressureDrop : Prop
  liquidGasRatio : Prop

structure AbsorptionColumnDesignEvidence {P : MassTransferPackingPackage}
    {E : EquilibriumStageModelPackage P} (D : AbsorptionColumnDesignPackage E) where
  columnDiameterClosed : D.columnDiameter
  columnHeightClosed : D.columnHeight
  pressureDropClosed : D.pressureDrop
  liquidGasRatioClosed : D.liquidGasRatio

def AbsorptionColumnDesignClosed {P : MassTransferPackingPackage}
    {E : EquilibriumStageModelPackage P} (D : AbsorptionColumnDesignPackage E) : Prop :=
  D.columnDiameter ∧ D.columnHeight ∧ D.pressureDrop ∧ D.liquidGasRatio

theorem absorption_column_design_closed_from_evidence {P : MassTransferPackingPackage}
    {E : EquilibriumStageModelPackage P} (D : AbsorptionColumnDesignPackage E)
    (Ev : AbsorptionColumnDesignEvidence D) : AbsorptionColumnDesignClosed D := by
  exact And.intro Ev.columnDiameterClosed (And.intro Ev.columnHeightClosed (And.intro Ev.pressureDropClosed Ev.liquidGasRatioClosed))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse