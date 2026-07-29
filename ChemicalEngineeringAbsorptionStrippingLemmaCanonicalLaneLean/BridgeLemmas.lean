import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.designValid ∧ A.object.massTransferValid ∧ A.object.operatingLineValid

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse