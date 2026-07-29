import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.OperatingLine

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure ChemicalEngineeringAdmittedObject where
  columnModel : Σ (C : AbsorptionColumn) (S : StrippingColumn), DesignEquationPackage C S × MassTransferRatePackage (default (DesignEquationPackage C S)) × OperatingLinePackage (default (MassTransferRatePackage (default (DesignEquationPackage C S))))
  designValid : Prop
  massTransferValid : Prop
  operatingLineValid : Prop
  conclusion : designValid ∧ massTransferValid ∧ operatingLineValid

structure AdmissibleClass where
  object : ChemicalEngineeringAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.designValid ∧ A.object.massTransferValid ∧ A.object.operatingLineValid) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse