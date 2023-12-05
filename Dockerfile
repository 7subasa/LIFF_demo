# ApacheとNode.jsを含むベースイメージを使用
FROM httpd:2.4

# Node.jsとnpmをインストール
RUN apt-get update && \
    apt-get install -y nodejs npm

# Netlify CLIをグローバルにインストール
RUN npm install -g netlify-cli

# publicディレクトリをコンテナのApacheサーブディレクトリにコピー
COPY ./public/ /usr/local/apache2/htdocs/

# コンテナ起動時に依存パッケージをインストール
WORKDIR /usr/local/apache2/htdocs/
RUN npm install

# 通常のApacheスタートアップコマンド
CMD ["httpd-foreground"]
