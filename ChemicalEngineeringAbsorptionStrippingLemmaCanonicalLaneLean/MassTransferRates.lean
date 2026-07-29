import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.DesignEquations

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure MassTransferRatePackage {C : AbsorptionColumn} {S : StrippingColumn} (D : DesignEquationPackage C S) where
  soluteTransferRate : ℝ
  drivingForce : ℝ
  filmResistanceLiquid : ℝ
  filmResistanceGas : ℝ
  overallResistance : ℝ
  murphreeEfficiencyLiquid : ℝ
  murphreeEfficiencyGas : ℝ

structure MassTransferRateEvidence {C : AbsorptionColumn} {S : StrippingColumn}
  {D : DesignEquationPackage C S} (M : MassTransferRatePackage D) where
  soluteTransferRateClosed : M.soluteTransferRate > 0
  drivingForceClosed : M.drivingForce > 0
  filmResistanceLiquidClosed : M.filmResistanceLiquid > 0
  filmResistanceGasClosed : M.filmResistanceGas > 0
  overallResistanceClosed : M.overallResistance > 0
  murphreeEfficiencyLiquidClosed : 0 < M.murphreeEfficiencyLiquid ∧ M.murphreeEfficiencyLiquid ≤ 1
  murphreeEfficiencyGasClosed : 0 < M.murphreeEfficiencyGas ∧ M.murphreeEfficiencyGas ≤ 1

def MassTransferRatePackageClosed {C : AbsorptionColumn} {S : StrippingColumn}
  {D : DesignEquationPackage C S} (M : MassTransferRatePackage D) : Prop :=
  M.soluteTransferRate > 0 ∧ M.drivingForce > 0 ∧
  M.filmResistanceLiquid > 0 ∧ M.filmResistanceGas > 0 ∧
  M.overallResistance > 0 ∧
  0 < M.murphreeEfficiencyLiquid ∧ M.murphreeEfficiencyLiquid ≤ 1 ∧
  0 < M.murphreeEfficiencyGas ∧ M.murphreeEfficiencyGas ≤ 1

theorem mass_transfer_rate_package_closed_from_evidence
  {C : AbsorptionColumn} {S : StrippingColumn} {D : DesignEquationPackage C S}
  (M : MassTransferRatePackage D) (E : MassTransferRateEvidence M) :
  MassTransferRatePackageClosed M := by
  rcases E with ⟨h1, h2, h3, h4, h5, ⟨h6a, h6b⟩, ⟨h7a, h7b⟩⟩
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 (And.intro h5 (And.intro h6a (And.intro h6b (And.intro h7a h7b)))))))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse