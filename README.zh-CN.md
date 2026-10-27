<div align="center">

<img src="docs/banner.png" alt="Galaxy Castle — 试玩版 v0.4" width="100%" />

# 银河城堡 Galaxy Castle

**约 10–15 分钟的 2D 动作平台游戏试玩版。冲刺、弹反、翻转重力在天花板上继续战斗——这一版终于有了标题画面、存档位和“知道该看哪里”的镜头。**

`v0.4 · 堕落之门` &nbsp;·&nbsp; Windows 10/11 (x64) &nbsp;·&nbsp; 使用 Godot 4.7 制作

[![Platform](https://img.shields.io/badge/platform-Windows%2010%2F11%20x64-0078D6?logo=windows&logoColor=white)](#运行要求)
[![Engine](https://img.shields.io/badge/engine-Godot%204.7-478CBF?logo=godotengine&logoColor=white)](#技术信息)
[![Demo](https://img.shields.io/badge/demo-v0.4%20The%20Fallen%20Gate-8B5CF6)](CHANGELOG.md)
[![Status](https://img.shields.io/badge/status-playable%20demo-F59E0B)](#后续计划)

[English](README.md) &nbsp;·&nbsp; [简体中文](README.zh-CN.md)

</div>

## 游戏简介

**《银河城堡》** 是一款横版动作平台游戏，讲述小守卫 **Lune** 与一座从天上坠落的城堡。你奔跑、蹬墙跳、冲刺穿过危险，用长柄刀弹反——当地面到头了，就**翻转重力**，在天花板上接着打。

本仓库收录**第二个公开版本 v0.4**：一个名为 *堕落之门（The Fallen Gate）* 的短章节，现在拆成**五个连通的房间**，并配上了完整的前端——主菜单、三个存档位、可自定义按键的设置界面，以及参考《空洞骑士》《蔚蓝》的镜头分区。

> **只想上手玩？** 到 [Releases](../../releases) 下载 zip，解压后双击 **`play.bat`**。

## 截图

| 标题画面 | 存档位 |
| :---: | :---: |
| ![标题画面](docs/screenshots/01-title-screen.png) | ![存档位](docs/screenshots/02-save-slots.png) |
| **守门人竞技场** | **走廊镜头** |
| ![守门人竞技场](docs/screenshots/06-gatewarden-arena.png) | ![走廊镜头](docs/screenshots/08-corridor-camera.png) |

更多截图在 [docs/screenshots](docs/screenshots/)：设置界面、改键、暂停菜单，以及重绘后的 Lune。

## v0.4 新增内容

- **主菜单** — 继续、新游戏、读取存档、设置、退出（键盘、手柄、鼠标均可操作）。
- **三个存档位** — 每个显示所在房间、游戏时长和星尘。在星井、死亡时、打完 Boss、以及“保存并退出”时自动存档；存档位可删除。
- **设置** — 主音量 / 音乐 / 音效、全屏、屏幕震动，以及**按键自定义**（任意动作按下新键即可改绑，可恢复默认）。
- **暂停菜单** — 继续、设置、操作说明、从上一个星井重来、保存并退出到标题。
- **镜头分区** — 走廊锁定镜头高度，蹬墙竖井锁定横向，开阔区域跟随 Lune（只有落地时高度才变化），守门人大厅则是固定、拉远的整场视角。
- **Lune 的脸重绘**为正确的四分之三视角（近侧眼睛贴耳，远侧眼睛过鼻梁）。

存档位置：`%APPDATA%\Godot\app_userdata\Galaxy Castle\saves\`。

## 试玩版内容

- **五个房间** — 堕落之门、荆棘大厅、断壁、倒悬之桥、守门人大厅。走出房间边缘会淡出进入下一个房间，每个房间首次进入时会显示名字。
- **移动** — 奔跑、跳跃（按住可跳更高）、蹬墙跳，以及带残影的无敌冲刺。
- **战斗** — 三段连击、上/下方向攻击、下劈弹跳、弹反，以及按住蓄力的星光治疗。
- **重力核心** — 标志性能力：翻转重力，在天花板上行走，越过尖刺坑。
- **敌人** — Husk（巡逻 + 爪击突进）和 Wisp（飞行冲撞）。重新进入房间时敌人会刷新，已收集的星尘保留。
- **Boss** — 守门人（The Gatewarden）：砸地、冲锋、跃击震波；第二阶段追加星雨。
- **系统** — 星井检查点、星尘，以及死后帮你找回星尘的 Echo。

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

所有动作都可以在 **设置 → 操作** 里改键。

## 运行方法

### 运行要求

- Windows 10 或 11，64 位
- 约 250 MB 可用磁盘空间
- 键盘，或 Xbox 布局手柄

### 方式一：下载（推荐）

1. 打开 [Releases](../../releases)，下载 `GalaxyCastle_Demo_v0.4_Windows.zip`（想对比的话，v0.1 版本也还在）。
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

## 版本历史

| 版本 | 内容 | 发布 |
| --- | --- | --- |
| **v0.4** | 主菜单、三个存档位、设置与改键、暂停菜单、镜头分区、Lune 脸部重绘 | `v0.4.0` |
| v0.3 | 堕落之门拆成五个连通房间，淡入淡出转场与房间名 | 内部版本 |
| v0.2 | 整体美术翻新：带动画的角色、有质感的关卡、视差背景、特效、跳跃手感 | 内部版本 |
| v0.1 | 首个可玩试玩版——移动、战斗、重力、一个 Boss | `v0.1.0` |

v0.1 与 v0.4 打了标签并发布 Release；v0.2、v0.3 是这中间的内部迭代。完整记录见 [CHANGELOG.md](CHANGELOG.md)。

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
│   ├── ART_GUIDE.md          # 如何用自己画的 PNG 替换任意部件
│   ├── PUBLISHING.md         # 仓库搭建、发版、大文件
│   └── screenshots/
├── tools/
│   ├── gen-banner.ps1        # 重新生成上面两张图
│   ├── split-build.ps1       # 把新导出的 exe 切成 data/*.001–004
│   └── package-release.ps1   # 打包 Release 用的 zip
├── CHANGELOG.md
├── README.md
└── README.zh-CN.md
```

## 美术替换流程

角色、敌人、装饰全部由运行时代码拼装的矢量部件组成。想换成自己画的素材，把透明背景的 PNG 放到 `art/<folder>/<part>.png`（与同名 `.svg` 对应），保持部件的宽高比，转轴放在关节点上即可。[docs/ART_GUIDE.md](docs/ART_GUIDE.md) 列出了每个部件的尺寸、转轴和推荐像素大小，原始 `.svg` 可以直接当描摹模板。

地砖和背景本身就是 PNG，直接覆盖即可（地砖 64 × 64 无缝，背景横向平铺）。

## 技术信息

- [Godot Engine 4.7](https://godotengine.org/) — Windows x64 导出
- 矢量美术由代码生成；音效与两段音乐仍是占位资源

## 后续计划

- [x] v0.1 —— 首个可玩试玩版
- [x] v0.2 —— 美术翻新
- [x] v0.3 —— 五个连通房间
- [x] v0.4 —— 菜单、存档、设置、镜头分区
- [ ] 用手绘素材替换矢量部件（见美术指南）
- [ ] 真实音效与音乐
- [ ] 更多房间、第二个 Boss
- [ ] 代码签名的 Steam 版本

## 已知问题

- 目前仅支持 Windows，暂无 macOS / Linux 版本。
- 程序未签名，首次运行会被 SmartScreen 拦截提示。
- 音效和音乐仍是占位资源，美术是进行中的矢量作品。
- 设置和存档只存在本机，不会云同步。

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
<summary><strong>存档在哪里？</strong></summary>

`%APPDATA%\Godot\app_userdata\Galaxy Castle\saves\` —— 三个槽位各一个文件夹。删掉这个目录就会重置进度。

</details>

<details>
<summary><strong>可以用 Git LFS 代替分片吗？</strong></summary>

可以。Git LFS 把大文件放在普通 Git 历史之外，代价是克隆的人要多装一步。取舍与命令见 [docs/PUBLISHING.md](docs/PUBLISHING.md#working-with-large-binaries)。

</details>

## 反馈

Bug、平衡性建议、“这个镜头手感不对”之类的反馈都欢迎，请开 [issue](../../issues)。源码尚未公开，暂时不接受 pull request。

## 许可

本试玩版**尚未**采用开源许可证。在添加 `LICENSE` 文件之前，游戏本体、代码、美术与音频保留所有权利。
