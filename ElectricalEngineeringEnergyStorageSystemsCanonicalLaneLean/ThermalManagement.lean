import HautevilleHouse.ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.StateOfChargeEstimation

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure ThermalManagementPackage {B : BatteryModelPackage} {S : StateOfChargeEstimationPackage B} where
  coolingSystem : Type u
  temperatureLimits : Prop
  thermalRunawayPrevention : Prop
  heatDissipationModel : Prop

structure ThermalManagementEvidence {B : BatteryModelPackage} {S : StateOfChargeEstimationPackage B} (T : ThermalManagementPackage B S) where
  temperatureLimitsClosed : T.temperatureLimits
  thermalRunawayPreventionClosed : T.thermalRunawayPrevention
  heatDissipationModelClosed : T.heatDissipationModel

def ThermalManagementClosed {B : BatteryModelPackage} {S : StateOfChargeEstimationPackage B} (T : ThermalManagementPackage B S) : Prop :=
  T.temperatureLimits ∧ T.thermalRunawayPrevention ∧ T.heatDissipationModel

theorem thermal_management_closed_from_evidence {B : BatteryModelPackage} {S : StateOfChargeEstimationPackage B} (T : ThermalManagementPackage B S) (E : ThermalManagementEvidence T) : ThermalManagementClosed T :=
  And.intro E.temperatureLimitsClosed (And.intro E.thermalRunawayPreventionClosed E.heatDissipationModelClosed)

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse