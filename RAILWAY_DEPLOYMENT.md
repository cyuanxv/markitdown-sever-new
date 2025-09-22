# Railway 部署指南

本文档提供了如何在 Railway 平台上部署 MarkItDown 项目的详细说明。

## 前提条件

1. 一个 Railway 账户
2. 已将项目代码推送到 GitHub 仓库
3. OpenRouter API 密钥
4. Azure Document Intelligence 服务的端点和 API 密钥

## 部署步骤

### 1. 在 Railway 上创建新项目

1. 登录 Railway 平台 (https://railway.app/)
2. 点击 "New Project" 按钮
3. 选择 "Deploy from GitHub repo"
4. 选择包含 MarkItDown 代码的 GitHub 仓库
5. Railway 将自动检测 Dockerfile 并使用它来构建项目

### 2. 配置环境变量

在 Railway 控制台中，为项目配置以下环境变量：

```
OPENROUTER_API_KEY=your_api_key_here
OPENROUTER_MODEL=openai/gpt-4-turbo
AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT=your_azure_endpoint_here
AZURE_API_KEY=your_azure_api_key_here
PORT=5000
```

> **注意**：Railway 会自动设置 `PORT` 环境变量，但为了确保兼容性，建议显式设置为 5000。

### 3. 配置构建设置

Railway 将自动检测项目中的 Dockerfile 并使用它来构建应用。确保 Dockerfile 中的所有依赖项都已正确安装。

### 4. 部署应用

1. 完成环境变量配置后，Railway 将自动开始构建和部署过程
2. 等待构建和部署完成
3. 部署完成后，Railway 将提供一个公共 URL，可以通过该 URL 访问应用

### 5. 验证部署

1. 访问 Railway 提供的 URL
2. 尝试上传文件或提供 URL 进行转换，确保应用正常工作
3. 检查 Railway 日志，确保没有错误

## 持续部署

Railway 支持持续部署。每当您向 GitHub 仓库推送更改时，Railway 将自动重新构建和部署应用。

## 故障排除

### 常见问题

1. **应用无法启动**：检查环境变量是否正确配置，特别是 API 密钥和端点 URL。

2. **文件上传失败**：确保 Railway 实例有足够的存储空间，并且上传文件夹有正确的权限。

3. **依赖项问题**：如果遇到依赖项相关的错误，请检查 Dockerfile 和 requirements.txt 文件，确保所有必要的依赖项都已列出。

### 查看日志

在 Railway 控制台中，您可以查看应用的日志以帮助诊断问题：

1. 导航到您的项目
2. 点击 "Deployments" 选项卡
3. 选择当前部署
4. 点击 "Logs" 查看应用日志

## 资源扩展

如果您的应用需要更多资源，可以在 Railway 控制台中调整资源分配：

1. 导航到您的项目
2. 点击 "Settings" 选项卡
3. 在 "Resources" 部分调整 CPU、内存和存储设置

## 其他注意事项

- 确保您的 OpenRouter API 密钥和 Azure API 密钥有足够的配额来处理预期的请求量
- 考虑为生产环境设置自定义域名
- 定期监控应用性能和资源使用情况