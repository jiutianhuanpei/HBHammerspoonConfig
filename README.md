# HBHammerspoonConfig


* [init](#init)

* [HBLayout](#HBLayout)

---

快速配置方法，先退出app，再执行以下命令：

```
rm -rf ~/.hammerspoon
git clone https://github.com/jiutianhuanpei/HBHammerspoonConfig.git  ~/.hammerspoon
```

<h3 id="init">init.lua</h3>

这个文件是 app 的配置文件，现在写的很少：

![](https://ws3.sinaimg.cn/large/006tNc79ly1g1xugkygpfj30p406iq3n.jpg)

一个是快捷键 cmd+alt+ctrl+R 来重载 app 的配置文件；

一个是引用 HBLayout.lua 的模块；

以后可能会增加别的模块，都需要在这里引用。其中那个 alert，要写在引用之前，不然在按重载快捷键之后，如果模块内写的有误可能就没这个提示了。

<br/>

<h3 id="HBLayout">SHBLayout.lua</h3>

这是设置窗口位置的一个模块，主要代码如下：

```lua
-- shift ctrl alt cmd 可选
local mods = {"alt", "ctrl"}

-- 设置窗口位置
-- key：除 mods 之外的那个热键
-- alert：提示语，传 "" 时不提示
-- frame：窗口的位置，传入table，数值是主屏对应的 x y width height 的比例，0~1
local function HBLayout(key, alert, frame)
  HBSuperLayout(mods, key, alert, frame)  
end

HBLayout("left", "左", {0, 0, 0.5, 1})
HBLayout("right", "右", {0.5, 0, 0.5, 1})
HBLayout("up", "上", {0, 0, 1, 0.5})
HBLayout("down", "下", {0, 0.5, 1, 0.5})

HBLayout("pad4", "左上", {0, 0, 0.5, 0.5})
HBLayout("pad5", "右上", {0.5, 0, 0.5, 0.5})
HBLayout("pad1", "左下", {0, 0.5, 0.5, 0.5})
HBLayout("pad2", "右下", {0.5, 0.5, 0.5, 0.5})

HBLayout(",", "右大", {0, 0, 0.7, 1})
HBLayout(".", "左小", {0.7, 0, 0.3, 1})

HBLayout("space", "全屏", {0, 0, 1, 1})
HBLayout("tab", "居中", {0.2, 0.15, 0.6, 0.7})
```

封装了一个函数 `HBLayout` 用于快捷设置窗口的位置。

