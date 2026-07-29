import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.AbsorptionColumnEquilibrium

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure MinimumLiquidGasRatioPackage (A : AbsorptionColumnPackage) where
  soluteInletGas : ℝ
  soluteInletLiquid : ℝ
  soluteOutletGas : ℝ
  soluteOutletLiquid : ℝ
  equilibriumLineSlope : ℝ
  minimumRatio : ℝ

structure MinimumRatioEvidence (M : MinimumLiquidGasRatioPackage A) where
  inletGasNonneg : M.soluteInletGas ≥ 0
  outletGasLeInlet : M.soluteOutletGas ≤ M.soluteInletGas
  outletLiquidGeInlet : M.soluteOutletLiquid ≥ M.soluteInletLiquid
  equilibriumLineSlopePos : M.equilibriumLineSlope > 0
  minimumRatioFormula : M.minimumRatio = (M.soluteInletGas - M.soluteOutletGas) / (M.equilibriumLineSlope * M.soluteOutletLiquid - M.soluteInletLiquid)

def MinimumRatioClosed (M : MinimumLiquidGasRatioPackage A) : Prop :=
  M.soluteInletGas ≥ 0 ∧ M.soluteOutletGas ≤ M.soluteInletGas ∧
  M.soluteOutletLiquid ≥ M.soluteInletLiquid ∧ M.equilibriumLineSlope > 0 ∧
  M.minimumRatio = (M.soluteInletGas - M.soluteOutletGas) / (M.equilibriumLineSlope * M.soluteOutletLiquid - M.soluteInletLiquid)

theorem minimum_ratio_closed_from_evidence (M : MinimumLiquidGasRatioPackage A) (E : MinimumRatioEvidence M) :
    MinimumRatioClosed M := by
  exact And.intro E.inletGasNonneg (And.intro E.outletGasLeInlet (And.intro E.outletLiquidGeInlet (And.intro E.equilibriumLineSlopePos E.minimumRatioFormula)))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse
