import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure HenrysLawParams where
  solute : String
  solvent : String
  henryConstant : Float
  temperature : Float
  units : String

def equilibriumMoleFraction (H : HenrysLawParams) (partialPressure : Float) : Float :=
  partialPressure / H.henryConstant

structure AbsorberDesignEquation (A : AdmissibleClass) where
  inletLiquid : A.object  -- liquid flow rate?
  inletGas : A.object
  outletLiquid : A.object
  outletGas : A.object
  columnHeight : Float
  diameter : Float
  packingType : String
  equilibriumData : HenrysLawParams
  designSatisfied : Prop
  designSatisfiedTerm : designSatisfied

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse