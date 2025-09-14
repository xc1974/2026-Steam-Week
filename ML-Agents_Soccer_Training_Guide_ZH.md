# ML-Agents 足球智能體訓練與比賽指南

[![ML-Agents](https://img.shields.io/badge/ML--Agents-v2.0-blue.svg)](https://github.com/Unity-Technologies/ml-agents)
[![Unity](https://img.shields.io/badge/Unity-2022.3+-green.svg)](https://unity.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-yellow.svg)](https://python.org/)

---

## 目錄
- [概述](#概述)
- [環境設置](#環境設置)
- [訓練配置](#訓練配置)
- [模型訓練過程](#模型訓練過程)
- [導入訓練模型](#導入訓練模型)
- [設置比賽](#設置比賽)
- [進階配置](#進階配置)
- [故障排除](#故障排除)

---

## 概述

本指南提供了使用ML-Agents訓練足球智能體並設置訓練模型之間比賽的全面方法。ML-Agents工具包包含完整的足球環境，支援2v2比賽和前鋒對守門員場景。

---

## 環境設置

### 1. 專案結構
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

### 2. 可用場景
- **SoccerTwos.unity**: 主要2v2比賽場景
- **StrikersVsGoalie.unity**: 特定角色訓練場景

---

## 訓練配置

### 1. 配置檔案
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

### 2. 關鍵參數
- **batch_size**: 每次更新使用的經驗數量
- **learning_rate**: 智能體學習速度
- **hidden_units**: 網路容量
- **num_layers**: 網路深度
- **max_steps**: 總訓練時長

---

## 模型訓練過程

### 1. 開始訓練
使用 `mlagents-learn` 命令開始訓練：

```bash
# 基本訓練命令
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_training

# 使用優化設置的進階訓練
mlagents-learn config/ppo/soccer_custom.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_advanced_training
```

### 2. 訓練參數
- `--env`: Unity可執行檔案或場景路徑
- `--run-id`: 此訓練運行的唯一識別碼
- `--resume`: 從之前的檢查點恢復
- `--force`: 覆蓋現有結果

### 3. 監控訓練
```bash
# 使用TensorBoard監控訓練進度
tensorboard --logdir=results/soccer_training
```

### 4. 訓練輸出
訓練完成後，你會找到：
```
results/soccer_training/
├── models/
│   ├── SoccerTwos.onnx          # 最終訓練模型
│   └── SoccerTwos_XXXX.onnx     # 訓練檢查點
├── summaries/                   # 訓練指標
└── run_logs/                    # 訓練日誌
```

---

## 導入訓練模型

### 1. 定位訓練模型
在以下位置找到你的訓練模型：
```
results/[run-id]/models/SoccerTwos.onnx
```

### 2. 導入到Unity場景
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

### 3. 模型分配範例
```csharp
// 每個智能體應該有：
BehaviorParameters behaviorParams = GetComponent<BehaviorParameters>();
behaviorParams.Model = trainedModel;  // 你的 .onnx 檔案
behaviorParams.BehaviorType = BehaviorType.InferenceOnly;
behaviorParams.InferenceDevice = InferenceDevice.CPU;
```

---

## 設置比賽

### 1. 比賽場景
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

### 2. 創建比賽場景
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

### 3. 比賽配置範例
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

---

## 進階配置

### 1. 自我對戰訓練
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

### 2. 課程學習
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

### 3. 獎勵信號配置
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

---

## 故障排除

### 常見問題和解決方案

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

---

## 快速開始檢查清單

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

---

## 結論

本指南提供了使用ML-Agents訓練足球智能體和設置比賽的全面方法。成功的關鍵是：

1. **正確配置**: 使用優化的訓練參數
2. **耐心訓練**: 允許足夠的訓練時間
3. **仔細導入模型**: 確保正確的模型分配
4. **系統性測試**: 測試不同場景和配置

通過這些步驟，你可以創建能夠在精彩比賽中相互對戰的競爭性足球智能體。

**訓練愉快！** 🚀⚽

---

*更多資訊請訪問 [ML-Agents 文檔](https://github.com/Unity-Technologies/ml-agents)*
