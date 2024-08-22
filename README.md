# EKS 練習用の VPC & 関連リソース 作成
このTerraformプロジェクトは、EKSクラスターを作成する際に使用するVPCおよび関連リソースをあらかじめ作成するためのものです。学習用に設計されていますので、EKS環境を試す際にご利用ください。

## 初期設定
まず、Terraformの初期化を行います。

```sh
terraform init
```

## 操作
### 設定の確認
リソースの作成前に、どのような変更が行われるかを確認できます。

```sh
terraform plan
```

### リソースの作成
以下のコマンドでリソースを作成します。

```sh
terraform apply
```

### リソースの削除
作成したリソースを削除するには、次のコマンドを使用します。

```sh
terraform destroy
```

## プロファイルを指定する場合
特定のAWSプロファイルを使用する場合は、以下のように環境変数`AWS_PROFILE`を指定してコマンドを実行してください。

```sh
AWS_PROFILE=admin terraform apply
```

同様に、`plan` や `destroy` の際も `AWS_PROFILE=admin` を付けて実行できます。


## LICENSE
このプロジェクトはMITライセンスのもとで公開されています。  
詳細は [LICENSE](./LICENSE) ファイルをご覧ください。

