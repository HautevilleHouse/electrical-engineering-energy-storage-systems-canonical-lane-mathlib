import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.ChargeDischargeCycle

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure ThermalDynamicsPackage {G : BatteryChemistryPackage}
    {C : ChargeDischargeCyclePackage G} where
  internalTemperature : Prop
  heatGeneration : Prop
  coolingMechanism : Prop
  thermalRunawayCondition : Prop

structure ThermalDynamicsEvidence {G : BatteryChemistryPackage}
    {C : ChargeDischargeCyclePackage G} (T : ThermalDynamicsPackage G C) where
  internalTemperatureClosed : T.internalTemperature
  heatGenerationClosed : T.heatGeneration
  coolingMechanismClosed : T.coolingMechanism
  thermalRunawayConditionClosed : T.thermalRunawayCondition

def ThermalDynamicsClosed {G : BatteryChemistryPackage}
    {C : ChargeDischargeCyclePackage G} (T : ThermalDynamicsPackage G C) : Prop :=
  T.internalTemperature ∧ T.heatGeneration ∧ T.coolingMechanism ∧ T.thermalRunawayCondition

theorem thermal_dynamics_closed_from_evidence
    {G : BatteryChemistryPackage} {C : ChargeDischargeCyclePackage G}
    (T : ThermalDynamicsPackage G C) (E : ThermalDynamicsEvidence T) :
    ThermalDynamicsClosed T := by
  exact And.intro E.internalTemperatureClosed
    (And.intro E.heatGenerationClosed
      (And.intro E.coolingMechanismClosed E.thermalRunawayConditionClosed))

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse