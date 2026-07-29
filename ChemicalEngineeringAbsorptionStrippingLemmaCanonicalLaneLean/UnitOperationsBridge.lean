import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure UnitOperationsBridge (A : AdmissibleClass) where
  massTransferValid : Prop
  operatingLineValid : Prop
  kremserValid : Prop
  packingValid : Prop
  bridgeClosed : Prop

structure UnitOperationsEvidence (A : AdmissibleClass) (br : UnitOperationsBridge A) where
  massTransferEvidence : MassTransferEvidence A (AbsorptionColumn A)
  operatingLineEvidence : OperatingLineEvidence A (OperatingLineData A)
  kremserEvidence : KremserEvidence A (KremserParameters A)
  packingEvidence : PackedColumnEvidence A (PackedColumn A)

def UnitOperationsClosed (A : AdmissibleClass) (br : UnitOperationsBridge A) : Prop :=
  AbsorptionColumnClosed A (AbsorptionColumn A) ∧
  OperatingLineClosed A (OperatingLineData A) ∧
  KremserClosed A (KremserParameters A) ∧
  PackedColumnClosed A (PackedColumn A)

theorem unit_operations_closed_from_evidence (A : AdmissibleClass) (br : UnitOperationsBridge A)
    (ev : UnitOperationsEvidence A br) : UnitOperationsClosed A br := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact mass_transfer_evidence_implies_closed A (AbsorptionColumn A) ev.massTransferEvidence
  · exact operating_line_closed_from_evidence A (OperatingLineData A) ev.operatingLineEvidence
  · exact kremser_closed_from_evidence A (KremserParameters A) ev.kremserEvidence
  · exact packed_column_closed_from_evidence A (PackedColumn A) ev.packingEvidence

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse