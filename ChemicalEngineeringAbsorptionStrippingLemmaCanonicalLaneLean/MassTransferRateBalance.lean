import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure MassTransferRateBalance where
  vaporPhaseTransferRate : Float
  liquidPhaseTransferRate : Float
  overallMassTransferCoefficient : Float
  interfacialArea : Float
  drivingForce : Float

structure MassTransferRateEvidence (M : MassTransferRateBalance) where
  transferRatesMatched : M.vaporPhaseTransferRate = M.liquidPhaseTransferRate
  rateFromCoefficient : M.vaporPhaseTransferRate = M.overallMassTransferCoefficient * M.interfacialArea * M.drivingForce
  coefficientsPositive : M.overallMassTransferCoefficient > 0
  interfacialAreaPositive : M.interfacialArea > 0
  drivingForceNonnegative : M.drivingForce ≥ 0

def MassTransferRateClosed (M : MassTransferRateBalance) : Prop :=
  M.vaporPhaseTransferRate = M.liquidPhaseTransferRate ∧
  M.vaporPhaseTransferRate = M.overallMassTransferCoefficient * M.interfacialArea * M.drivingForce ∧
  M.overallMassTransferCoefficient > 0 ∧ M.interfacialArea > 0 ∧ M.drivingForce ≥ 0

theorem mass_transfer_rate_closed_from_evidence (M : MassTransferRateBalance) (E : MassTransferRateEvidence M) :
    MassTransferRateClosed M := by
  exact And.intro E.transferRatesMatched
    (And.intro E.rateFromCoefficient
      (And.intro E.coefficientsPositive
        (And.intro E.interfacialAreaPositive E.drivingForceNonnegative)))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse