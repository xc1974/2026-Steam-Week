# ML-Agents 足球訓練工作坊

[![ML-Agents](https://img.shields.io/badge/ML--Agents-v2.0-blue.svg)](https://github.com/Unity-Technologies/ml-agents)
[![Unity](https://img.shields.io/badge/Unity-2022.3+-green.svg)](https://unity.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-yellow.svg)](https://python.org/)

---

## 📖 工作坊材料

### 1. 主要訓練指南
**檔案**: [`ML-Agents_Soccer_Training_Guide_ZH.md`](ML-Agents_Soccer_Training_Guide_ZH.md)

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
**檔案**: [`SoccerTwos_YAML_Training_Guide_ZH.md`](SoccerTwos_YAML_Training_Guide_ZH.md)

**描述**: 修改YAML配置檔案的詳細指南

**涵蓋主題**:
- 理解YAML結構和參數
- 關鍵參數說明和影響分析
- 實際修改範例
- 訓練命令和最佳實踐
- 逐步工作坊課程
- 參數調優指南

---

## 🚀 快速開始

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
---

## 🛠️ 可用資源

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
- **`ML-Agents_Soccer_Training_Guide_ZH.md`**: 完整訓練工作流程
- **`SoccerTwos_YAML_Training_Guide_ZH.md`**: YAML配置指南
- **`docs/`**: 官方ML-Agents文檔

---

## 🔧 故障排除

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

---

## 📚 額外資源

#### 官方文檔
- [ML-Agents 文檔](https://github.com/Unity-Technologies/ml-agents)
- [Unity ML-Agents 工具包](https://unity.com/products/machine-learning-agents)
- [強化學習基礎](https://spinningup.openai.com/)

#### 社群資源
- [ML-Agents GitHub 儲存庫](https://github.com/Unity-Technologies/ml-agents)
- [Unity 論壇](https://forum.unity.com/forums/machine-learning-agents.453/)
- [Discord 社群](https://discord.gg/5BT2mvC)

---

## 🎉 結論

本工作坊提供了ML-Agents足球訓練的綜合介紹。通過實際練習和詳細指南，參與者將獲得訓練AI智能體和設置比賽的實踐經驗。在這裡學到的技能可以應用到其他ML-Agents專案，並擴展到更複雜的場景。

**訓練愉快！** 🚀⚽

---

*最後更新：2024年12月*

