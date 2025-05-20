# VitalInsight

## 项目简介
一个基于 Spring Boot 2.7.18 、 Mybatis-Plus、 JWT、Spring Security、Redis、Vue 的前后端分离的 Web 系统

## Notice ❗️❗️

### Tesseract

- 本项目**体检报告解析模块**依赖于`Tesseract-OCR`

1. Install Tesseract-OCR

- MacOS 用户可以使用 `Homebrew` 安装：

```bash
brew install tesseract
```
- Ubuntu 用户可以使用 `apt` 安装：

```bash
sudo apt install tesseract-ocr
```

2. Tesseract language data
   
本项目已经将**中英文**的语言数据放在了 `VitalInsight/tessdata` 目录下。如果您需要其他语言，请将对应的语言数据文件放在该目录下，并在`application.yml` 中的 `tesseract.lang` 属性中指定语言代码。

3. Tesseract Library Path

将库`libtesseract.dylib`路径添加到环境变量中。在 `application.yml` 中配置：

```yaml
tesseract:
  libpath: /opt/homebrew/lib
```

## 项目结构
项目采用按功能分模块的开发方式，结构如下

- `VitalInsight-common` 为系统的公共模块，各种工具类

- `VitalInsight-system` 为系统核心模块也是项目入口模块

- `VitalInsight-logging` 为系统的日志模块

- `VitalInsight-tools` 为第三方工具模块

- `VitalInsight-health` 为系统的健康体检模块，提供了体检报告的解析与展示

## 详细结构

```
- VitalInsight-common 公共模块
    - annotation 为系统自定义注解
    - aspect 自定义注解的切面
    - base 提供了 Entity 基类
    - config 项目通用配置
        - Mybatis-Plus 配置
        - Web配置跨域与静态资源映射、Swagger配置，文件上传临时路径配置
        - Redis配置，Redission配置, 异步线程池配置
        - 权限拦截配置：AuthorityConfig、Druid 删除广告配置
    - exception 项目统一异常的处理
    - utils 系统通用工具类，列举一些常用的工具类
        - BigDecimaUtils 金额计算工具类
        - RequestHolder 请求工具类
        - SecurityUtils 安全工具类
        - StringUtils 字符串工具类
        - SpringBeanHolder Spring Bean工具类
        - RedisUtils Redis工具类
        - EncryptUtils 加密工具类
        - FileUtil 文件工具类
- VitalInsight-system 系统核心模块（系统启动入口）
    - sysrunner 程序启动后处理数据
	- modules 系统相关模块(登录授权、系统监控、定时任务、系统模块、运维模块)
- VitalInsight-logging 系统日志模块
- VitalInsight-generator 系统代码生成模块
- VitalInsight-Health 健康体检模块
```

## 特别鸣谢

- 感谢 [PanJiaChen](https://github.com/PanJiaChen/vue-element-admin) 大佬提供的前端模板

- 感谢 [Moxun](https://github.com/moxun1639) 大佬提供的前端 Curd 通用组件

- 感谢 [zhy6599](https://gitee.com/zhy6599) 大佬提供的后端运维管理相关功能

- 感谢 [j.yao.SUSE](https://github.com/everhopingandwaiting) 大佬提供的匿名接口与Redis限流等功能

- 感觉 [elunez](https://github.com/elunez) 原作者提供的整体框架构思
