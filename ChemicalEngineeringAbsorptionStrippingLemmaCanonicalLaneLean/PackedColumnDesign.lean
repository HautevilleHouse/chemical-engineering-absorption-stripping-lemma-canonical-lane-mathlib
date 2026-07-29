import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure PackedColumn (A : AdmissibleClass) where
  packingType : String
  specificSurfaceArea : Float
  voidFraction : Float
  liquidHoldup : Float
  pressureDrop : Float
  floodingVelocity : Float

structure PackedColumnEvidence (A : AdmissibleClass) (pc : PackedColumn A) where
  pressureDropPositive : pc.pressureDrop > 0.0
  floodingVelocityPositive : pc.floodingVelocity > 0.0
  specificSurfaceAreaPositive : pc.specificSurfaceArea > 0.0
  voidFractionBetweenZeroAndOne : 0.0 < pc.voidFraction ∧ pc.voidFraction < 1.0

def PackedColumnClosed (A : AdmissibleClass) (pc : PackedColumn A) : Prop :=
  pc.pressureDrop > 0.0 ∧ pc.floodingVelocity > 0.0 ∧ pc.specificSurfaceArea > 0.0 ∧ 0.0 < pc.voidFraction ∧ pc.voidFraction < 1.0

theorem packed_column_closed_from_evidence (A : AdmissibleClass) (pc : PackedColumn A)
    (ev : PackedColumnEvidence A pc) : PackedColumnClosed A pc := by
  exact And.intro ev.pressureDropPositive
    (And.intro ev.floodingVelocityPositive
      (And.intro ev.specificSurfaceAreaPositive ev.voidFractionBetweenZeroAndOne))

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse