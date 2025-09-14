# ML-Agents Soccer Agent Training and Competition Guide
# ML-Agents 足球智能體訓練與比賽指南

<div align="center">
  <button id="lang-en" onclick="switchLanguage('en')" style="background-color: #007bff; color: white; border: none; padding: 10px 20px; margin: 5px; border-radius: 5px; cursor: pointer; font-weight: bold;">English</button>
  <button id="lang-zh" onclick="switchLanguage('zh')" style="background-color: #6c757d; color: white; border: none; padding: 10px 20px; margin: 5px; border-radius: 5px; cursor: pointer;">繁體中文</button>
</div>

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
        enButton.style.fontWeight = 'bold';
        zhButton.style.backgroundColor = '#6c757d';
        zhButton.style.fontWeight = 'normal';
    } else {
        zhButton.style.backgroundColor = '#28a745';
        zhButton.style.fontWeight = 'bold';
        enButton.style.backgroundColor = '#6c757d';
        enButton.style.fontWeight = 'normal';
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

---

## Table of Contents / 目錄
- [Overview / 概述](#overview--概述)
- [Environment Setup / 環境設置](#environment-setup--環境設置)
- [Training Configuration / 訓練配置](#training-configuration--訓練配置)
- [Model Training Process / 模型訓練過程](#model-training-process--模型訓練過程)
- [Importing Trained Models / 導入訓練模型](#importing-trained-models--導入訓練模型)
- [Setting Up Competitions / 設置比賽](#setting-up-competitions--設置比賽)
- [Advanced Configuration / 進階配置](#advanced-configuration--進階配置)
- [Troubleshooting / 故障排除](#troubleshooting--故障排除)

---

## Overview / 概述

<div id="overview-en" class="lang-content">
### English
This guide provides a comprehensive approach to training soccer agents using ML-Agents and setting up competitions between trained models. The ML-Agents toolkit includes a complete soccer environment with 2v2 matches and striker vs goalkeeper scenarios.

### 繁體中文
本指南提供了使用ML-Agents訓練足球智能體並設置訓練模型之間比賽的全面方法。ML-Agents工具包包含完整的足球環境，支援2v2比賽和前鋒對守門員場景。

---

## Environment Setup / 環境設置

<div id="environment-en" class="lang-content">
### English

#### 1. Project Structure
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

#### 2. Available Scenes
- **SoccerTwos.unity**: Main 2v2 competition scene
- **StrikersVsGoalie.unity**: Training scene for specific roles
</div>

<div id="environment-zh" class="lang-content" style="display: none;">
### 繁體中文

#### 1. 專案結構
足球環境位於：
```
Project/Assets/ML-Agents/Examples/Soccer/
├── Scenes/
│   ├── SoccerTwos.unity          # 2v2足球比賽
│   └── StrikersVsGoalie.unity    # 前鋒對守門員訓練
├── Prefabs/                      # 智能體預製件
├── Scripts/                      # 足球專用腳本
└── TFModels/                     # 預訓練模型（.onnx檔案）
```

#### 2. 可用場景
- **SoccerTwos.unity**: 主要2v2比賽場景
- **StrikersVsGoalie.unity**: 特定角色訓練場景
</div>

---

## Training Configuration / 訓練配置

<div id="training-config-en" class="lang-content">
### English

#### 1. Configuration Files
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

#### 2. Key Parameters
- **batch_size**: Number of experiences used per update
- **learning_rate**: How fast the agent learns
- **hidden_units**: Network capacity
- **num_layers**: Network depth
- **max_steps**: Total training duration
</div>

<div id="training-config-zh" class="lang-content" style="display: none;">
### 繁體中文

#### 1. 配置檔案
專案包含優化的訓練配置：

**標準配置** (`config/ppo/SoccerTwos.yaml`)：
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

**進階配置** (`config/ppo/soccer_custom.yaml`)：
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 2048          # 增加批次大小
      learning_rate: 0.0002     # 降低學習率提高穩定性
      hidden_units: 512         # 更大的網路
      num_layers: 3             # 更深的網路
    max_steps: 20000000         # 更多訓練步數
```

#### 2. 關鍵參數
- **batch_size**: 每次更新使用的經驗數量
- **learning_rate**: 智能體學習速度
- **hidden_units**: 網路容量
- **num_layers**: 網路深度
- **max_steps**: 總訓練時長
</div>

---

## Model Training Process / 模型訓練過程

<div id="training-process-en" class="lang-content">
### English

#### 1. Starting Training
Use the `mlagents-learn` command to start training:

```bash
# Basic training command
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_training

# Advanced training with optimized settings
mlagents-learn config/ppo/soccer_custom.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_advanced_training
```

#### 2. Training Parameters
- `--env`: Path to Unity executable or scene
- `--run-id`: Unique identifier for this training run
- `--resume`: Resume from previous checkpoint
- `--force`: Overwrite existing results

#### 3. Monitoring Training
```bash
# Use TensorBoard to monitor training progress
tensorboard --logdir=results/soccer_training
```

#### 4. Training Outputs
After training, you'll find:
```
results/soccer_training/
├── models/
│   ├── SoccerTwos.onnx          # Final trained model
│   └── SoccerTwos_XXXX.onnx     # Training checkpoints
├── summaries/                   # Training metrics
└── run_logs/                    # Training logs
```
</div>

<div id="training-process-zh" class="lang-content" style="display: none;">
### 繁體中文

#### 1. 開始訓練
使用 `mlagents-learn` 命令開始訓練：

```bash
# 基本訓練命令
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_training

# 使用優化設置的進階訓練
mlagents-learn config/ppo/soccer_custom.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_advanced_training
```

#### 2. 訓練參數
- `--env`: Unity可執行檔案或場景路徑
- `--run-id`: 此訓練運行的唯一識別碼
- `--resume`: 從之前的檢查點恢復
- `--force`: 覆蓋現有結果

#### 3. 監控訓練
```bash
# 使用TensorBoard監控訓練進度
tensorboard --logdir=results/soccer_training
```

#### 4. 訓練輸出
訓練完成後，你會找到：
```
results/soccer_training/
├── models/
│   ├── SoccerTwos.onnx          # 最終訓練模型
│   └── SoccerTwos_XXXX.onnx     # 訓練檢查點
├── summaries/                   # 訓練指標
└── run_logs/                    # 訓練日誌
```
</div>

---

## Importing Trained Models / 導入訓練模型

<div id="import-models-en" class="lang-content">
### English

#### 1. Locate the Trained Model
Find your trained model in:
```
results/[run-id]/models/SoccerTwos.onnx
```

#### 2. Import into Unity Scene
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

#### 3. Model Assignment Example
```csharp
// Each agent should have:
BehaviorParameters behaviorParams = GetComponent<BehaviorParameters>();
behaviorParams.Model = trainedModel;  // Your .onnx file
behaviorParams.BehaviorType = BehaviorType.InferenceOnly;
behaviorParams.InferenceDevice = InferenceDevice.CPU;
```
</div>

<div id="import-models-zh" class="lang-content" style="display: none;">
### 繁體中文

#### 1. 定位訓練模型
在以下位置找到你的訓練模型：
```
results/[run-id]/models/SoccerTwos.onnx
```

#### 2. 導入到Unity場景
1. **打開Unity場景**：
   - 打開 `Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity`

2. **選擇智能體預製件**：
   - 導航到 `Assets/ML-Agents/Examples/Soccer/Prefabs/`
   - 選擇適當的智能體預製件（例如：`AgentStriker`、`AgentGoalie`）

3. **配置行為參數**：
   - 在Inspector中找到 `Behavior Parameters` 組件
   - 將訓練的 `.onnx` 模型檔案拖拽到 `Model` 欄位
   - 設置 `Behavior Type` 為 `Inference Only`
   - 設置 `Inference Device` 為 `CPU`（推薦）或 `GPU`

4. **驗證配置**：
   - 確保 `Behavior Name` 與訓練配置匹配
   - 檢查所有智能體都分配了正確的模型

#### 3. 模型分配範例
```csharp
// 每個智能體應該有：
BehaviorParameters behaviorParams = GetComponent<BehaviorParameters>();
behaviorParams.Model = trainedModel;  // 你的 .onnx 檔案
behaviorParams.BehaviorType = BehaviorType.InferenceOnly;
behaviorParams.InferenceDevice = InferenceDevice.CPU;
```
</div>

---

## Setting Up Competitions / 設置比賽

<div id="competitions-en" class="lang-content">
### English

#### 1. Competition Scenarios
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

#### 2. Creating Competition Scenes
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

#### 3. Competition Configuration Example
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
</div>

<div id="competitions-zh" class="lang-content" style="display: none;">
### 繁體中文

#### 1. 比賽場景
你可以設置各種比賽場景：

**相同模型比賽**：
- 所有智能體使用相同的訓練模型
- 測試一致性和性能

**不同模型比賽**：
- 智能體使用不同訓練運行的模型
- 比較不同的訓練策略

**混合策略比賽**：
- 一些智能體使用前鋒模型，其他使用守門員模型
- 測試角色專業化

#### 2. 創建比賽場景
1. **複製現有場景**：
   ```bash
   # 將 SoccerTwos.unity 複製為 SoccerCompetition.unity
   ```

2. **配置不同智能體**：
   - 為不同智能體分配不同模型
   - 修改智能體行為和策略

3. **設置監控**：
   - 使用 `Monitor.cs` 進行即時統計
   - 追蹤進球、性能指標和比賽統計

#### 3. 比賽配置範例
```csharp
// 在 SoccerEnvController.cs 中
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
        // 為不同智能體分配不同模型
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
</div>

---

## Advanced Configuration / 進階配置

<div id="advanced-config-en" class="lang-content">
### English

#### 1. Self-Play Training
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

#### 2. Curriculum Learning
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

#### 3. Reward Signal Configuration
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
</div>

<div id="advanced-config-zh" class="lang-content" style="display: none;">
### 繁體中文

#### 1. 自我對戰訓練
啟用自我對戰進行競爭性訓練：

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

#### 2. 課程學習
實施課程學習以逐步增加難度：

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

#### 3. 獎勵信號配置
自定義獎勵信號以改善訓練：

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
</div>

---

## Troubleshooting / 故障排除

<div id="troubleshooting-en" class="lang-content">
### English

#### Common Issues and Solutions

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
</div>

<div id="troubleshooting-zh" class="lang-content" style="display: none;">
### 繁體中文

#### 常見問題和解決方案

**1. 模型不工作**
- **問題**: 智能體不移動或行為不正確
- **解決方案**:
  - 驗證模型檔案正確分配
  - 檢查行為名稱與訓練配置匹配
  - 確保推理設備設置正確

**2. 訓練不收斂**
- **問題**: 智能體性能沒有改善
- **解決方案**:
  - 降低學習率
  - 增加批次大小
  - 調整獎勵函數
  - 檢查觀察空間

**3. 性能問題**
- **問題**: 推理或訓練速度慢
- **解決方案**:
  - 使用CPU推理而非GPU
  - 減少網路大小
  - 優化Unity場景

**4. 記憶體問題**
- **問題**: 訓練期間記憶體不足
- **解決方案**:
  - 減少批次大小
  - 降低緩衝區大小
  - 使用更少的並發環境
</div>

---

## Quick Start Checklist / 快速開始檢查清單

<div id="checklist-en" class="lang-content">
### English
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
</div>

<div id="checklist-zh" class="lang-content" style="display: none;">
### 繁體中文
- [ ] 安裝ML-Agents工具包
- [ ] 打開Unity專案
- [ ] 導航到足球場景
- [ ] 選擇訓練配置
- [ ] 使用 `mlagents-learn` 開始訓練
- [ ] 使用TensorBoard監控訓練
- [ ] 將訓練模型導入Unity
- [ ] 配置智能體行為參數
- [ ] 設置比賽場景
- [ ] 測試和迭代
</div>

---

## Conclusion / 結論

<div id="conclusion-en" class="lang-content">
### English
This guide provides a comprehensive approach to training soccer agents and setting up competitions using ML-Agents. The key to success is:

1. **Proper Configuration**: Use optimized training parameters
2. **Patient Training**: Allow sufficient training time
3. **Careful Model Import**: Ensure correct model assignment
4. **Systematic Testing**: Test different scenarios and configurations

With these steps, you can create competitive soccer agents that can play against each other in exciting matches.
</div>

<div id="conclusion-zh" class="lang-content" style="display: none;">
### 繁體中文
本指南提供了使用ML-Agents訓練足球智能體和設置比賽的全面方法。成功的關鍵是：

1. **正確配置**: 使用優化的訓練參數
2. **耐心訓練**: 允許足夠的訓練時間
3. **仔細導入模型**: 確保正確的模型分配
4. **系統性測試**: 測試不同場景和配置

通過這些步驟，你可以創建能夠在精彩比賽中相互對戰的競爭性足球智能體。
</div>

---

*For more information, visit the [ML-Agents Documentation](https://github.com/Unity-Technologies/ml-agents) / 更多資訊請訪問 [ML-Agents 文檔](https://github.com/Unity-Technologies/ml-agents)*

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
