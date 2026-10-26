<div align="center">

<img src="docs/banner.png" alt="Galaxy Castle — 首个可玩试玩版" width="100%" />

# 银河城堡 Galaxy Castle

**约 10–15 分钟的 2D 动作平台游戏试玩版。冲刺、弹反，再翻转重力在天花板上继续战斗——最后挑战守门人。**

`v0.1 · 堕落之门` &nbsp;·&nbsp; Windows 10/11 (x64) &nbsp;·&nbsp; 使用 Godot 4.7 制作

[![Platform](https://img.shields.io/badge/platform-Windows%2010%2F11%20x64-0078D6?logo=windows&logoColor=white)](#运行要求)
[![Engine](https://img.shields.io/badge/engine-Godot%204.7-478CBF?logo=godotengine&logoColor=white)](#技术信息)
[![Demo](https://img.shields.io/badge/demo-v0.1%20The%20Fallen%20Gate-8B5CF6)](CHANGELOG.md)
[![Status](https://img.shields.io/badge/status-playable%20demo-F59E0B)](#后续计划)

[English](README.md) &nbsp;·&nbsp; [简体中文](README.zh-CN.md)

</div>

## 游戏简介

**《银河城堡》** 是一款横版动作平台游戏，讲述小守卫 **Lune** 与一座从天上坠落的城堡。你奔跑、蹬墙跳、冲刺穿过危险，用长柄刀弹反——当地面到头了，就**翻转重力**，在天花板上接着打。

本仓库收录第一个可玩试玩版 **v0.1「堕落之门」**：一个短章节（约 10–15 分钟），用来在正式开发前打磨移动、战斗和重力机制的手感。

> **只想上手玩？** 到 [Releases](../../releases) 下载 zip，解压到任意位置，双击 **`play.bat`** 即可。

<!--
截图：把 1280×720 的 PNG 放进 docs/screenshots/，然后用下面这样的表格替换这段注释。

| 关卡 | 守门人 |
| :---: | :---: |
| ![Gameplay](docs/screenshots/01-gameplay.png) | ![Boss](docs/screenshots/02-gatewarden.png) |
-->

## 试玩版内容

- **移动** — 奔跑、跳跃（按住可跳更高）、蹬墙跳，以及带无敌帧的冲刺。
- **战斗** — 三段连击、上/下方向攻击、下劈弹跳、弹反，以及按住蓄力的星光治疗。
- **重力核心** — 标志性能力：翻转重力，在天花板上行走，越过尖刺坑。
- **敌人** — Husk（巡逻 + 爪击突进）和 Wisp（飞行冲撞）。
- **Boss** — 守门人（The Gatewarden）：砸地、冲锋、跃击震波；第二阶段追加星雨。
- **检查点** — 星井（Starwells）、星尘拾取，以及死后帮你找回星尘的 Echo。
- **表现** — 占位美术与音效、两段循环音乐、手柄震动，支持键盘与 Xbox 布局手柄。

## 操作

| 动作 | 键盘 | 手柄（Xbox 布局） |
| --- | --- | --- |
| 移动 | `A` `D` / 方向键 | 左摇杆 / 十字键 |
| 攻击朝上 / 朝下 | `W` `S` / 方向键 | 左摇杆 |
| 跳跃（按住更高） | `Space` / `Z` | `A` |
| 攻击（三段连击） | `J` / `X` | `X` |
| 冲刺（无敌） | `K` / `C` / `Shift` | `B` / `RT` |
| 弹反 | `L` / `V` | `RB` |
| 治疗（按住） | `F` | `Y` |
| 翻转重力 | `E` / `G` | `LB` / `LT` |
| 暂停 + 操作列表 | `Esc` / `P` | `Start` |
| 全屏 | `F11` | — |

## 运行方法

### 运行要求

- Windows 10 或 11，64 位
- 约 250 MB 可用磁盘空间
- 键盘，或 Xbox 布局手柄

### 方式一：下载（推荐）

1. 打开 [Releases](../../releases)，下载 `GalaxyCastle_Demo_v0.1_Windows.zip`。
2. 解压（不要在压缩包里直接运行）。
3. 双击 **`play.bat`**。

### 方式二：克隆仓库

```bash
git clone https://github.com/hanghangworker-ui/Galaxy-Castle.git
cd Galaxy-Castle
```

然后双击 `play.bat`，或在终端执行 `./play.bat`。

### 首次启动

`play.bat` 会把 `data/` 里的四个分片合并成 `GalaxyCastle.exe`（约 105 MB，需要几秒钟），然后启动游戏。之后也可以直接运行 `GalaxyCastle.exe`。

> 如果出现 **“Windows 已保护你的电脑”**，这是正常的：试玩版尚未代码签名。点击 **更多信息 → 仍要运行**。签名会在 Steam 版本时补上。

> 合并生成的 `GalaxyCastle.exe` **不会**提交到仓库（见[常见问题](#常见问题)），所以刚克隆下来还没有可执行文件，首次启动会自动生成——这是正常的。

## 仓库结构

```
Galaxy-Castle/
├── play.bat                  # 启动游戏（首次运行时合并 exe）
├── data/
│   ├── GalaxyCastle.exe.001  # Godot 导出的游戏，切成 4 份
│   ├── GalaxyCastle.exe.002
│   ├── GalaxyCastle.exe.003
│   └── GalaxyCastle.exe.004
├── docs/
│   ├── banner.png            # README 顶部横幅
│   ├── social-preview.png    # GitHub → Settings → Social preview
│   ├── PUBLISHING.md         # 仓库是怎么搭的、怎么发布新版本
│   └── screenshots/
├── tools/
│   ├── gen-banner.ps1        # 重新生成上面两张图
│   ├── split-build.ps1       # 把新导出的 exe 切成 data/*.001–004
│   └── package-release.ps1   # 打包 Release 用的 zip
├── CHANGELOG.md
├── README.md
└── README.zh-CN.md
```

## 技术信息

- [Godot Engine 4.7](https://godotengine.org/) — Windows x64 导出
- 占位美术、音效与两段音乐均由代码生成

## 后续计划

- [x] 首个可玩试玩版——移动、战斗、重力、一个 Boss
- [ ] 替换占位美术、音效与音乐
- [ ] 第二个能力与新区域
- [ ] 设置与存档系统、手柄改键
- [ ] 代码签名的 Steam 版本

## 已知问题

- 目前仅支持 Windows，暂无 macOS / Linux 版本。
- 程序未签名，首次运行会被 SmartScreen 拦截提示。
- 美术、音效、音乐均为占位资源。
- 尚无存档系统：进度只在本次游戏内有效（星井检查点同样不跨存档）。

## 常见问题

<details>
<summary><strong>为什么 exe 被切成四个文件？</strong></summary>

GitHub 会拒绝大于 100 MB 的单个文件。Godot 导出的游戏约 105 MB，因此拆成 `data/GalaxyCastle.exe.001` … `.004`（每份约 27 MB），由 `play.bat` 在首次启动时合并。每份都在限制之内，`git clone` 也能正常完成。

</details>

<details>
<summary><strong>为什么仓库里没有 exe？</strong></summary>

`GalaxyCastle.exe` 是一个生成物：它与四个分片拼接后的内容完全一致。把它也提交进去只会让仓库体积翻倍，所以它被写进 `.gitignore`。想要单文件下载的话，请到 [Releases](../../releases) 取 zip。

</details>

<details>
<summary><strong>可以用 Git LFS 吗？</strong></summary>

可以。Git LFS 把大文件放在普通 Git 历史之外，代价是克隆的人要多装一步。取舍与命令见 [docs/PUBLISHING.md](docs/PUBLISHING.md#working-with-large-binaries)。

</details>

## 反馈

Bug、平衡性建议、“这个跳跃手感不对”之类的反馈都欢迎，请开 [issue](../../issues)。源码尚未公开，暂时不接受 pull request。

## 许可

本试玩版**尚未**采用开源许可证。在添加 `LICENSE` 文件之前，游戏本体、代码、美术与音频保留所有权利。如果希望允许他人复用，请添加 `LICENSE` 文件（代码可用 MIT 或 Apache-2.0，素材可用 CC BY-NC 4.0），并更新本节。
