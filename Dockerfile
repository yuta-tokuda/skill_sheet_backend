# ベースイメージとして Ruby を使用
FROM ruby:3.3.3

# Node.js と Yarn をインストール
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs
RUN npm install -g yarn

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# アプリケーションのディレクトリを作成
RUN mkdir /skill_sheet_backend
WORKDIR /skill_sheet_backend

# Gemfile および Gemfile.lock を追加
COPY Gemfile /skill_sheet_backend/Gemfile
COPY Gemfile.lock /skill_sheet_backend/Gemfile.lock

# bundle install を実行
RUN bundle install

# アプリケーションのソースコードを追加
COPY . /skill_sheet_backend