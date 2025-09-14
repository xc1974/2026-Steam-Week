# ML-Agents Soccer Training Workshop
# ML-Agents 足球訓練工作坊

<div align="center">
  <button id="lang-en" onclick="switchLanguage('en')" style="background-color: #007bff; color: white; border: none; padding: 10px 20px; margin: 5px; border-radius: 5px; cursor: pointer;">English</button>
  <button id="lang-zh" onclick="switchLanguage('zh')" style="background-color: #28a745; color: white; border: none; padding: 10px 20px; margin: 5px; border-radius: 5px; cursor: pointer;">繁體中文</button>
</div>

[![ML-Agents](https://img.shields.io/badge/ML--Agents-v2.0-blue.svg)](https://github.com/Unity-Technologies/ml-agents)
[![Unity](https://img.shields.io/badge/Unity-2022.3+-green.svg)](https://unity.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-yellow.svg)](https://python.org/)

---

## 📚 Workshop Overview / 工作坊概述

<div id="overview-en" class="lang-content">
### English
Welcome to the ML-Agents Soccer Training Workshop! This comprehensive workshop teaches participants how to train AI agents to play soccer using Unity's ML-Agents toolkit. You'll learn everything from basic configuration to advanced training techniques, and how to set up competitions between trained agents.
</div>

<div id="overview-zh" class="lang-content" style="display: none;">
### 繁體中文
歡迎來到ML-Agents足球訓練工作坊！這個綜合工作坊教導參與者如何使用Unity的ML-Agents工具包訓練AI智能體踢足球。你將學習從基本配置到進階訓練技術的一切，以及如何設置訓練智能體之間的比賽。
</div>

---

## 🎯 Learning Objectives / 學習目標

<div id="objectives-en" class="lang-content">
### English
By the end of this workshop, participants will be able to:

- ✅ Understand ML-Agents architecture and soccer environment
- ✅ Modify YAML configuration files for custom training
- ✅ Train soccer agents using reinforcement learning
- ✅ Import trained models into Unity scenes
- ✅ Set up competitions between different AI agents
- ✅ Monitor and optimize training performance
- ✅ Troubleshoot common training issues
</div>

<div id="objectives-zh" class="lang-content" style="display: none;">
### 繁體中文
在本次工作坊結束時，參與者將能夠：

- ✅ 理解ML-Agents架構和足球環境
- ✅ 修改YAML配置檔案進行自定義訓練
- ✅ 使用強化學習訓練足球智能體
- ✅ 將訓練模型導入Unity場景
- ✅ 設置不同AI智能體之間的比賽
- ✅ 監控和優化訓練性能
- ✅ 排除常見訓練問題
</div>

---

## 📖 Workshop Materials / 工作坊材料

<div id="materials-en" class="lang-content">
### 1. Main Training Guide / 主要訓練指南
**File**: [`ML-Agents_Soccer_Training_Guide.md`](ML-Agents_Soccer_Training_Guide.md)

**Description**: Comprehensive guide covering the complete ML-Agents soccer training workflow
**內容**: 涵蓋完整ML-Agents足球訓練工作流程的綜合指南

**Topics Covered / 涵蓋主題**:
- Environment setup and project structure
- Training configuration and hyperparameters
- Model training process with mlagents-learn
- Importing trained models to Unity
- Setting up competitions between agents
- Advanced configuration options
- Troubleshooting common issues

### 2. YAML Configuration Guide / YAML配置指南
**File**: [`SoccerTwos_YAML_Training_Guide.md`](SoccerTwos_YAML_Training_Guide.md)

**Description**: Detailed guide for modifying YAML configuration files
**內容**: 修改YAML配置檔案的詳細指南

**Topics Covered / 涵蓋主題**:
- Understanding YAML structure and parameters
- Key parameter explanations with impact analysis
- Practical modification examples
- Training commands and best practices
- Step-by-step workshop sessions
- Parameter tuning guidelines
</div>

<div id="materials-zh" class="lang-content" style="display: none;">
### 1. 主要訓練指南
**檔案**: [`ML-Agents_Soccer_Training_Guide.md`](ML-Agents_Soccer_Training_Guide.md)

**描述**: 涵蓋完整ML-Agents足球訓練工作流程的綜合指南

**涵蓋主題**:
- 環境設置和專案結構
- 訓練配置和超參數
- 使用mlagents-learn的模型訓練過程
- 將訓練模型導入Unity
- 設置智能體之間的比賽
- 進階配置選項
- 常見問題排除

### 2. YAML配置指南
**檔案**: [`SoccerTwos_YAML_Training_Guide.md`](SoccerTwos_YAML_Training_Guide.md)

**描述**: 修改YAML配置檔案的詳細指南

**涵蓋主題**:
- 理解YAML結構和參數
- 關鍵參數說明和影響分析
- 實際修改範例
- 訓練命令和最佳實踐
- 逐步工作坊課程
- 參數調優指南
</div>

---

## 🚀 Quick Start / 快速開始

<div id="quickstart-en" class="lang-content">
#### Prerequisites / 先決條件
- Unity 2022.3 or later
- Python 3.8 or later
- ML-Agents toolkit installed
- Basic understanding of machine learning concepts

#### Installation Steps / 安裝步驟
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

#### First Training Run / 第一次訓練
```bash
# Basic training command
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=my_first_training

# Monitor training progress
tensorboard --logdir=results/my_first_training
```
</div>

<div id="quickstart-zh" class="lang-content" style="display: none;">
#### 先決條件
- Unity 2022.3 或更新版本
- Python 3.8 或更新版本
- 已安裝ML-Agents工具包
- 對機器學習概念的基本理解

#### 安裝步驟
1. **克隆儲存庫**:
   ```bash
   git clone https://github.com/Unity-Technologies/ml-agents.git
   cd ml-agents
   ```

2. **安裝ML-Agents**:
   ```bash
   pip install mlagents
   ```

3. **打開Unity專案**:
   - 打開Unity Hub
   - 添加 `Project` 資料夾
   - 打開專案

4. **導航到足球場景**:
   - 前往 `Assets/ML-Agents/Examples/Soccer/Scenes/`
   - 打開 `SoccerTwos.unity`

#### 第一次訓練
```bash
# 基本訓練命令
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=my_first_training

# 監控訓練進度
tensorboard --logdir=results/my_first_training
```
</div>

---

## 📋 Workshop Schedule / 工作坊時間表

<div id="schedule-en" class="lang-content">
#### Session 1: Introduction and Setup (60 minutes)
- **Overview of ML-Agents and soccer environment**
- **Project structure and navigation**
- **Basic YAML configuration understanding**
- **First training run**

#### Session 2: YAML Configuration Deep Dive (90 minutes)
- **Parameter explanation and impact analysis**
- **Hands-on YAML modification exercises**
- **Different training strategies**
- **Performance comparison**

#### Session 3: Advanced Training and Competition (90 minutes)
- **Model import and Unity configuration**
- **Setting up competitions between agents**
- **Monitoring and optimization**
- **Troubleshooting and best practices**
</div>

<div id="schedule-zh" class="lang-content" style="display: none;">
#### 第一節：介紹和設置（60分鐘）
- **ML-Agents和足球環境概述**
- **專案結構和導航**
- **基本YAML配置理解**
- **第一次訓練運行**

#### 第二節：YAML配置深入探討（90分鐘）
- **參數說明和影響分析**
- **實際YAML修改練習**
- **不同訓練策略**
- **性能比較**

#### 第三節：進階訓練和比賽（90分鐘）
- **模型導入和Unity配置**
- **設置智能體之間的比賽**
- **監控和優化**
- **故障排除和最佳實踐**
</div>

---

## 🛠️ Available Resources / 可用資源

<div id="resources-en" class="lang-content">
### Configuration Files / 配置檔案
- **`config/ppo/SoccerTwos.yaml`**: Standard soccer training configuration
- **`config/ppo/soccer_custom.yaml`**: Optimized configuration with enhanced parameters
- **`config/poca/SoccerTwos.yaml`**: POCA (multi-agent) training configuration

### Unity Scenes / Unity場景
- **`SoccerTwos.unity`**: Main 2v2 soccer competition scene
- **`StrikersVsGoalie.unity`**: Striker vs goalkeeper training scene

### Pre-trained Models / 預訓練模型
- **`TFModels/`**: Contains pre-trained .onnx model files
- **`results/`**: Training outputs and model checkpoints

### Documentation / 文檔
- **`ML-Agents_Soccer_Training_Guide.md`**: Complete training workflow
- **`SoccerTwos_YAML_Training_Guide.md`**: YAML configuration guide
- **`docs/`**: Official ML-Agents documentation
</div>

<div id="resources-zh" class="lang-content" style="display: none;">
### 配置檔案
- **`config/ppo/SoccerTwos.yaml`**: 標準足球訓練配置
- **`config/ppo/soccer_custom.yaml`**: 增強參數的優化配置
- **`config/poca/SoccerTwos.yaml`**: POCA（多智能體）訓練配置

### Unity場景
- **`SoccerTwos.unity`**: 主要2v2足球比賽場景
- **`StrikersVsGoalie.unity`**: 前鋒對守門員訓練場景

### 預訓練模型
- **`TFModels/`**: 包含預訓練的.onnx模型檔案
- **`results/`**: 訓練輸出和模型檢查點

### 文檔
- **`ML-Agents_Soccer_Training_Guide.md`**: 完整訓練工作流程
- **`SoccerTwos_YAML_Training_Guide.md`**: YAML配置指南
- **`docs/`**: 官方ML-Agents文檔
</div>

---

## 🎮 Workshop Exercises / 工作坊練習

<div id="exercises-en" class="lang-content">
#### Exercise 1: Basic Parameter Modification
**Objective**: Learn to modify basic training parameters
**Time**: 30 minutes

**Steps**:
1. Copy `config/ppo/SoccerTwos.yaml` to `config/ppo/SoccerTwos_exercise1.yaml`
2. Modify `learning_rate` from `0.0003` to `0.001`
3. Modify `max_steps` from `10000000` to `2000000`
4. Run training and compare results

#### Exercise 2: Network Architecture Experiment
**Objective**: Experiment with different network sizes
**Time**: 45 minutes

**Steps**:
1. Create three configurations:
   - Small network: `hidden_units: 64, num_layers: 1`
   - Medium network: `hidden_units: 256, num_layers: 2`
   - Large network: `hidden_units: 512, num_layers: 3`
2. Train each configuration
3. Compare training performance and final results

#### Exercise 3: Competition Setup
**Objective**: Set up competitions between trained agents
**Time**: 60 minutes

**Steps**:
1. Train two different models with different configurations
2. Import both models into Unity scene
3. Configure agents to use different models
4. Run competition and analyze results
</div>

<div id="exercises-zh" class="lang-content" style="display: none;">
#### 練習1：基本參數修改
**目標**: 學習修改基本訓練參數
**時間**: 30分鐘

**步驟**:
1. 將 `config/ppo/SoccerTwos.yaml` 複製為 `config/ppo/SoccerTwos_exercise1.yaml`
2. 將 `learning_rate` 從 `0.0003` 改為 `0.001`
3. 將 `max_steps` 從 `10000000` 改為 `2000000`
4. 運行訓練並比較結果

#### 練習2：網路架構實驗
**目標**: 實驗不同的網路大小
**時間**: 45分鐘

**步驟**:
1. 創建三個配置：
   - 小網路：`hidden_units: 64, num_layers: 1`
   - 中等網路：`hidden_units: 256, num_layers: 2`
   - 大網路：`hidden_units: 512, num_layers: 3`
2. 訓練每個配置
3. 比較訓練性能和最終結果

#### 練習3：比賽設置
**目標**: 設置訓練智能體之間的比賽
**時間**: 60分鐘

**步驟**:
1. 使用不同配置訓練兩個不同的模型
2. 將兩個模型導入Unity場景
3. 配置智能體使用不同模型
4. 運行比賽並分析結果
</div>

---

## 🔧 Troubleshooting / 故障排除

<div id="troubleshooting-en" class="lang-content">
#### Common Issues / 常見問題

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
</div>

<div id="troubleshooting-zh" class="lang-content" style="display: none;">
#### 常見問題

**訓練不開始**:
- 檢查Unity場景是否打開並按下Play按鈕
- 驗證YAML語法是否正確
- 確保行為名稱與Unity場景匹配

**性能差**:
- 增加 `learning_rate`（嘗試0.001）
- 增加 `batch_size`（嘗試2048）
- 檢查Unity中的獎勵函數

**記憶體問題**:
- 減少 `batch_size`
- 減少 `buffer_size`
- 使用更小的網路
</div>

---

## 📚 Additional Resources / 額外資源

<div id="resources-additional-en" class="lang-content">
#### Official Documentation
- [ML-Agents Documentation](https://github.com/Unity-Technologies/ml-agents)
- [Unity ML-Agents Toolkit](https://unity.com/products/machine-learning-agents)
- [Reinforcement Learning Basics](https://spinningup.openai.com/)

#### Community Resources
- [ML-Agents GitHub Repository](https://github.com/Unity-Technologies/ml-agents)
- [Unity Forums](https://forum.unity.com/forums/machine-learning-agents.453/)
- [Discord Community](https://discord.gg/5BT2mvC)
</div>

<div id="resources-additional-zh" class="lang-content" style="display: none;">
#### 官方文檔
- [ML-Agents 文檔](https://github.com/Unity-Technologies/ml-agents)
- [Unity ML-Agents 工具包](https://unity.com/products/machine-learning-agents)
- [強化學習基礎](https://spinningup.openai.com/)

#### 社群資源
- [ML-Agents GitHub 儲存庫](https://github.com/Unity-Technologies/ml-agents)
- [Unity 論壇](https://forum.unity.com/forums/machine-learning-agents.453/)
- [Discord 社群](https://discord.gg/5BT2mvC)
</div>

---

## 🎉 Conclusion / 結論

<div id="conclusion-en" class="lang-content">
This workshop provides a comprehensive introduction to ML-Agents soccer training. Through hands-on exercises and detailed guides, participants will gain practical experience in training AI agents and setting up competitions. The skills learned here can be applied to other ML-Agents projects and extended to more complex scenarios.

**Happy Training!** 🚀⚽
</div>

<div id="conclusion-zh" class="lang-content" style="display: none;">
本工作坊提供了ML-Agents足球訓練的綜合介紹。通過實際練習和詳細指南，參與者將獲得訓練AI智能體和設置比賽的實踐經驗。在這裡學到的技能可以應用到其他ML-Agents專案，並擴展到更複雜的場景。

**訓練愉快！** 🚀⚽
</div>

---

*Last Updated: December 2024 / 最後更新：2024年12月*

<script>
function switchLanguage(lang) {
    // Hide all language content
    const allContent = document.querySelectorAll('.lang-content');
    allContent.forEach(content => {
        content.style.display = 'none';
    });
    
    // Show selected language content
    const selectedContent = document.querySelectorAll(`[id$="-${lang}"]`);
    selectedContent.forEach(content => {
        content.style.display = 'block';
    });
    
    // Update button styles
    const enButton = document.getElementById('lang-en');
    const zhButton = document.getElementById('lang-zh');
    
    if (lang === 'en') {
        enButton.style.backgroundColor = '#007bff';
        enButton.style.color = 'white';
        zhButton.style.backgroundColor = '#6c757d';
        zhButton.style.color = 'white';
    } else {
        zhButton.style.backgroundColor = '#28a745';
        zhButton.style.color = 'white';
        enButton.style.backgroundColor = '#6c757d';
        enButton.style.color = 'white';
    }
    
    // Store language preference
    localStorage.setItem('selectedLanguage', lang);
}

// Initialize language on page load
document.addEventListener('DOMContentLoaded', function() {
    const savedLang = localStorage.getItem('selectedLanguage') || 'en';
    switchLanguage(savedLang);
});
</script>

<style>
.lang-content {
    transition: opacity 0.3s ease-in-out;
}

button {
    transition: all 0.3s ease;
}

button:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}
</style>
