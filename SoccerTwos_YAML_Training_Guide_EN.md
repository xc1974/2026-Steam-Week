# SoccerTwos YAML Configuration Training Guide

[![ML-Agents](https://img.shields.io/badge/ML--Agents-v2.0-blue.svg)](https://github.com/Unity-Technologies/ml-agents)
[![Unity](https://img.shields.io/badge/Unity-2022.3+-green.svg)](https://unity.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-yellow.svg)](https://python.org/)

---

## Table of Contents
- [Introduction](#introduction)
- [Understanding the YAML Structure](#understanding-the-yaml-structure)
- [Key Parameters Explained](#key-parameters-explained)
- [Modification Examples](#modification-examples)
- [Training Commands](#training-commands)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

---

## Introduction

This guide teaches participants how to modify the `SoccerTwos.yaml` configuration file to customize AI training for soccer agents. By adjusting various parameters, you can control how the AI learns, how fast it learns, and how well it performs.

---

## Understanding the YAML Structure

### Original SoccerTwos.yaml Structure
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 1024
      buffer_size: 10240
      learning_rate: 0.0003
      beta: 0.01
      epsilon: 0.2
      lambd: 0.95
      num_epoch: 20
      learning_rate_schedule: linear
    network_settings:
      normalize: true
      hidden_units: 256
      num_layers: 2
      vis_encode_type: simple
    reward_signals:
      extrinsic:
        gamma: 0.99
        strength: 1.0
    keep_checkpoints: 5
    max_steps: 10000000
    time_horizon: 1000
    summary_freq: 10000
    threaded: true
```

### Structure Breakdown
- **behaviors**: Defines the agent behavior configuration
- **SoccerTwos**: The behavior name (must match Unity scene)
- **trainer_type**: Algorithm used (PPO, SAC, etc.)
- **hyperparameters**: Core training parameters
- **network_settings**: Neural network architecture
- **reward_signals**: Reward configuration
- **Other settings**: Training control parameters

---

## Key Parameters Explained

### 1. Hyperparameters

| Parameter | Default Value | Purpose | Impact |
|-----------|---------------|---------|---------|
| `batch_size` | 1024 | Number of experiences per update | Larger = more stable, slower |
| `learning_rate` | 0.0003 | How fast the AI learns | Higher = faster learning, less stable |
| `beta` | 0.01 | Entropy regularization | Higher = more exploration |
| `epsilon` | 0.2 | PPO clipping parameter | Controls policy updates |
| `num_epoch` | 20 | Training epochs per update | More = better learning, slower |

### 2. Network Settings

| Parameter | Default Value | Purpose | Impact |
|-----------|---------------|---------|---------|
| `hidden_units` | 256 | Network width | Larger = more capacity |
| `num_layers` | 2 | Network depth | Deeper = more complex patterns |
| `normalize` | true | Input normalization | Helps training stability |

### 3. Training Control

| Parameter | Default Value | Purpose | Impact |
|-----------|---------------|---------|---------|
| `max_steps` | 10000000 | Total training steps | More = longer training |
| `time_horizon` | 1000 | Episode length | Longer = more context |
| `keep_checkpoints` | 5 | Saved model versions | More = more backup points |

---

## Modification Examples

### Example 1: Faster Learning
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 512          # Reduced for faster updates
      learning_rate: 0.001     # Increased learning rate
      num_epoch: 10            # Reduced epochs
    network_settings:
      hidden_units: 128        # Smaller network
      num_layers: 2
    max_steps: 5000000         # Shorter training
```

### Example 2: More Stable Training
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 2048         # Larger batch size
      learning_rate: 0.0001    # Lower learning rate
      beta: 0.005              # Less exploration
      num_epoch: 30            # More epochs
    network_settings:
      hidden_units: 512        # Larger network
      num_layers: 3            # Deeper network
    max_steps: 20000000         # Longer training
```

### Example 3: High Exploration
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      beta: 0.05               # High entropy
      epsilon: 0.3             # More policy variation
      learning_rate: 0.0005    # Moderate learning rate
    network_settings:
      hidden_units: 256
      num_layers: 2
```

### Example 4: Quick Experiment
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 256
      learning_rate: 0.002
      num_epoch: 5
    network_settings:
      hidden_units: 64
      num_layers: 1
    max_steps: 1000000          # Very short training
    summary_freq: 5000          # More frequent updates
```

---

## Training Commands

### Basic Training Command
```bash
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=my_soccer_training
```

### Training with Custom Configuration
```bash
# Create your custom config file
cp config/ppo/SoccerTwos.yaml config/ppo/SoccerTwos_custom.yaml

# Edit the custom file with your modifications
# Then train with:
mlagents-learn config/ppo/SoccerTwos_custom.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=custom_training
```

### Training with Different Scenes
```bash
# Train on Striker vs Goalkeeper scene
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/StrikersVsGoalie.unity --run-id=striker_vs_goalie

# Train on 2v2 scene
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_2v2
```

### Advanced Training Options
```bash
# Resume training from checkpoint
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=resumed_training --resume

# Force overwrite existing results
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=new_training --force

# Train with multiple environments
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --num-envs=4 --run-id=multi_env_training
```

---

## Best Practices

### 1. Parameter Adjustment Guidelines

**For Beginners**:
- Start with default values
- Make small changes (10-20% adjustments)
- Test one parameter at a time
- Keep detailed logs of changes

**For Advanced Users**:
- Experiment with different combinations
- Use curriculum learning for complex tasks
- Implement self-play for competitive scenarios
- Monitor training metrics closely

### 2. Common Parameter Combinations

**Fast Training**:
```yaml
batch_size: 512
learning_rate: 0.001
num_epoch: 10
max_steps: 5000000
```

**Stable Training**:
```yaml
batch_size: 2048
learning_rate: 0.0001
num_epoch: 30
max_steps: 20000000
```

**High Exploration**:
```yaml
beta: 0.05
epsilon: 0.3
learning_rate: 0.0005
```

### 3. Monitoring Training

```bash
# Use TensorBoard to monitor training
tensorboard --logdir=results/my_soccer_training

# Key metrics to watch:
# - Cumulative Reward: Should increase over time
# - Policy Loss: Should decrease and stabilize
# - Value Loss: Should decrease
# - Entropy: Should decrease as agent learns
```

---

## Troubleshooting

### Common Issues and Solutions

**1. Training Not Starting**
- **Problem**: Command fails or hangs
- **Solutions**:
  - Check Unity scene is open and Play button pressed
  - Verify YAML syntax is correct
  - Ensure behavior name matches Unity scene

**2. Poor Performance**
- **Problem**: Agent doesn't learn or performs badly
- **Solutions**:
  - Increase `learning_rate` (try 0.001)
  - Increase `batch_size` (try 2048)
  - Increase `max_steps` (try 20000000)
  - Check reward function in Unity

**3. Training Too Slow**
- **Problem**: Training takes too long
- **Solutions**:
  - Reduce `batch_size` (try 512)
  - Reduce `num_epoch` (try 10)
  - Reduce `max_steps` for testing
  - Use smaller network (`hidden_units: 128`)

**4. Unstable Training**
- **Problem**: Loss curves are erratic
- **Solutions**:
  - Reduce `learning_rate` (try 0.0001)
  - Increase `batch_size` (try 2048)
  - Increase `beta` for more exploration
  - Check for reward spikes in Unity

**5. Memory Issues**
- **Problem**: Out of memory errors
- **Solutions**:
  - Reduce `batch_size`
  - Reduce `buffer_size`
  - Use smaller network
  - Close other applications

---

## Step-by-Step Workshop Guide

### Workshop Session 1: Basic Modifications

**Objective**: Learn to modify basic parameters

**Steps**:
1. **Copy the original file**:
   ```bash
   cp config/ppo/SoccerTwos.yaml config/ppo/SoccerTwos_workshop.yaml
   ```

2. **Make your first modification**:
   - Change `learning_rate` from `0.0003` to `0.001`
   - Change `max_steps` from `10000000` to `2000000`

3. **Start training**:
   ```bash
   mlagents-learn config/ppo/SoccerTwos_workshop.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=workshop_1
   ```

4. **Monitor results**:
   ```bash
   tensorboard --logdir=results/workshop_1
   ```

### Workshop Session 2: Network Architecture

**Objective**: Experiment with different network sizes

**Steps**:
1. **Create network variations**:
   ```yaml
   # Small network
   hidden_units: 64
   num_layers: 1
   
   # Large network
   hidden_units: 512
   num_layers: 3
   ```

2. **Compare training results**
3. **Analyze performance differences**

### Workshop Session 3: Advanced Parameters

**Objective**: Explore advanced training options

**Steps**:
1. **Experiment with exploration**:
   ```yaml
   beta: 0.05  # High exploration
   epsilon: 0.3
   ```

2. **Try different batch sizes**
3. **Test learning rate schedules**

---

## Conclusion

This guide provides participants with the knowledge and tools needed to modify the `SoccerTwos.yaml` configuration file for custom AI training. Remember:

1. **Start Simple**: Begin with small modifications
2. **Test Systematically**: Change one parameter at a time
3. **Monitor Closely**: Use TensorBoard to track progress
4. **Document Changes**: Keep records of what works
5. **Experiment**: Try different combinations

With practice, you'll develop intuition for which parameters to adjust for different training goals.

---

*Happy Training!* 🚀⚽
