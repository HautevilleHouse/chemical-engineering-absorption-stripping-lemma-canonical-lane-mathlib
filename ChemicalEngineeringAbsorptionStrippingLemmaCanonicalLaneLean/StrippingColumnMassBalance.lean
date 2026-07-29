import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure StrippingColumnPackage where
  inletLiquidRate : ℝ
  inletGasRate : ℝ
  strippingFactor : ℝ
  equilibriumLineSlope : ℝ
  soluteInLiquidInlet : ℝ
  soluteInGasInlet : ℝ

structure StrippingMassBalanceEvidence (S : StrippingColumnPackage) where
  soluteInLiquidNonneg : S.soluteInLiquidInlet ≥ 0
  soluteInGasNonneg : S.soluteInGasInlet ≥ 0
  liquidRatePos : S.inletLiquidRate > 0
  gasRatePos : S.inletGasRate > 0
  strippingFactorDefined : S.strippingFactor = S.equilibriumLineSlope * S.inletGasRate / S.inletLiquidRate

def StrippingMassBalanceClosed (S : StrippingColumnPackage) : Prop :=
  S.soluteInLiquidInlet ≥ 0 ∧ S.soluteInGasInlet ≥ 0 ∧ S.inletLiquidRate > 0 ∧ S.inletGasRate > 0 ∧ S.strippingFactor = S.equilibriumLineSlope * S.inletGasRate / S.inletLiquidRate

theorem stripping_mass_balance_closed_from_evidence (S : StrippingColumnPackage) (E : StrippingMassBalanceEvidence S) :
    StrippingMassBalanceClosed S := by
  exact And.intro E.soluteInLiquidNonneg (And.intro E.soluteInGasNonneg (And.intro E.liquidRatePos (And.intro E.gasRatePos E.strippingFactorDefined)))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse
