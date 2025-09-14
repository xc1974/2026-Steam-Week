# SoccerTwos YAML 配置訓練指南

[![ML-Agents](https://img.shields.io/badge/ML--Agents-v2.0-blue.svg)](https://github.com/Unity-Technologies/ml-agents)
[![Unity](https://img.shields.io/badge/Unity-2022.3+-green.svg)](https://unity.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-yellow.svg)](https://python.org/)

---

## 目錄
- [介紹](#介紹)
- [理解YAML結構](#理解yaml結構)
- [關鍵參數說明](#關鍵參數說明)
- [修改範例](#修改範例)
- [訓練命令](#訓練命令)
- [最佳實踐](#最佳實踐)
- [故障排除](#故障排除)

---

## 介紹

本指南教導參與者如何修改 `SoccerTwos.yaml` 配置檔案來自定義足球智能體的AI訓練。通過調整各種參數，你可以控制AI如何學習、學習速度以及表現如何。

---

## 理解YAML結構

### 原始 SoccerTwos.yaml 結構
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

### 結構分解
- **behaviors**: 定義智能體行為配置
- **SoccerTwos**: 行為名稱（必須與Unity場景匹配）
- **trainer_type**: 使用的算法（PPO、SAC等）
- **hyperparameters**: 核心訓練參數
- **network_settings**: 神經網路架構
- **reward_signals**: 獎勵配置
- **其他設置**: 訓練控制參數

---

## 關鍵參數說明

### 1. 超參數

| 參數 | 預設值 | 目的 | 影響 |
|------|--------|------|------|
| `batch_size` | 1024 | 每次更新的經驗數量 | 更大 = 更穩定，更慢 |
| `learning_rate` | 0.0003 | AI學習速度 | 更高 = 學習更快，穩定性較差 |
| `beta` | 0.01 | 熵正則化 | 更高 = 更多探索 |
| `epsilon` | 0.2 | PPO裁剪參數 | 控制策略更新 |
| `num_epoch` | 20 | 每次更新的訓練輪數 | 更多 = 學習更好，更慢 |

### 2. 網路設置

| 參數 | 預設值 | 目的 | 影響 |
|------|--------|------|------|
| `hidden_units` | 256 | 網路寬度 | 更大 = 更多容量 |
| `num_layers` | 2 | 網路深度 | 更深 = 更複雜的模式 |
| `normalize` | true | 輸入標準化 | 有助於訓練穩定性 |

### 3. 訓練控制

| 參數 | 預設值 | 目的 | 影響 |
|------|--------|------|------|
| `max_steps` | 10000000 | 總訓練步數 | 更多 = 更長訓練 |
| `time_horizon` | 1000 | 回合長度 | 更長 = 更多上下文 |
| `keep_checkpoints` | 5 | 保存的模型版本 | 更多 = 更多備份點 |

---

## 修改範例

### 範例1: 更快學習
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 512          # 減少以加快更新
      learning_rate: 0.001     # 增加學習率
      num_epoch: 10            # 減少輪數
    network_settings:
      hidden_units: 128        # 更小的網路
      num_layers: 2
    max_steps: 5000000         # 更短的訓練
```

### 範例2: 更穩定訓練
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      batch_size: 2048         # 更大的批次大小
      learning_rate: 0.0001    # 更低的學習率
      beta: 0.005              # 更少探索
      num_epoch: 30            # 更多輪數
    network_settings:
      hidden_units: 512        # 更大的網路
      num_layers: 3            # 更深的網路
    max_steps: 20000000         # 更長的訓練
```

### 範例3: 高探索
```yaml
behaviors:
  SoccerTwos:
    trainer_type: ppo
    hyperparameters:
      beta: 0.05               # 高熵
      epsilon: 0.3             # 更多策略變化
      learning_rate: 0.0005    # 適中學習率
    network_settings:
      hidden_units: 256
      num_layers: 2
```

### 範例4: 快速實驗
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
    max_steps: 1000000          # 非常短的訓練
    summary_freq: 5000          # 更頻繁的更新
```

---

## 訓練命令

### 基本訓練命令
```bash
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=my_soccer_training
```

### 使用自定義配置訓練
```bash
# 創建你的自定義配置檔案
cp config/ppo/SoccerTwos.yaml config/ppo/SoccerTwos_custom.yaml

# 編輯自定義檔案進行修改
# 然後使用以下命令訓練：
mlagents-learn config/ppo/SoccerTwos_custom.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=custom_training
```

### 使用不同場景訓練
```bash
# 在前鋒對守門員場景訓練
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/StrikersVsGoalie.unity --run-id=striker_vs_goalie

# 在2v2場景訓練
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_2v2
```

### 進階訓練選項
```bash
# 從檢查點恢復訓練
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=resumed_training --resume

# 強制覆蓋現有結果
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=new_training --force

# 使用多個環境訓練
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --num-envs=4 --run-id=multi_env_training
```

---

## 最佳實踐

### 1. 參數調整指南

**初學者**:
- 從預設值開始
- 進行小幅調整（10-20%的調整）
- 一次測試一個參數
- 詳細記錄變更

**進階用戶**:
- 嘗試不同的組合
- 對複雜任務使用課程學習
- 對競爭場景實施自我對戰
- 密切監控訓練指標

### 2. 常見參數組合

**快速訓練**:
```yaml
batch_size: 512
learning_rate: 0.001
num_epoch: 10
max_steps: 5000000
```

**穩定訓練**:
```yaml
batch_size: 2048
learning_rate: 0.0001
num_epoch: 30
max_steps: 20000000
```

**高探索**:
```yaml
beta: 0.05
epsilon: 0.3
learning_rate: 0.0005
```

### 3. 監控訓練

```bash
# 使用TensorBoard監控訓練
tensorboard --logdir=results/my_soccer_training

# 要關注的關鍵指標：
# - 累積獎勵：應該隨時間增加
# - 策略損失：應該減少並穩定
# - 價值損失：應該減少
# - 熵：應該隨著智能體學習而減少
```

---

## 故障排除

### 常見問題和解決方案

**1. 訓練不開始**
- **問題**: 命令失敗或掛起
- **解決方案**:
  - 檢查Unity場景是否打開並按下Play按鈕
  - 驗證YAML語法是否正確
  - 確保行為名稱與Unity場景匹配

**2. 性能差**
- **問題**: 智能體不學習或表現糟糕
- **解決方案**:
  - 增加 `learning_rate`（嘗試0.001）
  - 增加 `batch_size`（嘗試2048）
  - 增加 `max_steps`（嘗試20000000）
  - 檢查Unity中的獎勵函數

**3. 訓練太慢**
- **問題**: 訓練時間太長
- **解決方案**:
  - 減少 `batch_size`（嘗試512）
  - 減少 `num_epoch`（嘗試10）
  - 減少 `max_steps` 進行測試
  - 使用更小的網路（`hidden_units: 128`）

**4. 訓練不穩定**
- **問題**: 損失曲線不穩定
- **解決方案**:
  - 減少 `learning_rate`（嘗試0.0001）
  - 增加 `batch_size`（嘗試2048）
  - 增加 `beta` 以獲得更多探索
  - 檢查Unity中的獎勵峰值

**5. 記憶體問題**
- **問題**: 記憶體不足錯誤
- **解決方案**:
  - 減少 `batch_size`
  - 減少 `buffer_size`
  - 使用更小的網路
  - 關閉其他應用程式

---

## 逐步工作坊指南

### 工作坊第一節：基本修改

**目標**: 學習修改基本參數

**步驟**:
1. **複製原始檔案**:
   ```bash
   cp config/ppo/SoccerTwos.yaml config/ppo/SoccerTwos_workshop.yaml
   ```

2. **進行第一次修改**:
   - 將 `learning_rate` 從 `0.0003` 改為 `0.001`
   - 將 `max_steps` 從 `10000000` 改為 `2000000`

3. **開始訓練**:
   ```bash
   mlagents-learn config/ppo/SoccerTwos_workshop.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=workshop_1
   ```

4. **監控結果**:
   ```bash
   tensorboard --logdir=results/workshop_1
   ```

### 工作坊第二節：網路架構

**目標**: 實驗不同的網路大小

**步驟**:
1. **創建網路變化**:
   ```yaml
   # 小網路
   hidden_units: 64
   num_layers: 1
   
   # 大網路
   hidden_units: 512
   num_layers: 3
   ```

2. **比較訓練結果**
3. **分析性能差異**

### 工作坊第三節：進階參數

**目標**: 探索進階訓練選項

**步驟**:
1. **實驗探索**:
   ```yaml
   beta: 0.05  # 高探索
   epsilon: 0.3
   ```

2. **嘗試不同的批次大小**
3. **測試學習率調度**

---

## 結論

本指南為參與者提供了修改 `SoccerTwos.yaml` 配置檔案進行自定義AI訓練所需的知識和工具。記住：

1. **從簡單開始**: 從小修改開始
2. **系統性測試**: 一次改變一個參數
3. **密切監控**: 使用TensorBoard追蹤進度
4. **記錄變更**: 記錄有效的方法
5. **實驗**: 嘗試不同的組合

通過練習，你將培養出對不同訓練目標應該調整哪些參數的直覺。

---

*訓練愉快！* 🚀⚽
