import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.AbsorptionStrippingColumnModel

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure DesignEquationPackage (C : AbsorptionColumn) (S : StrippingColumn) where
  numberTransferUnits : ℝ
  heightTransferUnit : ℝ
  overallMassTransferCoefficient : ℝ
  interfacialArea : ℝ
  henrysLawConstant : ℝ
  strippingFactor : ℝ

structure DesignEquationEvidence {C : AbsorptionColumn} {S : StrippingColumn} (D : DesignEquationPackage C S) where
  numberTransferUnitsClosed : D.numberTransferUnits > 0
  heightTransferUnitClosed : D.heightTransferUnit > 0
  overallMassTransferCoefficientClosed : D.overallMassTransferCoefficient > 0
  interfacialAreaClosed : D.interfacialArea > 0
  henrysLawConstantClosed : D.henrysLawConstant > 0
  strippingFactorClosed : D.strippingFactor > 0

def DesignEquationPackageClosed {C : AbsorptionColumn} {S : StrippingColumn} (D : DesignEquationPackage C S) : Prop :=
  D.numberTransferUnits > 0 ∧ D.heightTransferUnit > 0 ∧
  D.overallMassTransferCoefficient > 0 ∧ D.interfacialArea > 0 ∧
  D.henrysLawConstant > 0 ∧ D.strippingFactor > 0

theorem design_equation_package_closed_from_evidence
  {C : AbsorptionColumn} {S : StrippingColumn} (D : DesignEquationPackage C S) (E : DesignEquationEvidence D) :
  DesignEquationPackageClosed D := by
  rcases E with ⟨h1, h2, h3, h4, h5, h6⟩
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 (And.intro h5 h6))))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse