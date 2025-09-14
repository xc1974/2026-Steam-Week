# ML-Agents Soccer Training Workshop
# ML-Agents 足球訓練工作坊

<div align="center">
  <h1>🏆 ML-Agents Soccer Training Workshop</h1>
  <h1>🏆 ML-Agents 足球訓練工作坊</h1>
  
  <p><strong>Choose your language / 選擇您的語言</strong></p>
  
  <a href="WORKSHOP_README_EN.md" style="display: inline-block; background-color: #007bff; color: white; padding: 15px 30px; margin: 10px; text-decoration: none; border-radius: 8px; font-weight: bold; font-size: 18px;">🇺🇸 English</a>
  
  <a href="WORKSHOP_README_ZH.md" style="display: inline-block; background-color: #28a745; color: white; padding: 15px 30px; margin: 10px; text-decoration: none; border-radius: 8px; font-weight: bold; font-size: 18px;">🇹🇼 繁體中文</a>
</div>

---

## 📚 Workshop Overview / 工作坊概述

Welcome to the ML-Agents Soccer Training Workshop! This comprehensive workshop teaches participants how to train AI agents to play soccer using Unity's ML-Agents toolkit.

歡迎來到ML-Agents足球訓練工作坊！這個綜合工作坊教導參與者如何使用Unity的ML-Agents工具包訓練AI智能體踢足球。

---

## 📖 Available Materials / 可用材料

### English Documentation / 英文文檔
- **[Workshop Overview](WORKSHOP_README_EN.md)** - Complete workshop guide
- **[Detailed Training Guide](ML-Agents_Soccer_Training_Guide_EN.md)** - Comprehensive training workflow
- **[YAML Configuration Guide](SoccerTwos_YAML_Training_Guide_EN.md)** - YAML modification guide

### 繁體中文文檔
- **[工作坊概述](WORKSHOP_README_ZH.md)** - 完整工作坊指南
- **[詳細訓練指南](ML-Agents_Soccer_Training_Guide_ZH.md)** - 綜合訓練工作流程
- **[YAML配置指南](SoccerTwos_YAML_Training_Guide_ZH.md)** - YAML修改指南

---

## 🎯 Learning Objectives / 學習目標

### English
By the end of this workshop, participants will be able to:
- ✅ Understand ML-Agents architecture and soccer environment
- ✅ Modify YAML configuration files for custom training
- ✅ Train soccer agents using reinforcement learning
- ✅ Import trained models into Unity scenes
- ✅ Set up competitions between different AI agents
- ✅ Monitor and optimize training performance
- ✅ Troubleshoot common training issues

### 繁體中文
在本次工作坊結束時，參與者將能夠：
- ✅ 理解ML-Agents架構和足球環境
- ✅ 修改YAML配置檔案進行自定義訓練
- ✅ 使用強化學習訓練足球智能體
- ✅ 將訓練模型導入Unity場景
- ✅ 設置不同AI智能體之間的比賽
- ✅ 監控和優化訓練性能
- ✅ 排除常見訓練問題

---

## 🚀 Quick Start / 快速開始

### Prerequisites / 先決條件
- Unity 2022.3 or later / Unity 2022.3 或更新版本
- Python 3.8 or later / Python 3.8 或更新版本
- ML-Agents toolkit installed / 已安裝ML-Agents工具包
- Basic understanding of machine learning concepts / 對機器學習概念的基本理解

### First Training Command / 第一次訓練命令
```bash
# English / 英文
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=my_first_training

# Monitor training progress / 監控訓練進度
tensorboard --logdir=results/my_first_training
```

---

## 📋 Workshop Schedule / 工作坊時間表

### Session 1: Introduction and Setup (60 minutes) / 第一節：介紹和設置（60分鐘）
- Overview of ML-Agents and soccer environment / ML-Agents和足球環境概述
- Project structure and navigation / 專案結構和導航
- Basic YAML configuration understanding / 基本YAML配置理解
- First training run / 第一次訓練運行

### Session 2: YAML Configuration Deep Dive (90 minutes) / 第二節：YAML配置深入探討（90分鐘）
- Parameter explanation and impact analysis / 參數說明和影響分析
- Hands-on YAML modification exercises / 實際YAML修改練習
- Different training strategies / 不同訓練策略
- Performance comparison / 性能比較

### Session 3: Advanced Training and Competition (90 minutes) / 第三節：進階訓練和比賽（90分鐘）
- Model import and Unity configuration / 模型導入和Unity配置
- Setting up competitions between agents / 設置智能體之間的比賽
- Monitoring and optimization / 監控和優化
- Troubleshooting and best practices / 故障排除和最佳實踐

---

## 🛠️ Available Resources / 可用資源

### Configuration Files / 配置檔案
- **`config/ppo/SoccerTwos.yaml`**: Standard soccer training configuration / 標準足球訓練配置
- **`config/ppo/soccer_custom.yaml`**: Optimized configuration with enhanced parameters / 增強參數的優化配置
- **`config/poca/SoccerTwos.yaml`**: POCA (multi-agent) training configuration / POCA（多智能體）訓練配置

### Unity Scenes / Unity場景
- **`SoccerTwos.unity`**: Main 2v2 soccer competition scene / 主要2v2足球比賽場景
- **`StrikersVsGoalie.unity`**: Striker vs goalkeeper training scene / 前鋒對守門員訓練場景

### Pre-trained Models / 預訓練模型
- **`TFModels/`**: Contains pre-trained .onnx model files / 包含預訓練的.onnx模型檔案
- **`results/`**: Training outputs and model checkpoints / 訓練輸出和模型檢查點

---

## 🎮 Workshop Exercises / 工作坊練習

### Exercise 1: Basic Parameter Modification / 練習1：基本參數修改
**Objective / 目標**: Learn to modify basic training parameters / 學習修改基本訓練參數
**Time / 時間**: 30 minutes / 30分鐘

### Exercise 2: Network Architecture Experiment / 練習2：網路架構實驗
**Objective / 目標**: Experiment with different network sizes / 實驗不同的網路大小
**Time / 時間**: 45 minutes / 45分鐘

### Exercise 3: Competition Setup / 練習3：比賽設置
**Objective / 目標**: Set up competitions between trained agents / 設置訓練智能體之間的比賽
**Time / 時間**: 60 minutes / 60分鐘

---

## 🔧 Troubleshooting / 故障排除

### Common Issues / 常見問題

**Training Not Starting / 訓練不開始**:
- Check Unity scene is open and Play button pressed / 檢查Unity場景是否打開並按下Play按鈕
- Verify YAML syntax is correct / 驗證YAML語法是否正確
- Ensure behavior name matches Unity scene / 確保行為名稱與Unity場景匹配

**Poor Performance / 性能差**:
- Increase `learning_rate` (try 0.001) / 增加 `learning_rate`（嘗試0.001）
- Increase `batch_size` (try 2048) / 增加 `batch_size`（嘗試2048）
- Check reward function in Unity / 檢查Unity中的獎勵函數

**Memory Issues / 記憶體問題**:
- Reduce `batch_size` / 減少 `batch_size`
- Reduce `buffer_size` / 減少 `buffer_size`
- Use smaller network / 使用更小的網路

---

## 📚 Additional Resources / 額外資源

### Official Documentation / 官方文檔
- [ML-Agents Documentation](https://github.com/Unity-Technologies/ml-agents)
- [Unity ML-Agents Toolkit](https://unity.com/products/machine-learning-agents)
- [Reinforcement Learning Basics](https://spinningup.openai.com/)

### Community Resources / 社群資源
- [ML-Agents GitHub Repository](https://github.com/Unity-Technologies/ml-agents)
- [Unity Forums](https://forum.unity.com/forums/machine-learning-agents.453/)
- [Discord Community](https://discord.gg/5BT2mvC)

---

## 🎉 Conclusion / 結論

This workshop provides a comprehensive introduction to ML-Agents soccer training. Through hands-on exercises and detailed guides, participants will gain practical experience in training AI agents and setting up competitions.

本工作坊提供了ML-Agents足球訓練的綜合介紹。通過實際練習和詳細指南，參與者將獲得訓練AI智能體和設置比賽的實踐經驗。

**Happy Training! / 訓練愉快！** 🚀⚽

---

<div align="center">
  <p><strong>Last Updated: september 2025 / 最後更新：2025年9月</strong></p>
  
  <p>
    <a href="WORKSHOP_README_EN.md">English Version</a> | 
    <a href="WORKSHOP_README_ZH.md">繁體中文版本</a>
  </p>
</div>
