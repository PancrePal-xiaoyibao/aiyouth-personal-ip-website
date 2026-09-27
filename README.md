# 李帅帅个人 IP 网站

这是个人 IP 网站的静态页面项目，定位为「儿科医生 × AI Builder」的公开主页。

## 内容

- `index.html`：网站页面
- `assets/`：页面配图
- `运营/简报/`：已经发布或准备发布到个人网站的 AI 前沿与医疗 AI 简报
- `运营/流程/`：公开内容同步与发布流程说明

## 本地预览

直接用浏览器打开 `index.html`，或在项目目录运行任意静态文件服务器。

## 更新公开内容

简报由工作区根目录的本地流水线生成。生成后运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\运营\流程\同步公开简报.ps1
```

脚本只复制 `ai-hot-briefing-YYYY-MM-DD.html` 和 `ai-med-briefing-YYYY-MM-DD.html`，不会复制日志、账号状态、缓存或运行时数据。

## 发布边界

仓库只包含公开页面、图片和文档，不包含密钥、账号、部署凭证或本地运行数据。
