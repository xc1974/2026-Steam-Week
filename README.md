# ML-Agents Soccer Training Workshop
# ML-Agents 足球訓練工作坊

<div align="center">
  <h1>🏆 ML-Agents Soccer Training Workshop</h1>
  <h1>🏆 ML-Agents 足球訓練工作坊</h1>
  
  <p><strong>Choose your language / 選擇您的語言</strong></p>
  
  <a href="WORKSHOP_README_EN.md" style="display: inline-block; background-color: #007bff; color: white; padding: 15px 30px; margin: 10px; text-decoration: none; border-radius: 8px; font-weight: bold; font-size: 18px;">English</a>
  
  <a href="WORKSHOP_README_ZH.md" style="display: inline-block; background-color: #28a745; color: white; padding: 15px 30px; margin: 10px; text-decoration: none; border-radius: 8px; font-weight: bold; font-size: 18px;">繁體中文</a>
</div>

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

## 🚀 Quick Start / 快速開始

### Prerequisites / 先決條件
- Unity 2022.3 or later / Unity 2022.3 或更新版本
- Python 3.8 (recommand to use Anaconda) / Python 3.8 (建議使用 Anaconda)
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

<div align="center">
  <p><strong>Last Updated: september 2025 / 最後更新：2025年9月</strong></p>
  
  <p>
    <a href="WORKSHOP_README_EN.md">English Version</a> | 
    <a href="WORKSHOP_README_ZH.md">繁體中文版本</a>
  </p>
</div>
