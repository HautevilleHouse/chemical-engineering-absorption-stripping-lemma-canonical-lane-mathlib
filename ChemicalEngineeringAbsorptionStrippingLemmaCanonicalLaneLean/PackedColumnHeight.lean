import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure PackedColumnHeight where
  packingFactor : Float
  liquidViscosity : Float
  gasDensity : Float
  surfaceTension : Float
  columnDiameter : Float
  height : Float
  pressureDrop : Float

def numberTransferUnits (S : PackedColumnHeight) : Float :=
  (S.height * S.packingFactor) / (S.liquidViscosity * S.gasDensity)

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse