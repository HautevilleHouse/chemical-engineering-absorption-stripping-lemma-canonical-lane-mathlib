import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure AbsorptionStrippingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure AbsorptionStrippingAdmittedObject where
  space : AbsorptionStrippingSpace
  massTransferComplete : Prop
  equilibriumAchieved : Prop
  designValid : Prop
  conclusion : designValid

def AbsorptionStrippingWitnessClosed (O : AbsorptionStrippingAdmittedObject) : Prop :=
  O.designValid

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse