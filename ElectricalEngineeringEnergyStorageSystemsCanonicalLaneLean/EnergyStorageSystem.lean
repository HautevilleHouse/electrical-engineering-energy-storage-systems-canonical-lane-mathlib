import HautevilleHouse.ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.ThermalManagement

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure EnergyStorageSystemPackage {B : BatteryModelPackage} {S : StateOfChargeEstimationPackage B} {D : DegradationModelPackage B} {T : ThermalManagementPackage B S} where
  batteryModel : B
  stateOfCharge : S
  degradation : D
  thermalManagement : T
  systemIntegrationValid : Prop
  safetyCompliance : Prop

structure EnergyStorageSystemEvidence {B : BatteryModelPackage} {S : StateOfChargeEstimationPackage B} {D : DegradationModelPackage B} {T : ThermalManagementPackage B S} (E : EnergyStorageSystemPackage B S D T) where
  systemIntegrationValidClosed : E.systemIntegrationValid
  safetyComplianceClosed : E.safetyCompliance

def EnergyStorageSystemClosed {B : BatteryModelPackage} {S : StateOfChargeEstimationPackage B} {D : DegradationModelPackage B} {T : ThermalManagementPackage B S} (E : EnergyStorageSystemPackage B S D T) : Prop :=
  E.systemIntegrationValid ∧ E.safetyCompliance

theorem energy_storage_system_closed_from_evidence {B : BatteryModelPackage} {S : StateOfChargeEstimationPackage B} {D : DegradationModelPackage B} {T : ThermalManagementPackage B S} (E : EnergyStorageSystemPackage B S D T) (Ev : EnergyStorageSystemEvidence E) : EnergyStorageSystemClosed E :=
  And.intro Ev.systemIntegrationValidClosed Ev.safetyComplianceClosed

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse