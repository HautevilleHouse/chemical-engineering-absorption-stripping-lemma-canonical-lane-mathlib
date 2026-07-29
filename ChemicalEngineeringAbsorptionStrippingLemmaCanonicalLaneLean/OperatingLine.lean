import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.MassTransferRates

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure OperatingLinePackage {C : AbsorptionColumn} {S : StrippingColumn}
  {D : DesignEquationPackage C S} (M : MassTransferRatePackage D) where
  liquidConcentrationInlet : ℝ
  liquidConcentrationOutlet : ℝ
  gasConcentrationInlet : ℝ
  gasConcentrationOutlet : ℝ
  operatingLineSlope : ℝ
  equilibriumLineSlope : ℝ
  approachToEquilibrium : ℝ

structure OperatingLineEvidence {C : AbsorptionColumn} {S : StrippingColumn}
  {D : DesignEquationPackage C S} {M : MassTransferRatePackage D}
  (O : OperatingLinePackage M) where
  liquidConcentrationInletClosed : O.liquidConcentrationInlet ≥ 0
  liquidConcentrationOutletClosed : O.liquidConcentrationOutlet ≥ 0
  gasConcentrationInletClosed : O.gasConcentrationInlet ≥ 0
  gasConcentrationOutletClosed : O.gasConcentrationOutlet ≥ 0
  operatingLineSlopeClosed : O.operatingLineSlope > 0
  equilibriumLineSlopeClosed : O.equilibriumLineSlope > 0
  approachToEquilibriumClosed : 0 ≤ O.approachToEquilibrium ∧ O.approachToEquilibrium < 1

def OperatingLinePackageClosed {C : AbsorptionColumn} {S : StrippingColumn}
  {D : DesignEquationPackage C S} {M : MassTransferRatePackage D}
  (O : OperatingLinePackage M) : Prop :=
  O.liquidConcentrationInlet ≥ 0 ∧ O.liquidConcentrationOutlet ≥ 0 ∧
  O.gasConcentrationInlet ≥ 0 ∧ O.gasConcentrationOutlet ≥ 0 ∧
  O.operatingLineSlope > 0 ∧ O.equilibriumLineSlope > 0 ∧
  0 ≤ O.approachToEquilibrium ∧ O.approachToEquilibrium < 1

theorem operating_line_package_closed_from_evidence
  {C : AbsorptionColumn} {S : StrippingColumn} {D : DesignEquationPackage C S}
  {M : MassTransferRatePackage D} (O : OperatingLinePackage M)
  (E : OperatingLineEvidence O) : OperatingLinePackageClosed O := by
  rcases E with ⟨h1, h2, h3, h4, h5, h6, ⟨h7a, h7b⟩⟩
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 (And.intro h5 (And.intro h6 (And.intro h7a h7b))))))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse