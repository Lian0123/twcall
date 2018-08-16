# twcall

### 簡介：
一個可以在zhcon上輸入繁體中文的輔助腳本，雖然還是礙於zhcon的受限，部份zhcon輸入法內不含的字依然是無法輸入。

zhcon無法輸入繁體中文的原因是主要是：當我們輸入繁體中文時（Big5編碼），會自動用GBK解碼，主要原因可能出在這程式是由大多數使用簡體中文的人開發的，在加上此程式似乎以停止開發已久造成的。

#### 其本質問題：
若在文件上輸入中文字'壹'，該文字會被轉成'滁'字。在經過比較後可知，這是一個把Big5編碼解析成GBK編碼後的結果。若要解決此問題，則要使其以Big5編碼解析，並轉成UTF8編碼。

#### 而本腳本實做解決此問題的方式：
先將指令寫入檔案（原本被解碼成GBK編碼的Big5編碼會被以Linux終端上的預設UTF8編碼格式寫入至戰存檔），未解決UTF8編碼化問題則需在將此檔案以UTF8格式開啟並轉成GBK編碼格式（此時的編碼則會變回解碼成GBK編碼的Big5格式），這時則要以Big5編碼的方式打開此檔案並轉成UTF8格式，才可以變成能被實體終端機接受的UTF8編碼格式。

### 安裝方式：
```
./install
```

#### 相依程式：
* zhcon：終端機中文顯示與輸入的程式
* iconv：編碼轉換用的程式

#### 安裝檔案：
* ~/twcall/twcall.sh：
twcall的主程式

* ~/twcall/.twcall.tmp：
暫存指令轉碼用檔案

* ~/.zhconrc：
改過後以Big5編碼為基準且設定成注音輸入法的設定檔

建議將~/.zhconrc檔案中的 x_resolution = 800 與 y_resolution = 640 手動改成您螢幕的解析度


#### 變更檔案：
* ~/.bashrc：

新增alias zhcon='zhcon --utf8'規則

新增alias twcall='~/twcall/twcall.sh'規則

### 開啟實體終端方式：

#### 1.按下[ctrl]+[alt]+[F1~F6]
切換到實體終端（返回GUI則應該是固定在[ctrl]+[alt]+[F8]）

#### 2.登入實體終端
輸入帳戶名與密碼

#### 3.啟動zhcon
zhcon

#### 4.[ctrl]+[space]
切換中文輸入與英文輸入

### 使用twcall：
```
twcall <commands>
```

### 使用twcall範例：

#### 範例一：
```
#"cat 資料.txt"指令
#↓你因為亂碼而輸入的指令[示意]
twcall cat 戈?.txt

#轉成正確編碼後在詢問是否要執行：
cat 資料.txt
確定執行以下動作：(y/n)
#按下Y/y後，執行此指令
```
#### 範例二：
```
#"cd 資料夾"指令
#↓你因為亂碼而輸入的指令[示意]
twcall cd 戈(R)AE?

#轉成正確編碼後在詢問是否要執行：
#cd 因cd是呼叫在子程序，故需調用exec bash
cd 資料夾
exec bash
確定執行以下動作：(y/n)
#按下Y/y後，執行此指令

```

#### 開發測試環境：
Linux發行版：Linux mint 18.3(基於：Ubuntu 16.04)

Linux核心版本：x86_64 Linux 4.15.0-30-generic

zhcon版本：0.2.6

### 總結：
我還是去用fbtrem吧......（崩潰）

本腳本應該不會再進行更新，主要還是以追根究底的精神，解決無法在zhcon繁體中文輸入的問題

### 參考資料：
[Bash取得所有args](https://stackoverflow.com/questions/4824590/propagate-all-arguments-in-a-bash-shell-script)

[清空檔案相關](https://blog.longwin.com.tw/2013/03/bash-shell-set-file-null-2013)

[iconv轉換相關](https://blog.csdn.net/a280606790/article/details/8504133)

[cd指令調動相關](https://askubuntu.com/questions/84279/how-to-change-directory-using-script)


