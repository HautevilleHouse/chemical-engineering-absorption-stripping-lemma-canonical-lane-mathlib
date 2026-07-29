import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure StrippingFactor where
  liquidFlowRate : Float
  gasFlowRate : Float
  equilibriumConstant : Float
  operatingLineSlope : Float
  strippingFactor : Float

def computeStrippingFactor (S : StrippingFactor) : Float :=
  (S.liquidFlowRate) / (S.gasFlowRate * S.equilibriumConstant)

structure StrippingColumnDesign (A : AdmissibleClass) where
  feedStream : A.object
  steamFlow : Float
  trays : Nat
  trayEfficiency : Float
  reboilerDuty : Float
  vaporLiquidEquilibrium : HenrysLawParams
  designValid : Prop
  designValidTerm : designValid

def idealStrippingModel (L : Float) (V : Float) (m : Float) (xIn : Float) : Float :=
  (xIn) / (1.0 - ((L) / (m * V)))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse