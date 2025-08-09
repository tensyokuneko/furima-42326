#!/usr/bin/env bash
# exit on error         ← エラーが出たら止める
set -o errexit

bundle install          
bundle exec rake assets:precompile  
bundle exec rake assets:clean       
bundle exec rake db:migrate         
