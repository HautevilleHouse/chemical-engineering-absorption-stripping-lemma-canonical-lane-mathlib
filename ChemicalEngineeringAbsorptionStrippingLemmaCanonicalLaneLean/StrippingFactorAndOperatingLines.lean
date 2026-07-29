import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure OperatingLineData (A : AdmissibleClass) where
  liquidInletConcentration : Float
  gasInletConcentration : Float
  liquidOutletConcentration : Float
  gasOutletConcentration : Float
  operatingLineSlope : Float
  equilibriumLineSlope : Float
  strippingFactor : Float

structure OperatingLineEvidence (A : AdmissibleClass) (op : OperatingLineData A) where
  materialBalanceSatisfied : op.liquidInletConcentration * op.liquidOutletConcentration = op.gasInletConcentration * op.gasOutletConcentration
  strippingFactorFormula : op.strippingFactor = op.operatingLineSlope / op.equilibriumLineSlope
  slopesPositive : op.operatingLineSlope > 0.0 ∧ op.equilibriumLineSlope > 0.0

def OperatingLineClosed (A : AdmissibleClass) (op : OperatingLineData A) : Prop :=
  op.strippingFactor > 0.0 ∧ op.operatingLineSlope > 0.0 ∧ op.equilibriumLineSlope > 0.0

theorem operating_line_closed_from_evidence (A : AdmissibleClass) (op : OperatingLineData A)
    (ev : OperatingLineEvidence A op) : OperatingLineClosed A op := by
  have hpos : op.strippingFactor > 0.0 := by
    rw [ev.strippingFactorFormula]
    exact div_pos ev.slopesPositive.1 ev.slopesPositive.2
  exact And.intro hpos (And.intro ev.slopesPositive.1 ev.slopesPositive.2)

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse