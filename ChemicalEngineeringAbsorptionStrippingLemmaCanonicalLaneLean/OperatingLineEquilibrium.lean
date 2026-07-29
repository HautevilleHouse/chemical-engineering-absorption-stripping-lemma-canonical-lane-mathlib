import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure OperatingLinePackage where
  liquidToGasRatio : Float
  equilibriumConstant : Float
  operatingLineSlope : Float
  operatingLineIntercept : Float

structure OperatingLineEvidence (O : OperatingLinePackage) where
  liquidToGasRatioPositive : O.liquidToGasRatio > 0
  equilibriumConstantPositive : O.equilibriumConstant > 0
  operatingLineSlopeCorrect : O.operatingLineSlope = O.liquidToGasRatio
  operatingLineInterceptDerived : O.operatingLineIntercept = (O.liquidToGasRatio * 0.5) - (1 / O.equilibriumConstant)

def OperatingLineClosed (O : OperatingLinePackage) : Prop :=
  O.liquidToGasRatio > 0 ∧ O.equilibriumConstant > 0 ∧
  O.operatingLineSlope = O.liquidToGasRatio ∧
  O.operatingLineIntercept = (O.liquidToGasRatio * 0.5) - (1 / O.equilibriumConstant)

theorem operating_line_closed_from_evidence (O : OperatingLinePackage) (E : OperatingLineEvidence O) :
    OperatingLineClosed O := by
  exact And.intro E.liquidToGasRatioPositive
    (And.intro E.equilibriumConstantPositive
      (And.intro E.operatingLineSlopeCorrect E.operatingLineInterceptDerived))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse