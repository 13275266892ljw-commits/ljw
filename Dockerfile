# 1. 选择基础镜像（Python 3.9为常用版本，可根据项目调整）
FROM python:3.9-slim

# 2. 设置工作目录
WORKDIR /app

# 3. 复制项目依赖文件（若有requirements.txt，需先在仓库中创建）
COPY requirements.txt .

# 4. 安装依赖（根据AI框架添加对应包，如tensorflow/pytorch）
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install tensorflow==2.15.0  # 示例：安装TensorFlow，可替换为PyTorch等

# 5. 复制项目所有代码到容器
COPY . .

# 6. 暴露服务端口（与云托管的服务端口一致，如80）
EXPOSE 80

# 7. 启动项目（替换为你的主程序入口，如app.py）
CMD ["python", "app.py"]
