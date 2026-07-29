import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure AbsorptionColumn where
  stages : Nat
  liquidFlowRate : ℝ
  gasFlowRate : ℝ
  operatingLineSlope : ℝ
  equilibriumCurveSlope : ℝ
  liquidViscosity : ℝ
  gasDensity : ℝ
  columnDiameter : ℝ
  packingHeight : ℝ

structure StrippingColumn where
  stages : Nat
  liquidFlowRate : ℝ
  strippingGasFlowRate : ℝ
  operatingLineSlope : ℝ
  equilibriumCurveSlope : ℝ
  liquidViscosity : ℝ
  gasDensity : ℝ
  columnDiameter : ℝ
  packingHeight : ℝ

structure ColumnEvidence (C : AbsorptionColumn) where
  stagesPositive : C.stages > 0
  flowRatesPositive : C.liquidFlowRate > 0 ∧ C.gasFlowRate > 0
  slopesPositive : C.operatingLineSlope > 0 ∧ C.equilibriumCurveSlope > 0
  viscosityPositive : C.liquidViscosity > 0
  densityPositive : C.gasDensity > 0
  diameterPositive : C.columnDiameter > 0
  heightPositive : C.packingHeight > 0

def AbsorptionColumnClosed (C : AbsorptionColumn) : Prop :=
  C.stages > 0 ∧ C.liquidFlowRate > 0 ∧ C.gasFlowRate > 0 ∧
  C.operatingLineSlope > 0 ∧ C.equilibriumCurveSlope > 0 ∧
  C.liquidViscosity > 0 ∧ C.gasDensity > 0 ∧
  C.columnDiameter > 0 ∧ C.packingHeight > 0

theorem absorption_column_closed_from_evidence (C : AbsorptionColumn) (E : ColumnEvidence C) : AbsorptionColumnClosed C := by
  rcases E with ⟨h1, ⟨h2, h3⟩, ⟨h4, h5⟩, h6, h7, h8, h9⟩
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 (And.intro h5 (And.intro h6 (And.intro h7 (And.intro h8 h9)))))))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse