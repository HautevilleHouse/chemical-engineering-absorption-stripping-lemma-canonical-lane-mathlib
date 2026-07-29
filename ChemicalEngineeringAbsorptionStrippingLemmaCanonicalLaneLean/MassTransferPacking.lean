import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure MassTransferPackingPackage where
  packingMaterial : Type u
  surfaceArea : Prop
  voidFraction : Prop
  effectiveInterfacialArea : Prop
  massTransferCoefficient : Prop

structure MassTransferPackingEvidence (P : MassTransferPackingPackage) where
  surfaceAreaClosed : P.surfaceArea
  voidFractionClosed : P.voidFraction
  effectiveInterfacialAreaClosed : P.effectiveInterfacialArea
  massTransferCoefficientClosed : P.massTransferCoefficient

def MassTransferPackingClosed (P : MassTransferPackingPackage) : Prop :=
  P.surfaceArea ∧ P.voidFraction ∧ P.effectiveInterfacialArea ∧ P.massTransferCoefficient

theorem mass_transfer_packing_closed_from_evidence (P : MassTransferPackingPackage)
    (E : MassTransferPackingEvidence P) : MassTransferPackingClosed P := by
  exact And.intro E.surfaceAreaClosed (And.intro E.voidFractionClosed (And.intro E.effectiveInterfacialAreaClosed E.massTransferCoefficientClosed))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse