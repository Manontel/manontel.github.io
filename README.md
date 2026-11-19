# 张振霄的个人学术主页

[English](https://manontel.github.io/) · [中文](https://manontel.github.io/zh/)

基于 [al-folio v0.16.3](https://github.com/alshedivat/al-folio/tree/v0.16.3) 定制。沿用其 Jekyll 页面布局、jekyll-scholar 书目和代表作筛选，重做了双语导航、首页和论文排版。模板许可见 `LICENSE-al-folio`。

## 本地预览

在项目目录的 PowerShell 中运行 `.\preview.ps1`，打开 [英文首页](http://127.0.0.1:4000/) 或 [中文首页](http://127.0.0.1:4000/zh/)。脚本用 Python 服务已有的 `_site`，按 Ctrl+C 关闭。默认端口被占用时可运行 `.\preview.ps1 -Port 4001`。

修改源文件后，用 `wsl -d Ubuntu -- bundle exec jekyll build` 更新正在预览的站点，然后刷新浏览器。重新启动服务并构建可用 `.\preview.ps1 -Rebuild`。在装有 Ruby 和 Bundler 的其他环境中，首次运行 `bundle install`，随后用 `bundle exec jekyll serve` 启动带自动构建的开发服务。

## 内容维护

- `_bibliography/papers.bib` 是中英文论文页的共同来源。期刊论文使用 `@article`，预印本使用 `@unpublished`。首页图文主项标为 `selected = {lead}`，下方文字条目标为 `selected = {true}`。对应的图源、图注与双语研究介绍放在 `_data/research.yml` 中，以 BibTeX 键关联。
- 有共同一作时，在对应的 BibTeX 条目中填写人数，例如 `equal_contributors = {2}` 会在前两位作者姓名后加星号。中英文论文页沿用同一组标记。
- `_data/site_text.yml` 保存个人简介与导航文字，`_data/methods.yml` 保存计算工作，`_data/talks.yml` 保存报告。根目录的 `CV.pdf` 直接作为简历下载。
- `_layouts/` 与 `_includes/` 保存页面模板，`assets/css/site.css` 定义版式和颜色。图片与字体位于 `assets/`，页面可以离线显示。

首页主图 `assets/img/ep-s10b.svg` 取自 Zhen-Xiao Zhang、Chen Lan 与 Yi Wang 的 *Identifying Exceptional Points in Black Hole Ringdowns*。它由 PDF 第 27 页的 Fig. S10(b) 原始矢量面板转换而成。[论文原图](https://arxiv.org/pdf/2610.01416v1#page=27) · [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

研究栏目三幅配图为主题示意，其中势垒图绘出 Schwarzschild 黑洞四极微扰的轴向与极向有效势。首页衬线文字优先使用 Georgia 和宋体，导航使用随站点提供的 DM Sans。

## GitHub Pages

将改动推送到 `main` 后，在 [Publish academic site](https://github.com/Manontel/manontel.github.io/actions/workflows/pages.yml) 中选择 Run workflow 发布。工作流用 Jekyll 构建中英文页面并部署到 GitHub Pages。
