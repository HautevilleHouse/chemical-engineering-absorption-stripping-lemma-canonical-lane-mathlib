import ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean

structure AbsorptionStrippingProofObligations where
  massTransferPackingClosed : Prop
  equilibriumStageModelClosed : Prop
  columnDesignClosed : Prop
  absorptionStrippingEndpoint : Prop

structure AbsorptionStrippingProofEvidence (R : AbsorptionStrippingProofObligations) where
  massTransferPackingClosedTerm : R.massTransferPackingClosed
  equilibriumStageModelClosedTerm : R.equilibriumStageModelClosed
  columnDesignClosedTerm : R.columnDesignClosed
  absorptionStrippingEndpointClosedTerm : R.absorptionStrippingEndpoint

def AbsorptionStrippingProofClosed (R : AbsorptionStrippingProofObligations) : Prop :=
  R.massTransferPackingClosed ∧ R.equilibriumStageModelClosed ∧ R.columnDesignClosed ∧ R.absorptionStrippingEndpoint

theorem absorption_stripping_proof_closed_from_evidence (R : AbsorptionStrippingProofObligations)
    (E : AbsorptionStrippingProofEvidence R) : AbsorptionStrippingProofClosed R := by
  exact And.intro E.massTransferPackingClosedTerm (And.intro E.equilibriumStageModelClosedTerm (And.intro E.columnDesignClosedTerm E.absorptionStrippingEndpointClosedTerm))

theorem absorption_stripping_endgame_supplies_constrained_closure (A : AdmissibleClass)
    (R : AbsorptionStrippingProofObligations) (E : AbsorptionStrippingProofEvidence R) :
    ConstrainedAbsorptionStrippingClosure A := by
  exact constrained_absorption_stripping_endgame A

end ChemicalEngineeringAbsorptionStrippingLemmaCanonicalLaneLean
end HautevilleHouse