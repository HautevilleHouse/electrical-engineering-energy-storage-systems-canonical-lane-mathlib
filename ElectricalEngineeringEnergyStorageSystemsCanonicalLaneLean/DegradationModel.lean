import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.ThermalDynamics

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure DegradationModelPackage {G : BatteryChemistryPackage}
    {C : ChargeDischargeCyclePackage G} {T : ThermalDynamicsPackage G C} where
  capacityFadeRate : Prop
  internalResistanceGrowth : Prop
  cycleLifePrediction : Prop
  stateOfHealth : Prop

structure DegradationModelEvidence {G : BatteryChemistryPackage}
    {C : ChargeDischargeCyclePackage G} {T : ThermalDynamicsPackage G C}
    (D : DegradationModelPackage G C T) where
  capacityFadeRateClosed : D.capacityFadeRate
  internalResistanceGrowthClosed : D.internalResistanceGrowth
  cycleLifePredictionClosed : D.cycleLifePrediction
  stateOfHealthClosed : D.stateOfHealth

def DegradationModelClosed {G : BatteryChemistryPackage}
    {C : ChargeDischargeCyclePackage G} {T : ThermalDynamicsPackage G C}
    (D : DegradationModelPackage G C T) : Prop :=
  D.capacityFadeRate ∧ D.internalResistanceGrowth ∧
  D.cycleLifePrediction ∧ D.stateOfHealth

theorem degradation_model_closed_from_evidence
    {G : BatteryChemistryPackage} {C : ChargeDischargeCyclePackage G}
    {T : ThermalDynamicsPackage G C} (D : DegradationModelPackage G C T)
    (E : DegradationModelEvidence D) : DegradationModelClosed D := by
  exact And.intro E.capacityFadeRateClosed
    (And.intro E.internalResistanceGrowthClosed
      (And.intro E.cycleLifePredictionClosed E.stateOfHealthClosed))

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse