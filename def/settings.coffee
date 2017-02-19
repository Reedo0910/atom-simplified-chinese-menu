module.exports =

  localize: () ->
    $ = require 'jquery'
    pref = $('.settings-view')

    pref.find('a.icon.icon-settings').html('功能')
    pref.find('a.icon.icon-code').html('编辑')
    pref.find('a.icon.icon-device-desktop').html('系统')
    pref.find('a.icon.icon-keyboard').html('快捷键')
    pref.find('a.icon.icon-package').html('扩展包')
    pref.find('a.icon.icon-paintcan').html('主题')
    pref.find('a.icon.icon-cloud-download').html('更新')
    pref.find('a.icon.icon-plus').html('安装扩展包/主题')
    pref.find('button.icon.icon-link-external:contains("Open Config Folder")').html('打开设置目录')

    if pref.find('.panels').children().length < 8

      # Assign font(s) while running under Windows OS
      if process.platform == 'win32'
        pref.css 'font-size', '12px'

        font = atom.config.get('editor.fontFamily')
        if font.length != 0
        then pref.css 'font-family', font
        else pref.css 'font-family', '微软雅黑'

      # Load all panels into DOM
      lastMenu = pref.find('.panels-menu .active a')
      pref.find('.panels-menu li a').click()
      lastMenu.click()

      # Init
      localizeSettings()
      localizeEditings()
      localizeSystems()
      localizeKeybindings()
      localizePackages()
      localizeThemes()
      localizeUpdates()
      localizeInstall()
      localizeButtons()


localizeSettings = () ->
    $ = require 'jquery'
    pref = $('.settings-view')

    console.log('setting')

    pref.find('div.block.section-heading.icon.icon-settings:contains("Core Settings")').html('核心设置')
    pref.find('#core-settings-note').html('以下为文字编辑功能以外的 Atom 功能设置，个别扩展包可能包含自己的设置。若要浏览某个扩展包的设置，请到「<a class="link packages-open">已安装的扩展包</a>」卡片列表中选择该扩展包的设置。')

    pref.find('label[for="core.allowPendingPaneItems"]').children('.setting-title').html('允许挂起窗格项目')
    pref.find('label[for="core.allowPendingPaneItems"]').next('.setting-description').html('允许在同一个标签页内连续预览文件，而不需将文件逐一加入窗格。例如：在文件列表面板中用鼠标单击数个文件时，即可在挂起的标签页内连续预览。')
    pref.find('label[for="core.audioBeep"]').children('.setting-title').html('提示音')
    pref.find('label[for="core.audioBeep"]').next('.setting-description').html('当操作无效或无结果可显示时，使用提示音警告。')
    pref.find('label[for="core.automaticallyUpdate"]').children('.setting-title').html('自动更新')
    pref.find('label[for="core.automaticallyUpdate"]').next('.setting-description').html('当有新版本的时候，自动更新 Atom。')
    pref.find('label[for="core.closeEmptyWindows"]').children('.setting-title').html('自动关闭空窗口')
    pref.find('label[for="core.closeEmptyWindows"]').next('.setting-description').html('当试图关闭标签页时，如果该窗口无其他开启的标签页或窗格，则关闭该窗口。')
    pref.find('label[for="core.autoHideMenuBar"]').children('.setting-title').html('自动隐藏菜单栏')
    pref.find('label[for="core.autoHideMenuBar"]').next('.setting-description').html('自动隐藏菜单栏后，可以按下 Alt 鍵使其暂时出现。这个设置只适用于 Windows 和 Linux 操作系统。')
    pref.find('label[for="core.destroyEmptyPanes"]').children('.setting-title').html('自动关闭空窗格')
    pref.find('label[for="core.destroyEmptyPanes"]').next('.setting-description').html('当分割窗格中最后一个标签页被关闭时，也关闭该分割窗格。')
    pref.find('label[for="core.excludeVcsIgnoredPaths"]').children('.setting-title').html('让扩展包排除「版本控制系统 (VCS)」指定忽略的路径')
    pref.find('label[for="core.excludeVcsIgnoredPaths"]').next('.setting-description').html('让某些扩展包排除目前项目的 VCS 制定忽略的文件或目录，如：模糊查找、查找与取代。举例来说，使用 Git 的项目将忽略 .gitignore 中指定的路径。另外，个别的扩展包可能包含额外的关于 VCS 忽略文件和文件夹的设置。')

    pref.find('select[id="core.fileEncoding"]').prev('label').children('.setting-title').html('文件编码')
    pref.find('select[id="core.fileEncoding"]').prev('label').children('.setting-description').html('指定读写文件时所用的默认字符集编码。')

    pref.find('label[for="core.followSymlinks"]').children('.setting-title').html('允许使用符号链接')
    pref.find('label[for="core.followSymlinks"]').next('.setting-description').html('当使用模糊查找时，允许查找以及允许打开使用符号链接所定义的项目。')

    pref.find('atom-text-editor[id="core.ignoredNames"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('忽略的文件/文件夹名')
    pref.find('atom-text-editor[id="core.ignoredNames"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('在此输入glob模式字符串匹配规则。符合规则的文件和目录将会被某些扩展包忽略，如：模糊查找和文件列表面板。个别的扩展包可能包含额外的忽略规则设定。')

    pref.find('label[for="core.openEmptyEditorOnStart"]').children('.setting-title').html('启动时打开空白的编辑器')
    pref.find('label[for="core.openEmptyEditorOnStart"]').next('.setting-description').html('启动 Atom 时自动打开空白的编辑器。')

    pref.find('atom-text-editor[id="core.packagesWithKeymapsDisabled"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('禁用带键盘映射的扩展包')

    pref.find('atom-text-editor[id="core.projectHome"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('默认的项目根目录')
    pref.find('atom-text-editor[id="core.projectHome"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('所有项目都假定被放在该目录下。使用 Package Generator 生成的扩展包原始文件也会被放在该目录下。')

    pref.find('atom-text-editor[id="core.reopenProjectMenuCount"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('「重新打开项目」菜单的条目数')
    pref.find('atom-text-editor[id="core.reopenProjectMenuCount"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('在「重新打开项目」菜单中显示多少个最近的项目。')

    pref.find('label[for="core.restorePreviousWindowsOnStart"]').children('.setting-title').html('在启动时恢复之前打开的窗口')
    pref.find('label[for="core.restorePreviousWindowsOnStart"]').next('.setting-description').html('当选中时，通过图标启动或通过命令行自身的<code>atom</code>命令启动Atom时，恢复所有Atom窗口的最后状态; 否则加载空白环境。')

    pref.find('select[id="core.telemetryConsent"]').prev('label').children('.setting-title').html('向Atom小组发送遥测')
    pref.find('select[id="core.telemetryConsent"]').prev('label').children('.setting-description').html('允许将使用统计信息和例外报告发送到Atom小组，以帮助改进产品。')
    pref.find('select[id="core.telemetryConsent"]').children('option[value="limited"]').html('允许有限的匿名使用统计信息、异常和崩溃报告')
    pref.find('select[id="core.telemetryConsent"]').children('option[value="no"]').html('不发送任何遥测数据')
    pref.find('select[id="core.telemetryConsent"]').children('option[value="undecided"]').html('未定（Atom会在下次启动时再次询问）')

    pref.find('atom-text-editor[id="core.warnOnLargeFileLimit"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('大文件限制警告')
    pref.find('atom-text-editor[id="core.warnOnLargeFileLimit"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('在打开大于此兆字节数的文件之前警告。')


localizeEditings = () ->
    $ = require 'jquery'
    pref = $('.settings-view')

    pref.find('div.block.section-heading.icon.icon-code:contains("Editor Settings")').html('编辑器设置')
    pref.find('#editor-settings-note').html('以下为文字编辑相关的设置。部分设置可能会被相关编程语言的扩展包所覆盖。如果要浏览编程语言的扩展包设置，请到「<a class="link packages-open">已安装的扩展包</a>」卡片列表中设置该语言。')

    pref.find('label[for="editor.atomicSoftTabs"]').next('.setting-description').html('在移动光标经过前置的空格时，跳过一个制表符(tab)的长度。')

    pref.find('label[for="editor.autoIndent"]').children('.setting-title').html('自动缩进')
    pref.find('label[for="editor.autoIndent"]').next('.setting-description').html('在新增行时自动缩进游标，使其对齐上一行。')

    pref.find('label[for="editor.autoIndentOnPaste"]').children('.setting-title').html('粘贴时自动缩进')
    pref.find('label[for="editor.autoIndentOnPaste"]').next('.setting-description').html('根据上一行自动缩进粘贴的文本内容。')

    pref.find('label[for="editor.backUpBeforeSaving"]').children('.setting-title').html('自动备份')
    pref.find('label[for="editor.backUpBeforeSaving"]').next('.setting-description').html('生成一个临时备份，以免在保存过程中不幸产生的读写错误导致项目内容丢失。')

    pref.find('label[for="editor.confirmCheckoutHeadRevision"]').children('.setting-title').html('确认是否让 Checkout 变更 HEAD')
    pref.find('label[for="editor.confirmCheckoutHeadRevision"]').next('.setting-description').html('当执行 checkout 将变更 HEAD，或在最后一次 commit 后却放弃当前项目的变更时，弹出确认对话框。')

    pref.find('atom-text-editor[id="editor.fontFamily"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('编辑器字体')
    pref.find('atom-text-editor[id="editor.fontFamily"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('指定文字编辑器使用的字体名。')

    pref.find('atom-text-editor[id="editor.fontSize"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('文字大小')
    pref.find('atom-text-editor[id="editor.fontSize"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('编辑器内的文字高度，单位：像素(px)')

    pref.find('.sub-section-heading.has-items:contains("Invisibles")').html('隐藏字符')

    pref.find('atom-text-editor[id="editor.invisibles.cr"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('回车(Cr)显示为:')
    pref.find('atom-text-editor[id="editor.invisibles.cr"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>显示隐藏字符</code>设置打勾时，微软(Microsoft)格式的回车将用以下字符表示。')

    pref.find('atom-text-editor[id="editor.invisibles.eol"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('换行(Eol)显示为:')
    pref.find('atom-text-editor[id="editor.invisibles.eol"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>显示隐藏字符</code>设置打勾时，\\n 格式的换行将用以下字符表示。')

    pref.find('atom-text-editor[id="editor.invisibles.space"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('空格(space)显示为:')
    pref.find('atom-text-editor[id="editor.invisibles.space"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>显示隐藏字符</code>设置打勾时，行首与行尾的空格将用以下字符表示。')

    pref.find('atom-text-editor[id="editor.invisibles.tab"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('制表符(tab)显示为:')
    pref.find('atom-text-editor[id="editor.invisibles.tab"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>显示隐藏字符</code>设置打勾时，\\t 定位将用以下字符表示。')

    pref.find('atom-text-editor[id="editor.lineHeight"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('行高')
    pref.find('atom-text-editor[id="editor.lineHeight"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('编辑器內的文字行高，即文字大小(高度)的倍数。')

    pref.find('atom-text-editor[id="editor.nonWordCharacters"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('不被视为单词的字符')
    pref.find('atom-text-editor[id="editor.nonWordCharacters"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('下列字符将不被视为单词，而是拿来作为单词的边界。')

    pref.find('atom-text-editor[id="editor.preferredLineLength"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('每一行的长度')
    pref.find('atom-text-editor[id="editor.preferredLineLength"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>自动换行</code>设置打勾后，定义每一行自动换行的长度，单位：字符。')

    pref.find('label[for="editor.scrollPastEnd"]').children('.setting-title').html('滚动范围不受文档高度限制')
    pref.find('label[for="editor.scrollPastEnd"]').next('.setting-description').html('允许编辑器越过文档的最后一行继续向下滚动。')

    pref.find('atom-text-editor[id="editor.scrollSensitivity"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('滚动速度')
    pref.find('atom-text-editor[id="editor.scrollSensitivity"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('指定编辑器中使用鼠标或触控板滚动的速度。')

    pref.find('label[for="editor.showIndentGuide"]').children('.setting-title').html('显示缩进对齐线')
    pref.find('label[for="editor.showIndentGuide"]').next('.setting-description').html('在编辑器中显示缩进的对齐线。')

    pref.find('label[for="editor.showInvisibles"]').children('.setting-title').html('显示隐藏字符')
    pref.find('label[for="editor.showInvisibles"]').next('.setting-description').html('在编辑器中显示隐藏字符的代表符号，如制表符、空格或回车。')

    pref.find('label[for="editor.showLineNumbers"]').children('.setting-title').html('显示行号')
    pref.find('label[for="editor.showLineNumbers"]').next('.setting-description').html('在编辑器的侧方显示行号。')

    pref.find('label[for="editor.softTabs"]').children('.setting-title').html('Soft Tabs')
    pref.find('label[for="editor.softTabs"]').next('.setting-description').html('如果<code>制表符(tab)类型</code>设置为「自动(auto)」，而自动判断结果却失效时，则当此设定打勾时，会改用「soft tab」，否则将用「hard tab」插入制表符。')

    pref.find('label[for="editor.softWrap"]').children('.setting-title').html('自动换行')
    pref.find('label[for="editor.softWrap"]').next('.setting-description').html('每行长度超过窗口宽度时，自动换行。然而当<code>在指定长度换行</code>设置打勾时，换行长度将使用<code>每一行的长度</code>内的数值，而不是窗口宽度。')

    pref.find('label[for="editor.softWrapAtPreferredLineLength"]').children('.setting-title').html('在指定长度换行')
    pref.find('label[for="editor.softWrapAtPreferredLineLength"]').next('.setting-description').html('文字长度超过<code>每一行的长度</code>内的数值时，自动换行。这项设置只有在<code>自动换行</code>设置打勾时，或菜单栏 > 查看 > 自动换行启用时才有效果。')

    pref.find('atom-text-editor[id="editor.softWrapHangingIndent"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('悬挂缩进')
    pref.find('atom-text-editor[id="editor.softWrapHangingIndent"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('<code>自动换行</code>设置打勾时，第二行以下额外缩进的长度，单位：字符。')

    pref.find('atom-text-editor[id="editor.tabLength"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('制表符 (tab) 长度')
    pref.find('atom-text-editor[id="editor.tabLength"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('在此指定空白字符的数量，用以代表每个制表符 (tab) 的长度。')

    pref.find('select[id="editor.tabType"]').prev('label').children('.setting-title').html('制表符 (tab) 类型')
    pref.find('select[id="editor.tabType"]').prev('label').children('.setting-description').html('当按下键盘制表定位键 (tab) 时，插入的字符。有三种类型：「auto」、「soft」或 「hard」。「soft」使用空格字符 (space)，「hard」使用制表符字符 (tab)。「auto」模式将会使用该行行首的空格字符或制表符字符。如果自动判断失效，则将会直接采用<code>Soft Tabs</code>中的设置值。')

    pref.find('atom-text-editor[id="editor.undoGroupingInterval"]').parents('.controls').eq(0).prev('label').children('.setting-title').html('合并一段时间内的还原动作')
    pref.find('atom-text-editor[id="editor.undoGroupingInterval"]').parents('.controls').eq(0).prev('label').children('.setting-description').html('编辑过程产生的还原动作历史纪录，将以此时间长度值进行合并，单位：毫秒。')

    pref.find('label[for="editor.useShadowDOM"]').children('.setting-title').html('启用 Shadow DOM')
    pref.find('label[for="editor.useShadowDOM"]').next('.setting-description').html('如果您遇到扩展包或者主题在变更外观样式上的问题，请禁用此设置。请您及时向该扩展包或主题提出 issue，因为该设置将在以后的更新中被移除。')

    pref.find('label[for="editor.zoomFontWhenCtrlScrolling"]').children('.setting-title').html('使用 Ctrl + 鼠标滚轮缩放文字大小')
    pref.find('label[for="editor.zoomFontWhenCtrlScrolling"]').next('.setting-description').html('使用 Ctrl 键和鼠标滚轮上下滚动改变编辑器内的文字大小。')



localizeSystems = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  pref.find('div.block.section-heading.icon.icon-device-desktop:contains("System Settings")').html('系统设置')
  pref.find('div.block.section-heading.icon.icon-device-desktop').next('.text.icon.icon-question').html('这些设置决定了 Atom 与您的操作系统的集成方式。')

  pref.find('label[for="system.windows.file-handler"]').children('.setting-title').html('注册 Atom 为文件处理程序')
  pref.find('label[for="system.windows.file-handler"]').children('.setting-description').html('在「打开方式」程序列表中显示 Atom ，以方便与文件类型关联。')

  pref.find('label[for="system.windows.shell-menu-files"]').children('.setting-title').html('在 文件 右键菜单中显示 Atom')
  pref.find('label[for="system.windows.shell-menu-files"]').children('.setting-description').html('在文件管理器中的 文件 右键菜单中添加「使用 Atom 打开(Open with Atom)」选项。')

  pref.find('label[for="system.windows.shell-menu-folders"]').children('.setting-title').html('在 文件夹 右键菜单中显示 Atom')
  pref.find('label[for="system.windows.shell-menu-folders"]').children('.setting-description').html('在文件管理器中的 文件夹 右键菜单中添加「使用 Atom 打开(Open with Atom)」选项。')



localizeKeybindings = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  pref.find('.section-heading.icon.icon-keyboard:contains("Keybindings")').html('快捷键')

  temp = pref.find('.keybinding-panel div.text.native-key-bindings').children()
  temp.eq(1).html('您能覆盖这些快捷键设置。只要按下&nbsp;')
  temp.eq(3).html('图标进行复制，并粘贴到您的&nbsp;')
  temp.eq(4).html('快捷键设置文件&nbsp;')
  temp.eq(4).after('<span>中修改即可。</span>') if temp.length == 5

  pref.find('table th.keystroke').html('按键')
  pref.find('table th.command').html('指令操作')
  pref.find('table th.source').html('来源')
  pref.find('table th.selector').html('选择器')



localizePackages = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  temp = pref.find('.section-heading.icon.icon-package:contains("Installed Packages")')
  temp.contents().first()[0].textContent='已安装的扩展包' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-package:contains("Deprecated Packages")')
  temp.contents().first()[0].textContent='已过期的扩展包' if temp.length > 0

  pref.find('section.sub-section.deprecated-packages p').html('Atom 不会载入过期的扩展包。这些扩展包可能有提供更新。')

  temp = pref.find('.sub-section-heading.icon.icon-package:contains("Community Packages")')
  temp.contents().first()[0].textContent='来自社区的扩展包' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-package:contains("Core Packages")')
  temp.contents().first()[0].textContent='核心扩展包' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-package:contains("Development Packages")')
  temp.contents().first()[0].textContent='开发中的扩展包' if temp.length > 0

  si = setInterval((->
    temp = pref.find('.icon.icon-dashboard.native-key-bindings:contains("This package added ")')
    if temp.length != 0
      temp.html temp.html().replace('This package added ', '这个扩展包增加了 ').replace(' to startup time.', ' 的启动时间。')
  ), 0)



localizeThemes = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  pref.find('.section-heading.icon.icon-paintcan:contains("Choose a Theme")').html('选择一个主题')

  temp = pref.find('.themes-panel div.text.native-key-bindings').children()
  temp.eq(0).html('您也能直接修改&nbsp;')
  temp.eq(1).html('Atom 样式表&nbsp;')
  temp.eq(1).after('<span>来手动调整外观与颜色。</span>') if temp.length == 2

  pref.find('label > div.setting-title.themes-label.text').eq(0).html('界面主题')
  pref.find('label > div.setting-description.text.theme-description').eq(0).html('标签页、状态栏、文件列表面板、下拉菜单的外观。')

  pref.find('label > div.setting-title.themes-label.text').eq(1).html('代码主题')
  pref.find('label > div.setting-description.text.theme-description').eq(1).html('代码语法的顏色与文字编辑器的外观。')

  temp = pref.find('.section-heading.icon.icon-paintcan:contains("Installed Themes")')
  temp.contents().first()[0].textContent='已安装的主题' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-paintcan:contains("Community Themes")')
  temp.contents().first()[0].textContent='来自社区的主题' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-paintcan:contains("Core Themes")')
  temp.contents().first()[0].textContent='核心主题' if temp.length > 0

  temp = pref.find('.sub-section-heading.icon.icon-paintcan:contains("Development Themes")')
  temp.contents().first()[0].textContent='开发中的主题' if temp.length > 0



localizeUpdates = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

  temp = pref.find('.section-heading.icon.icon-cloud-download:contains("Available Updates")')
  temp.contents().last()[0].textContent='可用的更新' if temp.length > 0

  pref.find('.alert-info.icon.icon-hourglass').html('检查更新中...')
  pref.find('.alert-info.icon.icon-heart').html('您所有的扩展包都已经是最新版本了。')





localizeInstall = () ->
  $ = require 'jquery'
  pref = $('.settings-view')

 # console.log("install")

  si = setInterval((->
    pref.find('.section-heading.icon.icon-plus:contains("Install Packages")').html('安装扩展包')
    pref.find('.section-heading.icon.icon-plus:contains("Install Themes")').html('安装主题')

    temp = pref.find('span:contains("Packages are published to ")').parent().children()
    temp.eq(1).html('扩展包均发布在 ')
    temp.eq(3).html (index, html) ->
      html.replace ' and are installed to ', ' 并安装在 '
    temp.eq(3).after('<span> 文件夹下。</span>') if temp.length == 4

    temp = pref.find('span:contains("Themes are published to ")').parent().children()
    temp.eq(1).html('主题均发布在 ')
    temp.eq(3).html (index, html) ->
      html.replace ' and are installed to ', ' 并安装在 '
    temp.eq(3).after('<span> 文件夹下。</span>') if temp.length == 4

    pref.find('.section-heading.icon.icon-star:contains("Featured Packages")').html('热门扩展包')
    pref.find('.section-heading.icon.icon-star:contains("Featured Themes")').html('热门主题')

    return
  ), 0)

localizeButtons = () ->
  $ = require('jquery')
  pref = $('.settings-view')

  si = setInterval((->
    pref.find('button:contains("Packages")').html '扩展包'
    pref.find('button:contains("Themes")').html '主题'
    pref.find('button:contains("Check for Updates")').html '检查更新'
    pref.find('button:contains("Update All")').html '更新全部'
    pref.find('button:contains("Update to")').html (index, html) ->
      html.replace 'Update to', '更新到'
    pref.find('button:contains("Update")').html '更新'
    pref.find('button:contains("Install Alternative")').html '安装新版'
    pref.find('button:contains("Install")').html '安装'
    pref.find('button:contains("Settings")').html '设置'
    pref.find('button:contains("Uninstall")').html '移除'
    pref.find('button .disable-text:contains("Disable")').html '停用'
    pref.find('button .disable-text:contains("Enable")').html '启用'

    pref.find('button:contains("View on Atom.io")').html '在 Atom.io 查看此扩展包'
    pref.find('button:contains("Report Issue")').html '报告 Issue'
    pref.find('button:contains("CHANGELOG")').html '更新历史'
    pref.find('button:contains("LICENSE")').html '授权许可'
    pref.find('button:contains("View Code")').html '查看源码'

    return
  ), 0)
  return
