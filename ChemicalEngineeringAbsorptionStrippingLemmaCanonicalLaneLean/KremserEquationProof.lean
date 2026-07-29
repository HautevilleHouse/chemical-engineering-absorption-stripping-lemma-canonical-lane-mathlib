import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.AbsorptionColumnEquilibrium
import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.StrippingColumnMassBalance

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure KremserEquationPackage (A : AbsorptionColumnPackage) (S : StrippingColumnPackage) where
  absorptionFactor : ℝ
  numberStages : ℕ
  absorptionEfficiency : ℝ
  removalFraction : ℝ

structure KremserEvidence {A : AbsorptionColumnPackage} {S : StrippingColumnPackage} (K : KremserEquationPackage A S) where
  absorptionFactorMatches : K.absorptionFactor = A.absorptionFactor
  efficiencyFormula : K.absorptionEfficiency = (K.absorptionFactor ^ (K.numberStages : ℕ) - 1) / (K.absorptionFactor ^ (K.numberStages : ℕ) - 1 / K.absorptionFactor)
  removalFractionNonneg : K.removalFraction ≥ 0
  removalFractionLeOne : K.removalFraction ≤ 1

def KremserEquationClosed {A : AbsorptionColumnPackage} {S : StrippingColumnPackage} (K : KremserEquationPackage A S) : Prop :=
  K.absorptionFactor = A.absorptionFactor ∧
  K.absorptionEfficiency = (K.absorptionFactor ^ (K.numberStages : ℕ) - 1) / (K.absorptionFactor ^ (K.numberStages : ℕ) - 1 / K.absorptionFactor) ∧
  K.removalFraction ≥ 0 ∧ K.removalFraction ≤ 1

theorem kremser_equation_closed_from_evidence {A : AbsorptionColumnPackage} {S : StrippingColumnPackage} (K : KremserEquationPackage A S) (E : KremserEvidence K) :
    KremserEquationClosed K := by
  exact And.intro E.absorptionFactorMatches (And.intro E.efficiencyFormula (And.intro E.removalFractionNonneg E.removalFractionLeOne))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse
