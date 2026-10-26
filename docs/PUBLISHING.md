# 发布与维护指南

这份文件只给仓库维护者看：怎么把这个文件夹推上 GitHub、怎么发版、以后更新版本要做什么。
玩家只需要看 [README.md](../README.md)。

---

## 1. 这个文件夹做了什么改动

原来的结构：

```
GalaxyCastle_Demo_v0.1/
├── GalaxyCastle.exe            110 MB
├── Play Galaxy Castle.bat
├── README.txt
└── data/  (4 个分片)
```

现在的结构：

```
GalaxyCastle_Demo_v0.1/        ← 就是仓库根目录
├── .gitattributes             统一换行符、标记二进制文件
├── .gitignore                 忽略生成物和系统垃圾文件
├── README.md                  英文主说明（GitHub 首页会显示它）
├── README.zh-CN.md            中文说明
├── CHANGELOG.md               版本记录
├── play.bat                   启动器（原来的 "Play Galaxy Castle.bat"）
├── GalaxyCastle.exe           首次运行自动生成，不提交
├── data/                      4 个分片，提交
├── docs/
│   ├── banner.png             README 顶部横幅
│   ├── social-preview.png     仓库分享卡片（1280×640）
│   ├── PUBLISHING.md          本文件
│   └── screenshots/           截图放这里
└── tools/
    ├── gen-banner.ps1         重新生成横幅
    ├── split-build.ps1        把新导出的 exe 切成 4 份
    └── package-release.ps1    打 Release 用的 zip
```

三个关键决定：

1. **exe 拆成 4 份放在 `data/`**。GitHub 拒绝大于 100 MB 的单个文件，而这个 Godot 导出是 105 MB。
   每份约 27 MB，`play.bat` 在首次启动时把它拼回去。
2. **拼好的 `GalaxyCastle.exe` 不提交**。它和四个分片内容完全一样，提交只会让仓库体积翻倍，
   所以写进了 `.gitignore`。
3. **文件名去掉空格**（`Play Galaxy Castle.bat` → `play.bat`）。带空格的路径在命令行、
   URL 和别人的脚本里都要额外转义，GitHub 上容易出问题。

---

## 2. 在 GitHub 上新建仓库

打开 <https://github.com/new>，也就是你截图里的那一页，然后照这样填：

| 字段 | 填什么 |
| --- | --- |
| **Owner** | `hanghangworker-ui` |
| **Repository name** | `Galaxy Castle` → 实际会创建成 `Galaxy-Castle` |
| **Description** | 粘贴下面 3.1 里的文字 |
| **Visibility** | `Public` |
| **Add README** | **关闭**（本地已有 README.md） |
| **Add .gitignore** | **No .gitignore**（本地已有） |
| **Choose a license** | **不选**（见第 6 节） |

> 三个初始化选项一定要关掉。如果让 GitHub 先生成 README 或 .gitignore，
> 第一次 `git push` 会因为历史不同而被拒绝，还得手动 merge。

### 2.1 仓库描述（Description，上限 350 字符）

英文版（204 字符，推荐，和仓库内容语言一致）：

```
Galaxy Castle — a 10–15 minute 2D action-platformer demo: dash, parry, and flip gravity to fight on the ceiling, then face the Gatewarden boss. Made with Godot 4.7 for Windows x64. v0.1 "The Fallen Gate".
```

中文版（103 字符，想面向中文玩家就用这段）：

```
《银河城堡》——约 10–15 分钟的 2D 动作平台游戏试玩版：冲刺、弹反、翻转重力在天花板战斗，最终挑战守门人 Boss。使用 Godot 4.7 制作，Windows 64 位。v0.1「堕落之门」。
```

### 2.2 Topics（仓库标签）

在仓库首页右侧 **About** 的齿轮里，把这些标签加进去：

```
godot  godot-engine  2d-platformer  action-platformer  indie-game  game-demo  windows  singleplayer  boss-fight
```

---

## 3. 推送本地仓库

本地已经执行过 `git init` 并做好了第一个提交（提交信息：
`Galaxy Castle — first playable demo v0.1 (The Fallen Gate)`）。所以现在只需要：

```bash
cd "D:\银河城堡游戏\GalaxyCastle_Demo_v0.1"
git remote add origin https://github.com/hanghangworker-ui/Galaxy-Castle.git
git branch -M main
git push -u origin main
```

首次推送约 105 MB（4 个分片），根据网速可能要几分钟。

**认证方式**（选一个）：

- **GitHub Desktop**：最省事，登录后 `Add local repository` 选这个文件夹，再 `Publish`。
- **命令行 + Personal Access Token**：GitHub → Settings → Developer settings →
  Personal access tokens，勾 `repo` 权限，推送时把 token 当密码填。
- Windows 一般会弹出 Git Credential Manager 的浏览器登录窗口，直接登录即可。

如果本地还没初始化（比如你换了台电脑），执行：

```bash
git init -b main
git add .
git commit -m "Galaxy Castle — first playable demo v0.1 (The Fallen Gate)"
```

推送前可以用 `git status` 确认 **没有** `GalaxyCastle.exe`、`dist/`、`*.zip` 出现在待提交列表里。

---

## 4. 发布一个 Release（给玩家的下载入口）

玩家不用装 git 也能玩：

```powershell
pwsh -File tools/package-release.ps1
```

会生成 `dist/GalaxyCastle_Demo_v0.1_Windows.zip`（约 105 MB，里面已经拼好了 exe）。

然后：

1. 仓库页 → **Releases** → **Draft a new release**
2. **Choose a tag** 输入 `v0.1.0` → *Create new tag on publish*
3. **Release title**：`Galaxy Castle — Demo v0.1 "The Fallen Gate"`
4. 描述直接贴 README 里 *What's in the demo* 的那几条
5. 把 zip 拖到附件区
6. **Publish release**

> `dist/` 和 `*.zip` 已经在 `.gitignore` 里，别把压缩包提交进仓库。

> 顺序很重要：**先推代码，再发 Release**。在第一个 Release 发布之前，README 里的 Releases 链接还没有东西可下载；等 Release 发好之后，再把仓库地址发给别人。

---

## 5. 以后更新版本

1. 在 Godot 里重新导出 Windows 版 `GalaxyCastle.exe`
2. 重新切分：

   ```powershell
   pwsh -File tools/split-build.ps1 -Exe "C:\路径\GalaxyCastle.exe"
   ```

   脚本会清掉旧的 `data/GalaxyCastle.exe.00*` 再写入新的分片。
3. 更新 `CHANGELOG.md`，以及 README 里出现的版本号
4. 提交并打标签：

   ```bash
   git add -A
   git commit -m "Demo v0.2"
   git tag -a v0.2.0 -m "Demo v0.2"
   git push origin main --tags
   ```

5. 重复第 4 节，发布新的 Release

---

## 6. 许可证

仓库目前**没有** `LICENSE` 文件，也就是默认保留所有权利，别人不能合法地复用代码或素材。
如果要开源，在 GitHub 创建仓库时选一个，或本地加 `LICENSE` 文件，常见组合：

- 代码：MIT / Apache-2.0
- 美术、音乐、音效：CC BY-NC 4.0（允许转载、禁止商用）或 CC BY 4.0

加完之后记得更新 README 底部的 *License* 一节。

---

## Working with large binaries

这是中文读者最常踩的坑，英文标题方便检索。

| GitHub 限制 | 数值 |
| --- | --- |
| 单个文件警告 | 50 MB |
| 单个文件硬上限（拒绝推送） | 100 MB |
| 仓库建议上限 | 1 GB |

当前仓库：4 × 26.7 MB ≈ 107 MB，刚超过"建议"线但完全可用。

每发一个新版本，Git 历史里会再增加约 107 MB——几个版本之后仓库会明显变重。
三种处理方式：

**A. 保持现状（简单）**
适合试玩版阶段，玩家 `git clone` 一次 100 多 MB 也能接受。

**B. 改用 Git LFS（大文件不进普通历史）**

```bash
git lfs install
git lfs track "data/*"
git add .gitattributes
git add data
git commit -m "Track demo build with Git LFS"
```

注意：Git LFS 免费额度是 1 GB 存储 + 每月 1 GB 流量，超了要付费；
而且克隆的人必须先装 `git-lfs`，否则只会拿到指针文件。**在已经提交过大文件之后再改 LFS 需要重写历史**，
所以最好一开始就决定。

**C. 构建物只放 Release（最干净）**
仓库只留 README、文档和以后公开的源码，玩家从 Releases 下载 zip。
缺点是 `git clone` 之后不能直接玩。

---

## 7. 仓库设置建议

- **About**：填描述 + topics，有官网/Steam 页就填 Website
- **Settings → Social preview**：上传 `docs/social-preview.png`（1280×640）
- **Settings → Features**：Issues 打开（收集反馈），Wiki、Projects 关掉
- **Settings → General → Danger Zone**：不要手滑删库 :)
