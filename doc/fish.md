# fishへの移行

ref [fish shell を使いたい人生だった ｜ Developers.IO](https://dev.classmethod.jp/etc/fish-shell-life/)

```
brew install fish
```
fishインストール
```
fish -v
> fish, version 2.7.1
```

末尾に `/usr/local/bin/fish` を追加
```
sudo vi /etc/shells
```

デフォルトシェルを fish に変更
```
chsh -s /usr/local/bin/fish
```

shellを再起動
fishのためのプラグインマネージャ追加
```
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
```

```
fisher -v
> fisherman version 2.13.2 ~/.config/fish/functions/fisher.fish
```

プラグイン系インストール

### fisher install z
```
fisher install z
```

### fisher install 0rax/fish-bd
```
fisher install 0rax/fish-bd
```

### peco + plugin-peco
```
brew install peco
fisher oh-my-fish/plugin-peco
```

`~/.config/fish/config.fish`の作成
```
vi ~/.config/fish/config.fish
```
```
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end
```
shellを再起動

### fisher oh-my-fish/plugin-balias
```
fisher oh-my-fish/plugin-balias
```

`~/.config/fish/config.fish`のキーバインドの下あたりに追記
```
balias g git 
```
