#!/usr/bin/env bash
# exit on error         ← エラーが出たら止める
set -o errexit

bundle install          ← Gem（ライブラリ）をインストール
bundle exec rake assets:precompile  ← CSSやJavaScriptをまとめて準備
bundle exec rake assets:clean       ← 古いアセットを削除
bundle exec rake db:migrate         ← データベースにテーブルを作る
