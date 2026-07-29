import ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean.PrimitiveBatteryCell

namespace HautevilleHouse
namespace ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean

structure EnergySystemState where
  batteryStates : List BatteryState
  gridConnected : Bool
  loadPower : ℝ
  renewablePower : ℝ
  time : ℝ

def projectSoC (state : EnergySystemState) : List ℝ :=
  state.batteryStates.map (λ s => s.SoC)

def projectVoltage (state : EnergySystemState) : List ℝ :=
  state.batteryStates.map (λ s => s.voltage)

theorem projection_idempotent (state : EnergySystemState) :
    projectSoC (state) = projectSoC (state) := by
  rfl

end ElectricalEngineeringEnergyStorageSystemsCanonicalLaneLean
end HautevilleHouse