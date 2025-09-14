# ML-Agents Soccer Agent Training and Competition Guide

[![ML-Agents](https://img.shields.io/badge/ML--Agents-v2.0-blue.svg)](https://github.com/Unity-Technologies/ml-agents)
[![Unity](https://img.shields.io/badge/Unity-2022.3+-green.svg)](https://unity.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-yellow.svg)](https://python.org/)

---

## Table of Contents
- [Overview](#overview)
- [Environment Setup](#environment-setup)
- [Training Configuration](#training-configuration)
- [Model Training Process](#model-training-process)
- [Importing Trained Models](#importing-trained-models)
- [Setting Up Competitions](#setting-up-competitions)
- [Advanced Configuration](#advanced-configuration)
- [Troubleshooting](#troubleshooting)

---

## Overview

This guide provides a comprehensive approach to training soccer agents using ML-Agents and setting up competitions between trained models. The ML-Agents toolkit includes a complete soccer environment with 2v2 matches and striker vs goalkeeper scenarios.

---

## Environment Setup

### 1. Project Structure
The soccer environment is located in:
```
Project/Assets/ML-Agents/Examples/Soccer/
├── Scenes/
│   ├── SoccerTwos.unity          # 2v2 soccer match
│   └── StrikersVsGoalie.unity    # Striker vs Goalkeeper training
├── Prefabs/                      # Agent prefabs
├── Scripts/                      # Soccer-specific scripts
└── TFModels/                     # Pre-trained models (.onnx files)
```

### 2. Available Scenes
- **SoccerTwos.unity**: Main 2v2 competition scene
- **StrikersVsGoalie.unity**: Training scene for specific roles

---

## Training Configuration

### 1. Configuration Files
The project includes optimized training configurations:

**Standard Configuration** (`config/ppo/SoccerTwos.yaml`):
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 1024
      learning_rate: 0.0003
      hidden_units: 256
      num_layers: 2
    max_steps: 10000000
```

**Advanced Configuration** (`config/ppo/soccer_custom.yaml`):
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 2048          # Increased batch size
      learning_rate: 0.0002     # Lower learning rate for stability
      hidden_units: 512         # Larger network
      num_layers: 3             # Deeper network
    max_steps: 20000000         # More training steps
```

### 2. Key Parameters
- **batch_size**: Number of experiences used per update
- **learning_rate**: How fast the agent learns
- **hidden_units**: Network capacity
- **num_layers**: Network depth
- **max_steps**: Total training duration

---

## Model Training Process

### 1. Starting Training
Use the `mlagents-learn` command to start training:

```bash
# Basic training command
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_training

# Advanced training with optimized settings
mlagents-learn config/ppo/soccer_custom.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_advanced_training
```

### 2. Training Parameters
- `--env`: Path to Unity executable or scene
- `--run-id`: Unique identifier for this training run
- `--resume`: Resume from previous checkpoint
- `--force`: Overwrite existing results

### 3. Monitoring Training
```bash
# Use TensorBoard to monitor training progress
tensorboard --logdir=results/soccer_training
```

### 4. Training Outputs
After training, you'll find:
```
results/soccer_training/
├── models/
│   ├── SoccerTwos.onnx          # Final trained model
│   └── SoccerTwos_XXXX.onnx     # Training checkpoints
├── summaries/                   # Training metrics
└── run_logs/                    # Training logs
```

---

## Importing Trained Models

### 1. Locate the Trained Model
Find your trained model in:
```
results/[run-id]/models/SoccerTwos.onnx
```

### 2. Import into Unity Scene
1. **Open Unity Scene**:
   - Open `Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity`

2. **Select Agent Prefab**:
   - Navigate to `Assets/ML-Agents/Examples/Soccer/Prefabs/`
   - Select the appropriate agent prefab (e.g., `AgentStriker`, `AgentGoalie`)

3. **Configure Behavior Parameters**:
   - In the Inspector, find the `Behavior Parameters` component
   - Drag the trained `.onnx` model file to the `Model` field
   - Set `Behavior Type` to `Inference Only`
   - Set `Inference Device` to `CPU` (recommended) or `GPU`

4. **Verify Configuration**:
   - Ensure `Behavior Name` matches the training configuration
   - Check that all agents have the correct model assigned

### 3. Model Assignment Example
```csharp
// Each agent should have:
BehaviorParameters behaviorParams = GetComponent<BehaviorParameters>();
behaviorParams.Model = trainedModel;  // Your .onnx file
behaviorParams.BehaviorType = BehaviorType.InferenceOnly;
behaviorParams.InferenceDevice = InferenceDevice.CPU;
```

---

## Setting Up Competitions

### 1. Competition Scenarios
You can set up various competition scenarios:

**Same Model Competition**:
- All agents use the same trained model
- Tests consistency and performance

**Different Model Competition**:
- Agents use models from different training runs
- Compares different training strategies

**Mixed Strategy Competition**:
- Some agents use striker models, others use goalkeeper models
- Tests role specialization

### 2. Creating Competition Scenes
1. **Duplicate Existing Scene**:
   ```bash
   # Copy SoccerTwos.unity to SoccerCompetition.unity
   ```

2. **Configure Different Agents**:
   - Assign different models to different agents
   - Modify agent behaviors and strategies

3. **Set Up Monitoring**:
   - Use `Monitor.cs` for real-time statistics
   - Track goals, performance metrics, and game statistics

### 3. Competition Configuration Example
```csharp
// In SoccerEnvController.cs
public class SoccerCompetitionController : SoccerEnvController
{
    [Header("Competition Settings")]
    public bool enableDifferentModels = true;
    public Model[] strikerModels;
    public Model[] goalkeeperModels;
    
    void Start()
    {
        base.Start();
        if (enableDifferentModels)
        {
            AssignDifferentModels();
        }
    }
    
    void AssignDifferentModels()
    {
        // Assign different models to different agents
        for (int i = 0; i < AgentsList.Count; i++)
        {
            var agent = AgentsList[i].Agent;
            if (agent.position == Position.Striker)
            {
                agent.SetModel(strikerModels[i % strikerModels.Length]);
            }
            else if (agent.position == Position.Goalie)
            {
                agent.SetModel(goalkeeperModels[i % goalkeeperModels.Length]);
            }
        }
    }
}
```

---

## Advanced Configuration

### 1. Self-Play Training
Enable self-play for competitive training:

```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    self_play:
      save_steps: 50000
      team_change: 200000
      swap_steps: 2000
      window: 10
```

### 2. Curriculum Learning
Implement curriculum learning for progressive difficulty:

```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    curriculum:
      - name: "Easy"
        value: 0.0
        threshold: 0.1
        min_lesson_length: 100000
      - name: "Medium"
        value: 0.5
        threshold: 0.3
        min_lesson_length: 100000
      - name: "Hard"
        value: 1.0
        threshold: 0.5
        min_lesson_length: 100000
```

### 3. Reward Signal Configuration
Customize reward signals for better training:

```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    reward_signals:
      extrinsic:
        gamma: 0.99
        strength: 1.0
      curiosity:
        strength: 0.1
        gamma: 0.99
        encoding_size: 128
```

---

## Troubleshooting

### Common Issues and Solutions

**1. Model Not Working**
- **Problem**: Agent doesn't move or behaves incorrectly
- **Solution**: 
  - Verify model file is correctly assigned
  - Check Behavior Name matches training configuration
  - Ensure Inference Device is set correctly

**2. Training Not Converging**
- **Problem**: Agent performance doesn't improve
- **Solution**:
  - Reduce learning rate
  - Increase batch size
  - Adjust reward function
  - Check observation space

**3. Performance Issues**
- **Problem**: Slow inference or training
- **Solution**:
  - Use CPU inference instead of GPU
  - Reduce network size
  - Optimize Unity scene

**4. Memory Issues**
- **Problem**: Out of memory during training
- **Solution**:
  - Reduce batch size
  - Decrease buffer size
  - Use fewer concurrent environments

---

## Quick Start Checklist

- [ ] Install ML-Agents toolkit
- [ ] Open Unity project
- [ ] Navigate to soccer scenes
- [ ] Choose training configuration
- [ ] Start training with `mlagents-learn`
- [ ] Monitor training with TensorBoard
- [ ] Import trained model to Unity
- [ ] Configure agent behavior parameters
- [ ] Set up competition scene
- [ ] Test and iterate

---

## Conclusion

This guide provides a comprehensive approach to training soccer agents and setting up competitions using ML-Agents. The key to success is:

1. **Proper Configuration**: Use optimized training parameters
2. **Patient Training**: Allow sufficient training time
3. **Careful Model Import**: Ensure correct model assignment
4. **Systematic Testing**: Test different scenarios and configurations

With these steps, you can create competitive soccer agents that can play against each other in exciting matches.

**Happy Training!** 🚀⚽

---

*For more information, visit the [ML-Agents Documentation](https://github.com/Unity-Technologies/ml-agents)*
