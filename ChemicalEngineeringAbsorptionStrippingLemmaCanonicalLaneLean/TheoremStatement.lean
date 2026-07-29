import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.Basic

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure AbsorptionStrippingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure AbsorptionStrippingAdmittedObject where
  space : AbsorptionStrippingSpace
  absorptionStrippingTheorem : Prop
  conclusion : absorptionStrippingTheorem

def AbsorptionStrippingWitnessClosed (O : AbsorptionStrippingAdmittedObject) : Prop :=
  O.absorptionStrippingTheorem

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse