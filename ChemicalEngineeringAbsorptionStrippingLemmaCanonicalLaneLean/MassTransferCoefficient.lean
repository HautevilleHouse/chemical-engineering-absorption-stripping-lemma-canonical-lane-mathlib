import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure MassTransferCoefficient where
  massFlux : Float
  concentrationDrivingForce : Float
  diffusionCoefficient : Float
  viscosity : Float
  density : Float
  kL : Float
  kG : Float

def overallMassTransferCoefficient (M : MassTransferCoefficient) : Float :=
  (M.kL * M.kG) / (M.kL + M.kG)

def fluxFromCoefficient (M : MassTransferCoefficient) : Float :=
  overallMassTransferCoefficient M * M.concentrationDrivingForce

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse