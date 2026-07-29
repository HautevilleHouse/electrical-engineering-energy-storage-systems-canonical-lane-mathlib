import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.BatteryChemistry

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure ChargeDischargeCyclePackage {G : BatteryChemistryPackage} where
  cycleNumber : Nat
  chargeCurrentProfile : Prop
  dischargeCurrentProfile : Prop
  coulombicEfficiency : Prop
  depthOfDischarge : Prop

structure ChargeDischargeCycleEvidence {G : BatteryChemistryPackage}
    (C : ChargeDischargeCyclePackage G) where
  chargeCurrentProfileClosed : C.chargeCurrentProfile
  dischargeCurrentProfileClosed : C.dischargeCurrentProfile
  coulombicEfficiencyClosed : C.coulombicEfficiency
  depthOfDischargeClosed : C.depthOfDischarge

def ChargeDischargeCycleClosed {G : BatteryChemistryPackage}
    (C : ChargeDischargeCyclePackage G) : Prop :=
  C.chargeCurrentProfile ∧ C.dischargeCurrentProfile ∧
  C.coulombicEfficiency ∧ C.depthOfDischarge

theorem charge_discharge_cycle_closed_from_evidence
    {G : BatteryChemistryPackage} (C : ChargeDischargeCyclePackage G)
    (E : ChargeDischargeCycleEvidence C) : ChargeDischargeCycleClosed C := by
  exact And.intro E.chargeCurrentProfileClosed
    (And.intro E.dischargeCurrentProfileClosed
      (And.intro E.coulombicEfficiencyClosed E.depthOfDischargeClosed))

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse