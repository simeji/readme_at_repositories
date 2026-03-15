# readme_at_repositories

Redmine プラグイン。リポジトリタブの先頭に README.md の内容を表示する。

## 開発環境

### Ruby バージョン

`.ruby-version` に `3.1.6` が指定されている。必ず `/opt/rbenv/versions/3.1.6/bin` を PATH に追加して使う。

### Redmine サーバー起動

```bash
cd /home/user/redmine
PATH=/opt/rbenv/versions/3.1.6/bin:$PATH bundle exec ruby bin/rails server -d -p 3000 -e development
```

アクセス URL: `http://localhost:3000/`

### DB マイグレーション（初回・スキーマ変更時）

```bash
cd /home/user/redmine
PATH=/opt/rbenv/versions/3.1.6/bin:$PATH bundle exec rake db:migrate RAILS_ENV=development
```

## プラグイン配置先

```
/home/user/redmine/plugins/readme_at_repositories/
```

## ブランチ運用

- 作業ブランチ: `claude/review-weekly-issues-eACiI`
- push: `git push -u origin claude/review-weekly-issues-eACiI`
