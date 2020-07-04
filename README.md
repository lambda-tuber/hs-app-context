# モナドでAppContext
___全15回予定(2020.05-2020.07)___

第13回で、Stackテンプレートの使い方を紹介しています。  
先に、お手元に、AppContextのプロジェクトを作成してからビデオを観て頂く方が、
コードが追っかけやすいと思います。


## 第1回 ☆初回☆ モナドでAppContext
### ◇概要
Haskellの動画連載シリーズ第3弾！！
モナド変換を使って、アプリケーションコンテキストとなるモナドを作成してみます。
今回は、Maybeモナドの振る舞いを見ていきましょう。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/oavuC8fEg1I/0.jpg)](https://youtu.be/oavuC8fEg1I)


## 第2回 MaybeTでモナド変換
### ◇概要
今回は、MaybeTでIOとMaybeモナドを融合し、プリントデバッグしてみます。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/Ataaqr7MCMo/0.jpg)](https://youtu.be/Ataaqr7MCMo)


## 第3回 EitherなのにExceptT?
### ◇概要
前回まで、Maybeモナドとそのモナド変換しをみてきましたが、AppContextとしては使いにくそうなので、今回は、Eitherモナドを見ていきたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/GJ-44ZrFWxI/0.jpg)](https://youtu.be/GJ-44ZrFWxI)


## 第4回 Applicationの雛形
### ◇概要
今回は、モジュール構成を整えつつ、アプリケーションコンテキストを使うかたちで、アプリ作成の雛型を用意しておきたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/8G25kw1twsw/0.jpg)](https://youtu.be/8G25kw1twsw)



## 第5回 MonadLoggerでロギング
### ◇概要
今回は、プリントデバッグしていた箇所を、ロギングできるようにして、ログ出力していきたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/YRaWAX4vf9g/0.jpg)](https://youtu.be/YRaWAX4vf9g)



## 第6回 大域変数を組み込む
### ◇概要
今回は、ReaderTにより、読み取り専用のグローバル変数をAppContextに組み込みたいと思います。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/jsujZhd1YBk/0.jpg)](https://youtu.be/jsujZhd1YBk)


## 第7回 ReaderTにMVarって!?
### ◇概要
今回は、若干、反則なような気がしますが、ReaderTに、MVarを持たせて、値の書き換えやってしまいます。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/nrWthpU9IBc/0.jpg)](https://youtu.be/nrWthpU9IBc)


## 第8回 ReaderT + StateT
### ◇概要
今回は、変更可能なデータを扱う方法として、StateTを見ていきたいと思います。

### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/NAQB4ne3KZI/0.jpg)](https://youtu.be/NAQB4ne3KZI)


## 第9回 オブジェクトの隔離
### ◇概要
今回は、閑話です。
AppContextを、若干、むりやり、オブジェクト指向にこじつけてみます。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/svdabZ8Q1RM/0.jpg)](https://youtu.be/svdabZ8Q1RM)


## 第10回 実行時引数の取込み
### ◇概要
今回から、数回にわたって、アプリに必要な機能を取り込んでいきたいと思います。
まずは、実行時引数の取込みです。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/OdyXNQhYUV4/0.jpg)](https://youtu.be/OdyXNQhYUV4)


## 第11回 設定ファイルの取込み
### ◇概要
前回は、実行時引数で、設定ファイルを指定できるようにしましたので、
今回は、その設定ファイルを読み込んでいきましょう。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/tq5zjfxdNzI/0.jpg)](https://youtu.be/tq5zjfxdNzI)


## 第12回  HSpecによる試験環境
### ◇概要
今回は、HSpecの試験環境を準備してみたいと思います。
早速、コーディングしていきましょう。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/Vy9yrByf7F4/0.jpg)](https://youtu.be/Vy9yrByf7F4)


## 第13回Stack Templateの準備
### ◇概要
今回は、これまでつくってきたアプリケーションコンテキストを、GitHubにおきましたのでリポジトリを紹介します。
### ◇動画
[![hs-state-pattern](http://img.youtube.com/vi/fekb301oyKg/0.jpg)](https://youtu.be/fekb301oyKg)


