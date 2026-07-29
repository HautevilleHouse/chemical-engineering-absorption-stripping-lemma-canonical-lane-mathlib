import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure ColumnStream where
  liquidFlowRate : Float
  gasFlowRate : Float
  moleFraction : Float
  soluteConcentration : Float
  temperature : Float
  pressure : Float
  enthalpy : Float

def operatingLineSlope (C : ColumnStream) : Float :=
  (C.moleFraction - C.enthalpy) / (C.liquidFlowRate - C.gasFlowRate) 

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse