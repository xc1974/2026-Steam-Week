# SoccerTwos YAML Configuration Training Guide
# SoccerTwos YAML 配置訓練指南

---

## Table of Contents / 目錄
- [Introduction / 介紹](#introduction--介紹)
- [Understanding the YAML Structure / 理解YAML結構](#understanding-the-yaml-structure--理解yaml結構)
- [Key Parameters Explained / 關鍵參數說明](#key-parameters-explained--關鍵參數說明)
- [Modification Examples / 修改範例](#modification-examples--修改範例)
- [Training Commands / 訓練命令](#training-commands--訓練命令)
- [Best Practices / 最佳實踐](#best-practices--最佳實踐)
- [Troubleshooting / 故障排除](#troubleshooting--故障排除)

---

## Introduction / 介紹

### English
This guide teaches participants how to modify the `SoccerTwos.yaml` configuration file to customize AI training for soccer agents. By adjusting various parameters, you can control how the AI learns, how fast it learns, and how well it performs.

### 繁體中文
本指南教導參與者如何修改 `SoccerTwos.yaml` 配置檔案來自定義足球智能體的AI訓練。通過調整各種參數，你可以控制AI如何學習、學習速度以及表現如何。

---

## Understanding the YAML Structure / 理解YAML結構

### English

#### Original SoccerTwos.yaml Structure
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

#### Structure Breakdown
- **behaviors**: Defines the agent behavior configuration
- **SoccerTwos**: The behavior name (must match Unity scene)
- **trainer_type**: Algorithm used (PPO, SAC, etc.)
- **hyperparameters**: Core training parameters
- **network_settings**: Neural network architecture
- **reward_signals**: Reward configuration
- **Other settings**: Training control parameters

### 繁體中文

#### 原始 SoccerTwos.yaml 結構
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

#### 結構分解
- **behaviors**: 定義智能體行為配置
- **SoccerTwos**: 行為名稱（必須與Unity場景匹配）
- **trainer_type**: 使用的算法（PPO、SAC等）
- **hyperparameters**: 核心訓練參數
- **network_settings**: 神經網路架構
- **reward_signals**: 獎勵配置
- **其他設置**: 訓練控制參數

---

## Key Parameters Explained / 關鍵參數說明

### English

#### 1. Hyperparameters / 超參數

| Parameter / 參數 | Default Value / 預設值 | Purpose / 目的 | Impact / 影響 |
|------------------|----------------------|----------------|---------------|
| `batch_size` | 1024 | Number of experiences per update / 每次更新的經驗數量 | Larger = more stable, slower / 更大 = 更穩定，更慢 |
| `learning_rate` | 0.0003 | How fast the AI learns / AI學習速度 | Higher = faster learning, less stable / 更高 = 學習更快，穩定性較差 |
| `beta` | 0.01 | Entropy regularization / 熵正則化 | Higher = more exploration / 更高 = 更多探索 |
| `epsilon` | 0.2 | PPO clipping parameter / PPO裁剪參數 | Controls policy updates / 控制策略更新 |
| `num_epoch` | 20 | Training epochs per update / 每次更新的訓練輪數 | More = better learning, slower / 更多 = 學習更好，更慢 |

#### 2. Network Settings / 網路設置

| Parameter / 參數 | Default Value / 預設值 | Purpose / 目的 | Impact / 影響 |
|------------------|----------------------|----------------|---------------|
| `hidden_units` | 256 | Network width / 網路寬度 | Larger = more capacity / 更大 = 更多容量 |
| `num_layers` | 2 | Network depth / 網路深度 | Deeper = more complex patterns / 更深 = 更複雜的模式 |
| `normalize` | true | Input normalization / 輸入標準化 | Helps training stability / 有助於訓練穩定性 |

#### 3. Training Control / 訓練控制

| Parameter / 參數 | Default Value / 預設值 | Purpose / 目的 | Impact / 影響 |
|------------------|----------------------|----------------|---------------|
| `max_steps` | 10000000 | Total training steps / 總訓練步數 | More = longer training / 更多 = 更長訓練 |
| `time_horizon` | 1000 | Episode length / 回合長度 | Longer = more context / 更長 = 更多上下文 |
| `keep_checkpoints` | 5 | Saved model versions / 保存的模型版本 | More = more backup points / 更多 = 更多備份點 |

### 繁體中文

#### 1. 超參數

| 參數 | 預設值 | 目的 | 影響 |
|------|--------|------|------|
| `batch_size` | 1024 | 每次更新的經驗數量 | 更大 = 更穩定，更慢 |
| `learning_rate` | 0.0003 | AI學習速度 | 更高 = 學習更快，穩定性較差 |
| `beta` | 0.01 | 熵正則化 | 更高 = 更多探索 |
| `epsilon` | 0.2 | PPO裁剪參數 | 控制策略更新 |
| `num_epoch` | 20 | 每次更新的訓練輪數 | 更多 = 學習更好，更慢 |

#### 2. 網路設置

| 參數 | 預設值 | 目的 | 影響 |
|------|--------|------|------|
| `hidden_units` | 256 | 網路寬度 | 更大 = 更多容量 |
| `num_layers` | 2 | 網路深度 | 更深 = 更複雜的模式 |
| `normalize` | true | 輸入標準化 | 有助於訓練穩定性 |

#### 3. 訓練控制

| 參數 | 預設值 | 目的 | 影響 |
|------|--------|------|------|
| `max_steps` | 10000000 | 總訓練步數 | 更多 = 更長訓練 |
| `time_horizon` | 1000 | 回合長度 | 更長 = 更多上下文 |
| `keep_checkpoints` | 5 | 保存的模型版本 | 更多 = 更多備份點 |

---

## Modification Examples / 修改範例

### English

#### Example 1: Faster Learning / 更快學習
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

#### Example 2: More Stable Training / 更穩定訓練
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

#### Example 3: High Exploration / 高探索
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

#### Example 4: Quick Experiment / 快速實驗
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

### 繁體中文

#### 範例1: 更快學習
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

#### 範例2: 更穩定訓練
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

#### 範例3: 高探索
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

#### 範例4: 快速實驗
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

## Training Commands / 訓練命令

### English

#### Basic Training Command
```bash
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=my_soccer_training
```

#### Training with Custom Configuration
```bash
# Create your custom config file
cp config/ppo/SoccerTwos.yaml config/ppo/SoccerTwos_custom.yaml

# Edit the custom file with your modifications
# Then train with:
mlagents-learn config/ppo/SoccerTwos_custom.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=custom_training
```

#### Training with Different Scenes
```bash
# Train on Striker vs Goalkeeper scene
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/StrikersVsGoalie.unity --run-id=striker_vs_goalie

# Train on 2v2 scene
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_2v2
```

#### Advanced Training Options
```bash
# Resume training from checkpoint
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=resumed_training --resume

# Force overwrite existing results
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=new_training --force

# Train with multiple environments
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --num-envs=4 --run-id=multi_env_training
```

### 繁體中文

#### 基本訓練命令
```bash
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=my_soccer_training
```

#### 使用自定義配置訓練
```bash
# 創建你的自定義配置檔案
cp config/ppo/SoccerTwos.yaml config/ppo/SoccerTwos_custom.yaml

# 編輯自定義檔案進行修改
# 然後使用以下命令訓練：
mlagents-learn config/ppo/SoccerTwos_custom.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=custom_training
```

#### 使用不同場景訓練
```bash
# 在前鋒對守門員場景訓練
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/StrikersVsGoalie.unity --run-id=striker_vs_goalie

# 在2v2場景訓練
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=soccer_2v2
```

#### 進階訓練選項
```bash
# 從檢查點恢復訓練
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=resumed_training --resume

# 強制覆蓋現有結果
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --run-id=new_training --force

# 使用多個環境訓練
mlagents-learn config/ppo/SoccerTwos.yaml --env=Project/Assets/ML-Agents/Examples/Soccer/Scenes/SoccerTwos.unity --num-envs=4 --run-id=multi_env_training
```

---

## Best Practices / 最佳實踐

### English

#### 1. Parameter Adjustment Guidelines / 參數調整指南

**For Beginners / 初學者**:
- Start with default values
- Make small changes (10-20% adjustments)
- Test one parameter at a time
- Keep detailed logs of changes

**For Advanced Users / 進階用戶**:
- Experiment with different combinations
- Use curriculum learning for complex tasks
- Implement self-play for competitive scenarios
- Monitor training metrics closely

#### 2. Common Parameter Combinations / 常見參數組合

**Fast Training / 快速訓練**:
```yaml
batch_size: 512
learning_rate: 0.001
num_epoch: 10
max_steps: 5000000
```

**Stable Training / 穩定訓練**:
```yaml
batch_size: 2048
learning_rate: 0.0001
num_epoch: 30
max_steps: 20000000
```

**High Exploration / 高探索**:
```yaml
beta: 0.05
epsilon: 0.3
learning_rate: 0.0005
```

#### 3. Monitoring Training / 監控訓練

```bash
# Use TensorBoard to monitor training
tensorboard --logdir=results/my_soccer_training

# Key metrics to watch:
# - Cumulative Reward: Should increase over time
# - Policy Loss: Should decrease and stabilize
# - Value Loss: Should decrease
# - Entropy: Should decrease as agent learns
```

### 繁體中文

#### 1. 參數調整指南

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

#### 2. 常見參數組合

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

#### 3. 監控訓練

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

## Troubleshooting / 故障排除

### English

#### Common Issues and Solutions / 常見問題和解決方案

**1. Training Not Starting / 訓練不開始**
- **Problem**: Command fails or hangs
- **Solutions**:
  - Check Unity scene is open and Play button pressed
  - Verify YAML syntax is correct
  - Ensure behavior name matches Unity scene

**2. Poor Performance / 性能差**
- **Problem**: Agent doesn't learn or performs badly
- **Solutions**:
  - Increase `learning_rate` (try 0.001)
  - Increase `batch_size` (try 2048)
  - Increase `max_steps` (try 20000000)
  - Check reward function in Unity

**3. Training Too Slow / 訓練太慢**
- **Problem**: Training takes too long
- **Solutions**:
  - Reduce `batch_size` (try 512)
  - Reduce `num_epoch` (try 10)
  - Reduce `max_steps` for testing
  - Use smaller network (`hidden_units: 128`)

**4. Unstable Training / 訓練不穩定**
- **Problem**: Loss curves are erratic
- **Solutions**:
  - Reduce `learning_rate` (try 0.0001)
  - Increase `batch_size` (try 2048)
  - Increase `beta` for more exploration
  - Check for reward spikes in Unity

**5. Memory Issues / 記憶體問題**
- **Problem**: Out of memory errors
- **Solutions**:
  - Reduce `batch_size`
  - Reduce `buffer_size`
  - Use smaller network
  - Close other applications

### 繁體中文

#### 常見問題和解決方案

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

## Step-by-Step Workshop Guide / 逐步工作坊指南

### English

#### Workshop Session 1: Basic Modifications / 工作坊第一節：基本修改

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

#### Workshop Session 2: Network Architecture / 工作坊第二節：網路架構

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

#### Workshop Session 3: Advanced Parameters / 工作坊第三節：進階參數

**Objective**: Explore advanced training options

**Steps**:
1. **Experiment with exploration**:
   ```yaml
   beta: 0.05  # High exploration
   epsilon: 0.3
   ```

2. **Try different batch sizes**
3. **Test learning rate schedules**

### 繁體中文

#### 工作坊第一節：基本修改

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

#### 工作坊第二節：網路架構

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

#### 工作坊第三節：進階參數

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

## Conclusion / 結論

### English
This guide provides participants with the knowledge and tools needed to modify the `SoccerTwos.yaml` configuration file for custom AI training. Remember:

1. **Start Simple**: Begin with small modifications
2. **Test Systematically**: Change one parameter at a time
3. **Monitor Closely**: Use TensorBoard to track progress
4. **Document Changes**: Keep records of what works
5. **Experiment**: Try different combinations

With practice, you'll develop intuition for which parameters to adjust for different training goals.

### 繁體中文
本指南為參與者提供了修改 `SoccerTwos.yaml` 配置檔案進行自定義AI訓練所需的知識和工具。記住：

1. **從簡單開始**: 從小修改開始
2. **系統性測試**: 一次改變一個參數
3. **密切監控**: 使用TensorBoard追蹤進度
4. **記錄變更**: 記錄有效的方法
5. **實驗**: 嘗試不同的組合

通過練習，你將培養出對不同訓練目標應該調整哪些參數的直覺。

---

*Happy Training! / 訓練愉快！*
