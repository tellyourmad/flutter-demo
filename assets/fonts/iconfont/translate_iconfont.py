# coding: u8

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent.parent
MAIN = ROOT

# 将 iconfont 的 css 自动转换为 dart 代码

def translate():
    print('Begin translate...')

    code =""" 
import 'package:flutter/widgets.dart';
class IconFonts {
    IconFonts._();
    static const font_name = 'IconFonts'; 
    {icon_codes} 
} 
    """.strip()


    
    strings = []
    tmp = []
    p = re.compile(r'.WebApp-(.*?):.*?"\\(.*?)";')
    
    content = open(MAIN / 'assets/fonts/iconfont/iconfont.css').read().replace('\n  content', 'content')

    for line in content.splitlines():
        line = line.strip()
        if line:
            res = p.findall(line) 
            if res:
                name, value = res[0]
                name = name.replace('-', '_')
                tmp.append((name.lower(), value))
    
    tmp.sort()

    for name, value in tmp:
        string = f'  static const IconData {name} = const IconData(0x{value}, fontFamily: font_name);'
        strings.append(string)

    strings = '\n'.join(strings)
    code = code.replace('{icon_codes}', strings)

    # dart文件，生成路径
    open(MAIN / 'lib/widgets/basic/iconfont_widget.dart', 'w').write(code)

    print('Finish translate...')



if __name__ == "__main__":
    translate()