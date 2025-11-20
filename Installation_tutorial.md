# Unity ML-Agents Windows Tutorial (2024/2025)

A step-by-step guide to setting up Unity Machine Learning Agents on Windows and building the "RollerBall" Hello World project.

---

## 📋 Prerequisites

- Unity 2022.3 (LTS) or 2023.2+: Install via Unity Hub.  
- Python 3.10.x: Download Python 3.10.12 (Ensure you check "Add to PATH" during installation).  
- Git: (Optional) For cloning this repo.

---

## 🚀 Quick Install (Automated)

If you have installed Python 3.10 and added it to your PATH, you can use the included batch file to set up your Python environment automatically.

1. Download `setup_env.bat` from this repository.  
2. Place it in the folder where you want your ML-Agents environment to live.  
3. Double-click `setup_env.bat`.  
4. Wait for the installation to complete.

To use the environment later for training:

1. Open Command Prompt in that folder.  
2. Run:
   ```
   ml-agents-env\Scripts\activate
   ```

---

## 🛠️ Manual Installation

If you prefer to install manually via Command Prompt:

```bash
python -m venv ml-agents-env
ml-agents-env\Scripts\activate
pip install torch torchvision torchaudio
pip install mlagents
```

---

## 🎮 Unity Setup: The "RollerBall"

### 1. Package Installation

1. Open Unity.  
2. Go to `Window > Package Manager`.  
3. Click the `+` (top left) > `Add package by name...`.  
4. Type `com.unity.ml-agents` and click `Add`.

### 2. Scene Setup

- Floor: Create a Plane at position `(0, 0, 0)`, Scale `(1, 1, 1)`.  
- Target: Create a Cube at `(3, 0.5, 3)`.  
- Agent: Create a Sphere at `(0, 0.5, 0)`. Add a `Rigidbody` component.

### 3. The Agent Script

Create `RollerAgent.cs` and attach it to the Agent Sphere:

```csharp
using UnityEngine;
using Unity.MLAgents;
using Unity.MLAgents.Sensors;
using Unity.MLAgents.Actuators;

public class RollerAgent : Agent
{
    Rigidbody rBody;
    public Transform Target;
    public float forceMultiplier = 10;

    void Start()
    {
        rBody = GetComponent<Rigidbody>();
    }

    public override void OnEpisodeBegin()
    {
        // Reset Agent if it fell
        if (this.transform.localPosition.y < 0)
        {
            this.rBody.angularVelocity = Vector3.zero;
            this.rBody.linearVelocity = Vector3.zero;
            this.transform.localPosition = new Vector3(0, 0.5f, 0);
        }

        // Move Target to random position
        Target.localPosition = new Vector3(Random.value * 8 - 4, 0.5f, Random.value * 8 - 4);
    }

    public override void CollectObservations(VectorSensor sensor)
    {
        sensor.AddObservation(Target.localPosition); // 3 floats
        sensor.AddObservation(this.transform.localPosition); // 3 floats
        sensor.AddObservation(rBody.linearVelocity.x); // 1 float
        sensor.AddObservation(rBody.linearVelocity.z); // 1 float
    }

    public override void OnActionReceived(ActionBuffers actionBuffers)
    {
        Vector3 controlSignal = Vector3.zero;
        controlSignal.x = actionBuffers.ContinuousActions[0];
        controlSignal.z = actionBuffers.ContinuousActions[1];
        rBody.AddForce(controlSignal * forceMultiplier);

        float distanceToTarget = Vector3.Distance(this.transform.localPosition, Target.localPosition);

        if (distanceToTarget < 1.42f)
        {
            SetReward(1.0f);
            EndEpisode();
        }
        else if (this.transform.localPosition.y < 0)
        {
            EndEpisode();
        }
    }

    public override void Heuristic(in ActionBuffers actionsOut)
    {
        var continuousActionsOut = actionsOut.ContinuousActions;
        continuousActionsOut[0] = Input.GetAxis("Horizontal");
        continuousActionsOut[1] = Input.GetAxis("Vertical");
    }
}
```

### 4. Component Configuration

On the Agent Sphere:

- Behavior Parameters:
  - Name: `RollerBall`  
  - Vector Observation Space Size: `8`  
  - Continuous Actions: `2`  
- Decision Requester:
  - Decision Period: `5`

---

## 🧠 Training

1. Create a folder named `config` in your project root.  
2. Create `rollerball_config.yaml` with the following content:

```yaml
behaviors:
  RollerBall:
    trainer_type: ppo
    hyperparameters:
      batch_size: 10
      buffer_size: 100
      learning_rate: 3.0e-4
      beta: 5.0e-4
      epsilon: 0.2
      lambd: 0.99
      num_epoch: 3
      learning_rate_schedule: linear
    network_settings:
      normalize: false
      hidden_units: 128
      num_layers: 2
    reward_signals:
      extrinsic:
        gamma: 0.99
        strength: 1.0
    max_steps: 500000
    time_horizon: 64
    summary_freq: 10000
```

3. Run this command in your Unity Project folder:

```
mlagents-learn config/rollerball_config.yaml --run-id=RollerBall-1
```

4. Press Play in Unity when prompted.

---

If you want, I can:
- Provide a ready-to-save .md file (I can paste the content so you can copy it).
- Generate the `setup_env.bat` content and `rollerball_config.yaml` file text as downloadable snippets.
- Add troubleshooting tips for common Windows issues (CUDA, torch installation, PATH problems).
