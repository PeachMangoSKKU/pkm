---
title: "Rime Input Method Engine"
---

# 中州韻輸入法引擎

我是用注音輸入法，一直以來都使用 MacOS Big Sur 中的內建的注音輸入法，但真的越來越慢，慢到真的受不了了...

找個時間收尋並且嘗試了一下其他支援 MacOS 中的注音輸入法, 包含了

- [Yahoo輸入法](https://github.com/zonble/ykk_installer)
- [小麥輸入法](https://mcbopomofo.openvanilla.org/)
- [超注音](http://www.superkbd.com/)
- [中州韻輸入法引擎](https://rime.im/)

其中**中州韻輸入法引擎**最吸引我的眼球，效能好，設定方式很工程師(誤)，本身開源，GitHub 上一直都有持續的維護更新等等，都很符合我的口味！

因此此篇稍微記錄一下安裝跟配置方式，提供日後 OS 重裝後的參考

## Install

可以從官方 [Downlaod Page](https://rime.im/download/) 下載安裝檔，或使用 [Homebrew](https://brew.sh/) 來安裝:

```sh
brew install --cask squirrel
```

## Setup

安裝好後, 所有相關的配置可以從 menu 中的輸入法中進入, 更改配置後都需要重新點擊 **Deploy** 始得生效

![](/spaces/umani/attachments/rime-input.png)

### Custom Settings

點選 **Settings**, 會開啟 Rime 的目錄, MacOS 預設目錄在:

```sh
/Users/{username}/Library/Rime
```

在該錄中建立 `default.custom.yaml` 檔案

```sh
touch /Users/{username}/Library/Rime/default.custom.yaml
```

`default.custom.yaml` 是用來覆蓋全域性的配置檔案, 你只需要把想要調整的設定項目放在 `patch` 下, 如:

```yaml
patch:
  some_setting: "some value"
  yet:
  	another_setting: 0
```

可以調整的設定項目可參考官方的[CustomizationGuide](https://github.com/rime/home/wiki/CustomizationGuide) 或[完整的注音輸入 Schema](https://gist.github.com/lotem/3913578)

### My Settings

以下列出我目前的配置:

```yaml
# default.custom.yaml

patch:
  menu:
    page_size: 7  # 每頁顯示的選項數目
  key_binder:
    bindings:
      # 在 Rime 中加入"["和"]"翻頁按键绑定
      - { when: paging, accept: bracketleft, send: Page_Up }
      - { when: has_menu, accept: bracketright, send: Page_Down }
  schema_list:  # 按 F4 選擇輸入法出現的項目
    - schema: bopomofo  # 注音, 因為我只用注音囉
```

> schema_list 可參考 https://gist.github.com/mitnk/3401421

我大概只設了這些，沒有使用 [Sync](https://github.com/rime/home/wiki/UserGuide#%E5%90%8C%E6%AD%A5%E7%94%A8%E6%88%B6%E8%B3%87%E6%96%99) 等功能, 剩餘的配置都是使用預設就很好用囉!

## Uninstall
參考官方 [FAQ](https://github.com/rime/home/wiki/FAQ#%E5%A6%82%E4%BD%95%E5%8D%B8%E8%BC%89%E9%BC%A0%E9%AC%9A%E7%AE%A1squirrel)
## Reference
- [GitHub](https://github.com/rime)
- [Wiki](https://github.com/rime/home/wiki)
	- [UserGuide](https://github.com/rime/home/wiki/UserGuide)
	- [CustomizationGuide](https://github.com/rime/home/wiki/CustomizationGuide)
- [開源好用的輸入法--鼠鬚管](https://intergroup.gitbook.io/080/yuan-hao-yong-de-ru-fa-shu-guan)
