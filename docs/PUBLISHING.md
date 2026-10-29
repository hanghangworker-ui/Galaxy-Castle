# 发布与仓库维护指南

面向仓库维护者。**这款游戏目前只有 Windows 版本的试玩 demo，源码尚未公开**，仓库里放的是"分片形式的可执行文件 + 文档"。

## 当前仓库状态

| 项目 | 内容 |
| --- | --- |
| 仓库 | `https://github.com/hanghangworker-ui/Galaxy-Castle` |
| 默认分支 | `main` |
| 标签 | `v0.1.0`（首个公开版本）、`v0.4.0`（第二个公开版本）、`v0.10.0`（第三个公开版本） |
| 仓库体积 | 约 120 MB（v0.10 的 11 个分片 + 文档），未启用 LFS |

## 一、仓库描述（About 那一栏）

打开仓库首页 → 右侧 **About** → 点齿轮 **Edit** → 把文案粘进 **Description**（上限 350 字符）→ 顺便填 **Website** 和 **Topics** → *Save changes*。

**英文（260 字符）：**

```
Galaxy Castle — a ~90-minute 2D action-platformer demo. 37 rooms, false walls you hear before you see, Orbit Rail fast travel and a Silksong-style map. v0.10 adds the Garrison and two challenge rooms. Godot 4.7 · Windows x64.
```

**中文（112 字符，想换成中文就整段替换）：**

```
《银河城堡》试玩版 v0.10 —— 约 90 分钟的 2D 动作平台游戏：37 个房间、会"响"的伪墙、轨道快传与类空洞骑士地图。新增驻防区与两个挑战房。Godot 4.7，Windows 64 位。
```

**Topics（逐个输入后回车）：**

```
godot  godot4  gamedev  platformer  2d-game  action-platformer  indie-game  demo  windows  pixel-art
```

> 描述只在 350 字符以内才有意义，首屏大约只显示前 100–160 字符（手机更少），所以第一句必须说清楚"这是什么、多长、什么平台"。

## 二、发一个新版本（v0.11 及以后）

假设你已经从 Godot 重新导出了 `GalaxyCastle.exe`：

1. **切分新的 exe**（替换仓库里的 11 个分片）：

   ```powershell
   .\tools\split-build.ps1 -Exe 'D:\导出\GalaxyCastle.exe' -PartSizeMB 10
   ```

   脚本会把 exe 切成 `data/GalaxyCastle.exe.001-0NN` 并核对总字节数（默认 10 MB 一片；exe 在 100 MB 上下时用 10 MB，更大可自动换 27 MB 的 v0.1–v0.4 分法）。

2. **改 `play.bat` 的分片列表**：`for %%P in (...)` 与 `copy /b` 的行必须列出**全部**分片号（当前是 001–011；如果分片数变了，两处都要同步改，并跑一次三分支测试：缺分片、正常、exe 缺失）。

3. **把 exe 本身放到仓库根目录**（`play.bat` 需要它；它已在 `.gitignore` 里，不会被提交）。

4. **改版本号**：`README.md` / `README.zh-CN.md` 的标题与新版本段落、`CHANGELOG.md` 顶部新增一节、`tools/gen-banner.ps1` 的 `$DemoLabel` 与随机种子、`tools/package-release.ps1` 与 `tools/create-release.ps1` 的默认 `-Version`。

5. **提交并打标签**：

   ```powershell
   git add -A
   git commit -m "Galaxy Castle - playable demo v0.11"
   git tag -a v0.11.0 -m "Galaxy Castle v0.11.0"
   git push origin main --tags
   ```

6. **发 Release**：GitHub → Releases → *Draft a new release* → 选刚推上去的标签 → 用 `.\tools\package-release.ps1 -Version 0.11` 生成的 zip 作附件；或者走纯终端：

   ```powershell
   $env:GITHUB_TOKEN = 'ghp_...'   # 本会话临时 token，别写进文件
   .\tools\create-release.ps1 -Version 0.11   # 默认找 docs/release-notes-v0.11.0.md
   ```

   > 分片形式的仓库克隆下来也能直接玩（`play.bat` 会拼），Release 的 zip 只是给不想用 git 的人准备的单文件下载。

7. **改 About 里的描述**：把 `v0.10` 换成新版本号，重新数一遍字符（PowerShell：`'文案'.Length`）。

## 三、大文件：GitHub 的限制

| 限制 | 数值 | 本仓库怎么处理 |
| --- | --- | --- |
| 单文件硬上限 | **100 MiB** | exe 110,654,512 B → 切成 11 个 ≈10 MB 的分片（v0.1–v0.4 用 4 个 ≈27 MB 的） |
| 单文件推荐上限 | **50 MiB** | 分片与截图都在范围内 |
| 单次 push 上限 | **2 GiB** | 一次提交约 120 MB |
| 仓库建议上限 | **1 GiB** | 目前约 120 MB（历史累计） |

**替代方案：Git LFS**（想保留单个 110 MB 的 exe 时用）

```bash
git lfs install
git lfs track "*.exe"
git add .gitattributes
```

代价：每个克隆的人都要装 Git LFS，且免费额度只有 1 GiB 存储 / 1 GiB 月流量。对这个项目来说，分片方案更省事。

## 四、其他设置

- **社交预览图**：仓库 → Settings → General → *Social preview* → 上传 `docs/social-preview.png`（1280×640）。分享链接时显示的就是它。
- **主题**：Settings → General → *Default branch* 保持 `main`；仓库根目录别放 `README.txt` 之流，`README.md` 会自动成为首页。
- **话题/许可证**：许可证要等决定开源方式再加 `LICENSE` 文件；在那之前 README 已写明"保留所有权利"。
- **提交信息**：这个仓库保持 `Galaxy Castle - <一句话>` 的格式，版本号记在标签和 CHANGELOG 里。

## 五、需要一个"还原点"时

标签就是还原点：

```powershell
git fetch --tags                 # 拉取标签
git tag                          # 列出所有标签
git show v0.4.0 --stat          # 看某一版改了哪些文件
git checkout v0.4.0             # 临时回到 v0.4（只读，别在这上面提交）
git switch main                 # 回来
```

彻底回退到 v0.4（历史保留）：

```powershell
git revert --no-commit v0.4.0..HEAD
git commit -m "Galaxy Castle - roll back to demo v0.4"
```
