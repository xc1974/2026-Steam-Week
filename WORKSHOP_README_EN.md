# ML-Agents Soccer Training Workshop

[![ML-Agents](https://img.shields.io/badge/ML--Agents-v2.0-blue.svg)](https://github.com/Unity-Technologies/ml-agents)
[![Unity](https://img.shields.io/badge/Unity-2022.3+-green.svg)](https://unity.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-yellow.svg)](https://python.org/)

---

## 📚 Workshop Overview

Welcome to the ML-Agents Soccer Training Workshop! This comprehensive workshop teaches participants how to train AI agents to play soccer using Unity's ML-Agents toolkit. You'll learn everything from basic configuration to advanced training techniques, and how to set up competitions between trained agents.

---

## 🎯 Learning Objectives

By the end of this workshop, participants will be able to:

- ✅ Understand ML-Agents architecture and soccer environment
- ✅ Modify YAML configuration files for custom training
- ✅ Train soccer agents using reinforcement learning
- ✅ Import trained models into Unity scenes
- ✅ Set up competitions between different AI agents
- ✅ Monitor and optimize training performance
- ✅ Troubleshoot common training issues

---

## 📖 Workshop Materials

### 1. Main Training Guide
**File**: [`ML-Agents_Soccer_Training_Guide_EN.md`](ML-Agents_Soccer_Training_Guide_EN.md)

**Description**: Comprehensive guide covering the complete ML-Agents soccer training workflow

**Topics Covered**:
- Environment setup and project structure
- Training configuration and hyperparameters
- Model training process with mlagents-learn
- Importing trained models to Unity
- Setting up competitions between agents
- Advanced configuration options
- Troubleshooting common issues

### 2. YAML Configuration Guide
**File**: [`SoccerTwos_YAML_Training_Guide_EN.md`](SoccerTwos_YAML_Training_Guide_EN.md)

**Description**: Detailed guide for modifying YAML configuration files

**Topics Covered**:
- Understanding YAML structure and parameters
- Key parameter explanations with impact analysis
- Practical modification examples
- Training commands and best practices
- Step-by-step workshop sessions
- Parameter tuning guidelines

---

## 🚀 Quick Start

#### Prerequisites
- Unity 2022.3 or later
- Python 3.8 or later
- ML-Agents toolkit installed
- Basic understanding of machine learning concepts

#### Installation Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/Unity-Technologies/ml-agents.git
   cd ml-agents
   ```

2. **Install ML-Agents**:
   ```bash
   pip install mlagents
   ```

3. **Open Unity project**:
   - Open Unity Hub
   - Add the `Project` folder
   - Open the project

4. **Navigate to soccer scenes**:
   - Go to `Assets/ML-Agents/Examples/Soccer/Scenes/`
   - Open `SoccerTwos.unity`

#### First Training Run
```bash
# Basic training command
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=my_first_training

# Monitor training progress
tensorboard --logdir=results/my_first_training
```
---

## 🛠️ Available Resources

### Configuration Files
- **`config/ppo/SoccerTwos.yaml`**: Standard soccer training configuration
- **`config/ppo/soccer_custom.yaml`**: Optimized configuration with enhanced parameters
- **`config/poca/SoccerTwos.yaml`**: POCA (multi-agent) training configuration

### Unity Scenes
- **`SoccerTwos.unity`**: Main 2v2 soccer competition scene
- **`StrikersVsGoalie.unity`**: Striker vs goalkeeper training scene

### Pre-trained Models
- **`TFModels/`**: Contains pre-trained .onnx model files
- **`results/`**: Training outputs and model checkpoints

### Documentation
- **`ML-Agents_Soccer_Training_Guide_EN.md`**: Complete training workflow
- **`SoccerTwos_YAML_Training_Guide_EN.md`**: YAML configuration guide
- **`docs/`**: Official ML-Agents documentation

---

## 🔧 Troubleshooting

#### Common Issues

**Training Not Starting**:
- Check Unity scene is open and Play button pressed
- Verify YAML syntax is correct
- Ensure behavior name matches Unity scene

**Poor Performance**:
- Increase `learning_rate` (try 0.001)
- Increase `batch_size` (try 2048)
- Check reward function in Unity

**Memory Issues**:
- Reduce `batch_size`
- Reduce `buffer_size`
- Use smaller network

---

## 📚 Additional Resources

#### Official Documentation
- [ML-Agents Documentation](https://github.com/Unity-Technologies/ml-agents)
- [Unity ML-Agents Toolkit](https://unity.com/products/machine-learning-agents)
- [Reinforcement Learning Basics](https://spinningup.openai.com/)

#### Community Resources
- [ML-Agents GitHub Repository](https://github.com/Unity-Technologies/ml-agents)
- [Unity Forums](https://forum.unity.com/forums/machine-learning-agents.453/)
- [Discord Community](https://discord.gg/5BT2mvC)

---

## 🎉 Conclusion

This workshop provides a comprehensive introduction to ML-Agents soccer training. Through hands-on exercises and detailed guides, participants will gain practical experience in training AI agents and setting up competitions. The skills learned here can be applied to other ML-Agents projects and extended to more complex scenarios.

**Happy Training!** 🚀⚽

---

*Last Updated: September 2025*

