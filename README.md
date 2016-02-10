# Gh::Client

Github Enterprise Ruby Client Library

## Usage

```ruby
# クライアント設定
client = Gh::Client.new 'user', 'password'
client.open owner: 'gio-stand-pri', repository: 'gspcp'

# issue一覧取得
issues = client.issues
issues.each do |issue|
  puts issue.title
end

# issue情報取得
issue = client.issue 514
puts issue.title
```
