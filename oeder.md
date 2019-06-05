- 查找并杀死进程  
>     ps -aux|grep "8889"|grep -v "grep"|awk '{print $2}'|xargs kill -9    
- 在所有py文件前 增加文件编码;  
>     find . -iname '*.py'| xargs sed -i '1 i # -*- coding: utf-8 -*-\n'
  



